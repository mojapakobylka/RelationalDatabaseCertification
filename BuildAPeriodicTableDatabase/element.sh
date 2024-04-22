#!/bin/bash
# if argument is not used
if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# PSQL variable used to interact with database
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 =~ [0-9]+ ]]
then
  # if given argument is number 
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = '$1'")
else
  # if given argument is letter or word
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1'")  
fi

if [[ -z $ATOMIC_NUMBER ]]
then
  # if argument as atomic_number, symbol, or name is not present in database
  echo "I could not find that element in the database."
  exit
fi

SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
TYPE=$($PSQL "SELECT type FROM properties p INNER JOIN elements e ON p.atomic_number=e.atomic_number INNER JOIN types t ON p.type_id=t.type_id WHERE p.atomic_number = $ATOMIC_NUMBER")
ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties p INNER JOIN elements e ON p.atomic_number=e.atomic_number WHERE p.atomic_number = $ATOMIC_NUMBER")
MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties p INNER JOIN elements e ON p.atomic_number=e.atomic_number WHERE p.atomic_number = $ATOMIC_NUMBER")
BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties p INNER JOIN elements e ON p.atomic_number=e.atomic_number WHERE p.atomic_number = $ATOMIC_NUMBER")

# print information about selected element
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."