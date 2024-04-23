#!/bin/bash

# variables used to interact with database
PSQLq="psql --username=freecodecamp --dbname=number_guess -t --no-align -q -c"
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# ask user for username
echo "Enter your username:"
read USERNAME

USER_ID_RESULT=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID_RESULT ]]
then
  # user has not been found in database yet
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # write new user to table users
  $PSQLq "INSERT INTO users(username) VALUES ('$USERNAME')"
else
  # user already written in database
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID_RESULT")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID_RESULT")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# generate number to be guessed
SECRET_NUMBER=$(($RANDOM % (1000 - 1 + 1) + 1))

# read guess from user
echo "Guess the secret number between 1 and 1000:"
read GUESS
NUMBER_OF_GUESSES=1;

while [[ $GUESS != $SECRET_NUMBER ]]
do
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    # guess is integer
    if [[ $GUESS > $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    fi

    if [[ $GUESS < $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    fi

    read GUESS
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
  else
    # guess is not integer
    echo "That is not an integer, guess again:"
    read GUESS
  fi
done 

# get user_id from database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# write result of game to database
$PSQLq "INSERT INTO games(number_of_guesses, user_id) VALUES ($NUMBER_OF_GUESSES, $USER_ID)"

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"