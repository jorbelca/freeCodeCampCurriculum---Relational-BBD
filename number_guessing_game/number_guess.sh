#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


GUESSES=1
RANDOM_NUM=$(shuf -i 1-1000 -n1)


PLAY() {
if [[ $1 =~ ^[0-9]+$  ]]
then
echo 'Guess the secret number between 1 and 1000:'
USER_ID=$1
fi


read INPUT_NUM
if [[ ! $INPUT_NUM =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
((GUESSES++))
PLAY 'A'
fi

if [[ $INPUT_NUM -eq $RANDOM_NUM ]]
then
INSERT_RECORD=$($PSQL "INSERT INTO games(user_id, guesses) VALUES ('$USER_ID', '$GUESSES') ")
echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUM. Nice job!"
fi

if [[ $RANDOM_NUM -lt $INPUT_NUM  ]]
then
echo "It's lower than that, guess again:"
((GUESSES++))
echo $NUMBER
PLAY 'B'
fi

if [[ $RANDOM_NUM -gt $INPUT_NUM ]]
then
echo "It's higher than that, guess again:"
((GUESSES++))
PLAY 'C'
fi

}


echo "Enter your username:"
read USERNAME
USER=$($PSQL "SELECT users.user_id from users where username = '$USERNAME'")
if [[ -z $USER ]]
then 
INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME') RETURNING user_id")
echo "Welcome, $USERNAME! It looks like this is your first time here."
ID=$(echo $INSERT_USER| sed 's/ INSERT 0 1//')
PLAY "$ID"
else
DETAILS=$($PSQL "SELECT COUNT(*),MIN(guesses) from games where user_id = '$USER'")
BEST_GAME=$(echo $DETAILS | sed 's/^[0-9][^|]*|//')
COUNT=$(echo $DETAILS | sed -r 's/^[^0-9]*([0-9]+).*$/\1/')
echo "Welcome back, $USERNAME! You have played $COUNT games, and your best game took $BEST_GAME guesses."
PLAY "$USER"
fi


