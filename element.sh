
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

function MAIN {
if [[ -z $1 ]]
then
echo Please provide an element as an argument.
else

RESULT="$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE (atomic_number::VARCHAR) = ($1::VARCHAR) OR symbol = ($1::VARCHAR) OR name = ($1::VARCHAR)")"

#  #  ## echo "$RESULT"

while $RESULT | read ATOMIC_NUMBER _ NAME _ SYMBOL _ TYPE _ ATOMIC_MASS _ MELTING_POINT _ BOILING_POINT
do
echo "Atomic Number:$ATOMIC_NUMBER - $NAME - $SYMBOL  $TYPE $ATOMIC_MASS  $MELTING_POINT $BOILING_POINT"
done

fi
}

MAIN $1
