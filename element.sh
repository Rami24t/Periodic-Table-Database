#!/bin/bash

# A bash script that accepts an argument in the form of an atomic number, symbol, or name of an element
# and outputs some information about the given element. 

# A PSQL variable for querying the database:
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"



function MAIN {
# If you run ./element.sh, it should output only Please provide an element as an argument. and finish running.
if [[ -z $1 ]]
then
echo -e "Please provide an element as an argument."
else

RESULT="$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE (atomic_number::VARCHAR) = ('$1'::VARCHAR) OR symbol = ('$1'::VARCHAR) OR name = ('$1'::VARCHAR)")"

if [[ $RESULT ]]
then
# If you run ./element.sh 1, ./element.sh H, or ./element.sh Hydrogen, it should output only: 
# The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
# If you run ./element.sh script with another element as input, you should get the same output but with information associated with the given element.
echo $RESULT | while IFS='|' read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
do
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done
else
# If the argument input to your element.sh script doesn't exist as an atomic_number, symbol, or name in the database,
# the only output should be: I could not find that element in the database.
echo "I could not find that element in the database."
fi
fi
}

MAIN $1
