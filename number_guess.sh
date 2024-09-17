#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=guessing_game --tuples-only -c"

echo Enter your username:

read USER_NAME

USER_NAME_QUERY_RESPONSE=$($PSQL "SELECT games_played, best_game FROM users WHERE user_name='$USER_NAME'")

if [[ -n $USER_NAME_QUERY_RESPONSE ]];
then
  echo $USER_NAME_QUERY_RESPONSE | while read GAMES_PLAYED BAR BEST_GAME
  do
    echo -e "\nWelcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
else
  echo Welcome, $USER_NAME! It looks like this is your first time here.
  NEW_USER_INPUT_RESPONSE=$($PSQL "INSERT INTO users(user_name, games_played, best_game) VALUES('$USER_NAME',0,-1)")
fi

NUM=$((RANDOM%(1000)+1))
echo Number is $NUM

echo "Guess the secret number between 1 and 1000:"
read GUESS
declare -i NUMBER_OF_GUESSES=1
while ! [[ $GUESS =~ ^-?[0-9]+$ ]]
do
  echo That is not an integer, guess again:
  read GUESS
  ((NUMBER_OF_GUESSES+=1))
done


while [[ $NUM -ne $GUESS ]]
do
  if [[ $NUM -gt $GUESS ]];
  then
    echo "It's higher than that, guess again:"
    read GUESS
    while ! [[ $GUESS =~ ^-?[0-9]+$ ]]
    do
      echo That is not an integer, guess again:
      read GUESS
      ((NUMBER_OF_GUESSES+=1))
    done
    ((NUMBER_OF_GUESSES+=1))
  else
    echo "It's lower than that, guess again:"
    read GUESS
    while ! [[ $GUESS =~ ^-?[0-9]+$ ]]
    do
      echo That is not an integer, guess again:
      read GUESS
      ((NUMBER_OF_GUESSES+=1))
    done
    ((NUMBER_OF_GUESSES+=1))
  fi
done

echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUM. Nice job!

GAMES_PLAYED_UPDATE_RESULT=$($PSQL "UPDATE users 
                                    SET games_played = games_played + 1
                                    WHERE user_name = '$USER_NAME'"
                            )

BEST_GAME_RESULT=$($PSQL "SELECT best_game
                          FROM users
                          WHERE user_name='$USER_NAME'"
                  )

if [[ $BEST_GAME_RESULT -eq -1 || $BEST_GAME_RESULT -gt $NUMBER_OF_GUESSES ]];
then
  UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users
                                    SET best_game = $NUMBER_OF_GUESSES
                                    WHERE user_name = '$USER_NAME'"
                            )
fi
