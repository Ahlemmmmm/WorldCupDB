#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Empty tables to allow re-run safely
$PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY CASCADE;"

# Read the CSV file and insert data
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  # skip the header line
  if [[ $YEAR != "year" ]]
  then
    # escape single quotes for SQL
    WINNER_ESC=$(echo "$WINNER" | sed "s/'/''/g")
    OPP_ESC=$(echo "$OPPONENT" | sed "s/'/''/g")

    # insert winner team if not exists
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER_ESC';")
    if [[ -z $WINNER_ID ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES('$WINNER_ESC');"
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER_ESC';")
    fi

    # insert opponent team if not exists
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP_ESC';")
    if [[ -z $OPPONENT_ID ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES('$OPP_ESC');"
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPP_ESC';")
    fi

    # insert the game row using the retrieved IDs
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WGOALS, $OGOALS);"
  fi
done
