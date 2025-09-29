#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games;")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
#Insert Teams names
  if [[ $WINNER != "winner" && $OPPONENT != "opponent" ]]
  then

    WINNER_NAME=$($PSQL "SELECT name FROM teams WHERE name='$WINNER';")

    if [[ -z $WINNER_NAME ]]
    then
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER') ")

      if [[ $INSERT_WINNER_RESULT = "INSERT 0 1" ]]
      then 
        echo Inserted into teams, $WINNER
      fi  
    fi

        OPPONENT_NAME=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT';")

    if [[ -z $OPPONENT_NAME ]]
    then
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

      if [[ $INSERT_OPPONENT_RESULT = "INSERT 0 1" ]]
      then 
        echo Inserted into teams, $OPPONENT
      fi  
    fi
        
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    INSERT_RESULT=$($PSQL "INSERT INTO games(winner_id, opponent_id, year, round, winner_goals, opponent_goals)
    VALUES($WINNER_ID, $OPPONENT_ID, $YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS);")
    if [[ $INSERT_RESULT == "INSERT 0 1" ]]
    then 
      echo Inserted into games, $WINNER_ID, $OPPONENT_ID, $YEAR, $ROUND, $WINNER_GOALS, $OPPONENT_GOALS
    fi

  fi   

done
