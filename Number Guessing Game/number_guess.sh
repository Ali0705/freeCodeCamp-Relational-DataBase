#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"
#echo $RANDOM

function GAME() {
  echo "Guess the secret number between 1 and 1000:"
  SECRET_NUMBER=$((RANDOM % (1000 - 1 + 1) + 1))
  read USER_GUESS
  NUMBER_OF_GUESSES=1
  echo $SECRET_NUMBER
  while [[ $USER_GUESS -ne $SECRET_NUMBER ]] 
  do
    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]] 
    then 
      echo "That is not an integer, guess again:"
      ((--NUMBER_OF_GUESSES))
    elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
    then 
      echo "It's lower than that, guess again:"
    elif [[ $USER_GUESS -lt $SECRET_NUMBER ]] 
    then
      echo "It's higher than that, guess again:"
    fi
    read USER_GUESS
    ((++NUMBER_OF_GUESSES))
  done
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  $PSQL "UPDATE games SET games_played = games_played + 1, best_game = CASE 
    WHEN best_game = 0 OR $NUMBER_OF_GUESSES < best_game THEN $NUMBER_OF_GUESSES 
    ELSE best_game 
  END 
  WHERE user_id=$1" > /dev/null
}

echo Enter your username:
read NAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$NAME'")

if [[ -z $USER_ID ]] 
then 
  USER_ID=$($PSQL "INSERT INTO users(username) VALUES('$NAME') RETURNING user_id" | grep -oE '[0-9]+' | head -n 1)
  $PSQL "INSERT INTO games(user_id, games_played, best_game) VALUES($USER_ID, 0, 0)" > /dev/null
  echo "Welcome, $NAME! It looks like this is your first time here."
  GAME $USER_ID
 else
  DATA=$($PSQL "SELECT username, games_played, best_game FROM users INNER JOIN games ON users.user_id = games.user_id WHERE users.user_id=$USER_ID")

  IFS="|" read USERNAME GAMES_PLAYED BEST_GAMES <<< "$DATA"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAMES guesses."
  GAME $USER_ID $GAMES_PLAYED $BEST_GAMES 
fi 

