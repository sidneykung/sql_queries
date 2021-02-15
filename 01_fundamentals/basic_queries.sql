-- a statement is the unit of execution in SQL
-- they contain 1 or more clauses (FROM, WHERE, etc.)

-- CRUD: the 4 fundimental functions of a database system
-- create, read, update, delete

-- a relational database has one or more tables, that each have rows and columsn
-- a row is like a "record" that has a unique key
-- a column is like a "field"
-- each table's key is used to create relationships between tables
-- "foreign keys" refer to the keys of other tables

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

-- INSERT: inserting data
-- this statement used to add a row to a table
INSERT INTO Customer (name, address, city, state, zip)
VALUES ('Fred Flinstone', '123 Cobblestone Way', 'Bedrock', 'CA', '91234');
-- note that a query could populate specific columns only. the columns that are not specified will have NULL values

-- UPDATE: updating data
-- this statement is used to change data
UPDATE Customer
SET address = '123 Music Avenue', zip = '98056'
WHERE id = 5;
-- if you don't have the WHERE clause, it's going to update the entire table

-- DELETE: deleting data
-- this statement is used to delete data
DELETE FROM Customer WHERE id=4;
-- if you don't use the WHERE clause, it's going to delete the entire table