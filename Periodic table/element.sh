#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then 
  echo "Please provide an element as an argument."
  exit 
fi

length=${#1}
if [[ $1 =~ ^[a-zA-Z]+$ && $length -le 2 ]]
then 
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
elif [[ $1 =~ ^[a-zA-Z]+$ ]] 
then
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
elif [[ $1 =~ ^[0-9]+$ ]]
then
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
fi 

if [[ -z $ATOMIC_NUMBER ]]
then
  echo "I could not find that element in the database."
else
  DATA=$($PSQL "SELECT name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")

  IFS="|" read NAME SYMBOL TYPE MASS MELTING_POINT BOILING_POINT <<< "$DATA"

  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
fi