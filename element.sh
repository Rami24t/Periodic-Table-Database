
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

function MAIN {
if [[ -z $1 ]]
then
echo Please provide an element as an argument.
else

RESULT="$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE (atomic_number::VARCHAR) = ('$1'::VARCHAR) OR symbol = ('$1'::VARCHAR) OR name = ('$1'::VARCHAR)")"

# echo "$RESULT"


echo $RESULT | while IFS='|' read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT
do
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done

fi
}

MAIN $1
