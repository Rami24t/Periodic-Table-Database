# fCC Certifications | Relational Database |  Periodic Table Database Project
 For this project, I needed to fix and develop a PostgreSQL periodic table database and then create a bash script program that retrieves information from the database based on a cli-user-provided argument.

## Completed User Stories and Followed Instructions

I was started with a periodic_table database that has information about some chemical elements and have completed all of the "Periodic Table Database" tasks and user stories listed below in order to finish the project. After getting all the tests to pass, I have saved a copy of [my PostgreSQL database dump file 'periodic_table.sql' of my solution's database](https://github.com/Rami24t/Periodic-Table-Database/blob/main/periodic_table.sql), as well as of [the final version of 'element.sh', my solution's bash script file](https://github.com/Rami24t/Periodic-Table-Database/blob/main/element.sh) into this public repository.

Note:  I made the periodic_table.sql PostgreSQL database dump file of my resulting database using pg_dump by entering 'pg_dump -cC --inserts -U freecodecamp periodic_table > periodic_table.sql' in the bash terminal. It saves the commands to rebuild the database from the .sql file using: 'psql -U postgres < periodic_table.sql'.

### Tasks & User Stories: Fix the database, Create your git repository, and Create the script

There are some mistakes in the database that need to be fixed or changed. See the user stories below for what to change.

You need to make a small bash program. The code needs to be version controlled with git, so you will need to turn the suggested folder into a git repository.

You need to make a script that accepts an argument in the form of an atomic number, symbol, or name of an element and outputs some information about the given element.

When you have completed the project, save all the required files into a public repository.


-     rename the weight column to atomic_mass
-     rename the melting_point column to melting_point_celsius and the boiling_point column to boiling_point_celsius
-     melting_point_celsius and boiling_point_celsius columns should not accept null values
-     add the UNIQUE constraint to the symbol and name columns from the elements table
-     symbol and name columns should have the NOT NULL constraint
-     set the atomic_number column from the properties table as a foreign key that references the column of the same name in the elements table
-     create a types table that will store the three types of elements
-     types table should have a type_id column that is an integer and the primary key
-     types table should have a type column that's a VARCHAR and cannot be null. It will store the different types from the type column in the properties table
-     add three rows to your types table whose values are the three different types from the properties table
-     properties table should have a type_id foreign key column that references the type_id column from the types table. It should be an INT with the NOT NULL constraint
-     Each row in  properties table should have a type_id value that links to the correct type from the types table
-     capitalize the first letter of all the symbol values in the elements table. Be careful to only capitalize the letter and not change any others
-     remove all the trailing zeros after the decimals from each row of the atomic_mass column. You may need to adjust a data type to DECIMAL for this. The final values they should be are in the atomic_mass.txt file
-     add the element with atomic number 9 to your database. Its name is Fluorine, symbol is F, mass is 18.998, melting point is -220, boiling point is -188.1, and it's a nonmetal
-     add the element with atomic number 10 to your database. Its name is Neon, symbol is Ne, mass is 20.18, melting point is -248.6, boiling point is -246.1, and it's -a nonmetal
-     create a periodic_table folder in the project folder and turn it into a git repository with git init
-     repository should have a main branch with all your commits
-     periodic_table repo should have at least five commits
-     create an element.sh file in your repo folder for the program I want you to make
-     script (.sh) file should have executable permissions
-     If you run ./element.sh, it should output only Please provide an element as an argument. and finish running.
-     If you run ./element.sh 1, ./element.sh H, or ./element.sh Hydrogen, it should output only The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
-     If you run ./element.sh script with another element as input, you should get the same output but with information associated with the given element.
-     If the argument input to your element.sh script doesn't exist as an atomic_number, symbol, or name in the database, the only output should be I could not find that element in the database.
-     The message for the first commit in your repo should be Initial commit
-     The rest of the commit messages should start with fix:, feat:, refactor:, chore:, or test:
-     delete the non existent element, whose atomic_number is 1000, from the two tables
-     properties table should not have a type column
-     finish your project while on the main branch. Your working tree should be clean and you should not have any uncommitted changes
