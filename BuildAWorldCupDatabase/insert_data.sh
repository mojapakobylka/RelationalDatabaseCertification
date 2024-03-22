#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$PSQL "TRUNCATE TABLE games,teams"

# fill in table teams
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $winner != "winner" && $opponent != "opponent" ]]
  then
    ISWRITTEN="$($PSQL "SELECT name FROM teams WHERE name='$winner'")"
    if [[ -z $ISWRITTEN ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES('$winner')"
    fi

    ISWRITTEN="$($PSQL "SELECT name FROM teams WHERE name='$opponent'")"
    if [[ -z $ISWRITTEN ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES('$opponent')"
    fi
  fi
done

# fill in table games
tail -n +2 games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  WINNER_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")"
  OPPONENT_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")"
  $PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($year,'$round',$WINNER_ID,$OPPONENT_ID,$winner_goals,$opponent_goals)"
done

