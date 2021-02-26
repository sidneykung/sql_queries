-- a statement is the unit of execution in SQL
-- they contain 1 or more clauses (FROM, WHERE, etc.)

-- CRUD: the 4 fundimental functions of a database system
-- create, read, update, delete

-- a relational database has one or more tables, that each have rows and columsn
-- a row is like a "record" that has a unique key
-- a column is like a "field"
-- each table's key is used to create relationships between tables
-- "foreign keys" refer to the keys of other tables

-- 

-- SELECT: returns results or a set of results from a query
-- * selects all columns
-- the FROM clause queries where to get the data from
SELECT * FROM Country;

-- we can query certain columns
SELECT Name, LifeExpectancy AS "Life Expectancy" FROM Country ORDER BY Name;
-- the AS clause allows you to create an alias name for a column
-- notice how we used double quotes for an identifier

-- selecting rows 
-- querying rows that only contain Europe in the Continent column
-- the LIIMIT clause returns only 5 rows
SELECT Name, Continent, Region FROM Country WHERE Continent = 'Europe' ORDER BY Name LIMIT 5;

-- counting rows (instead of listing them)
-- this query counts the number of rows from the table
SELECT COUNT(*) FROM Country:
-- we can modify the query to have conditions
SELECT COUNT(*) FROM Country WHERE Population > 1000000 AND Continent = 'Europe';

-- querying the count of a specific column will return a different number because it only counts the rows that have data (doesn't count missing values)
SELECT COUNT(LifeExpectancy) FROM Country;

--

-- WHERE
SELECT *
FROM movies
WHERE imdb_rating > 8;

-- LIKE: using wildcards _ and %
SELECT * 
FROM movies
WHERE name LIKE 'Se_en';

SELECT * 
FROM movies
WHERE name LIKE '%man%';

-- BETWEEN
-- used in a WHERE clause to filter the result set within a certain range
-- it accepts 2 values that are either numbers, text or dates
SELECT *
FROM movies
WHERE year BETWEEN 1990 AND 1999;

-- when the values are text, BETWEEN filters the result set for within the alphabetical range.
SELECT *
FROM movies
WHERE name BETWEEN 'A' AND 'J';
--in this statement, BETWEEN filters the result set to only include movies with names that begin with the letter ‘A’ up to, but not including ones that begin with ‘J’

-- AND
SELECT * 
FROM movies
WHERE year BETWEEN 1990 AND 1999
   AND genre = 'romance';
-- here we use the AND operator to return 90's romance movies

-- OR 
SELECT *
FROM movies
WHERE year > 2014
   OR genre = 'action';