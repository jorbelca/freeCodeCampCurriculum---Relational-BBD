#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"





if [[ $1 =~ ^[0-9]+$ ]]
then
ATOMIC_NUM=$($PSQL "SELECT properties.atomic_number,properties.atomic_mass,properties.melting_point_celsius,properties.boiling_point_celsius,elements.symbol,elements.name, properties.type_id FROM properties INNER JOIN elements ON properties.atomic_number = elements.atomic_number where properties.atomic_number = '$1'")
if [[ ! $ATOMIC_NUM ]]
then 
echo I could not find that element in the database.
else
echo "$ATOMIC_NUM" | while read NUMBER T MASS L MELTING M BOILING N  SYMBOL  P NAME I TYPE_ID
do
TYPE=$($PSQL "SELECT type from types where type_id = '$TYPE_ID'")
echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a$TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
done
fi
fi  


if [[ $1 =~ ^[A-Za-z]{3,} ]]
then
ATOMIC_NUM=$($PSQL "SELECT properties.atomic_number,properties.atomic_mass,properties.melting_point_celsius,properties.boiling_point_celsius,elements.symbol,elements.name, properties.type_id FROM elements INNER JOIN properties ON properties.atomic_number = elements.atomic_number where elements.name = '$1'")
if [[ ! $ATOMIC_NUM ]]
then 
echo I could not find that element in the database.
else
echo "$ATOMIC_NUM" | while read NUMBER T MASS L MELTING M BOILING N  SYMBOL  P NAME I TYPE_ID
do
TYPE=$($PSQL "SELECT type from types where type_id = '$TYPE_ID'")
echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a$TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
done
fi 
fi 

if [[ $1 =~ ^[A-Za-z]{1,2} && ${#1} < 3 ]]
then
ATOMIC_NUM=$($PSQL "SELECT properties.atomic_number,properties.atomic_mass,properties.melting_point_celsius,properties.boiling_point_celsius,elements.symbol,elements.name, properties.type_id FROM elements INNER JOIN properties ON properties.atomic_number = elements.atomic_number where elements.symbol = '$1'")
if [[ ! $ATOMIC_NUM ]]
then 
echo I could not find that element in the database.
else
echo "$ATOMIC_NUM" | while read NUMBER T MASS L MELTING M BOILING N  SYMBOL  P NAME I TYPE_ID
do
TYPE=$($PSQL "SELECT type from types where type_id = '$TYPE_ID'")
echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a$TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
done
fi  
fi



if [[ -z $1 ]]
then
echo -e "Please provide an element as an argument."
exit
fi







