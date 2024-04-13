#!/bin/bash
echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?"

#variable used to interact with database
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

#write list of services from database
WRITE_LIST_OF_SERVICES() {
  SERVICES=$($PSQL "SELECT * FROM services")
  echo -e "\n"

  if [[ $1 ]]
  then
    echo "$1"
  fi

  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
}

MAIN_PROGRAM () {
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  if [[ -z $SERVICE_NAME ]]
  then
    #given service_id does not exist in services table
    WRITE_LIST_OF_SERVICES "I could not find that service. What would you like today?"
    MAIN_PROGRAM
  else
    #given service exists in services table
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_NAME ]]
    then
      #customer phone is not present in customers table yet
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      #insert record into customers table
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    fi

    #customer phone already inserted in customers table
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #insert record into appointments table 
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  fi
}

#function calls
WRITE_LIST_OF_SERVICES
MAIN_PROGRAM