#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams,games")
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do

#insert winner
if [[ $WINNER != "winner" ]]

then
INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
echo  $WINNER 
fi


#insert opponent
if [[ $OPPONENT != "opponent" ]]

then
INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
echo  $OPPONENT 
fi

#insert in games
if [[ $YEAR != "year" ]]
#&& $ROUND != "round" && $WINNER_GOALS != "winner_goals" && $OPPONENT_GOALS != "opponent_goals"
WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
then
INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID','$OPPONENT_ID','$WINNER_GOALS', '$OPPONENT_GOALS')")
echo  $YEAR
fi


done