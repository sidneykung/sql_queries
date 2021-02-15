-- a statement is the unit of execution in SQL
-- they contain 1 or more clauses (FROM, WHERE, etc.)

-- CRUD: the 4 fundimental functions of a database system
-- create, read, update, delete

-- a relationsal data base has one or more tables, that each have rows and columsn
-- a row is like a "record" that has a unique key
-- a column is like a "field"
-- each table's key is used to create relationships between tables
-- "foreign keys" refer to the keys of other tables

-- SELECT: returns results or a set of results from a query
-- * selects everything
SELECT * FROM Customer;

-- selecting rows

-- selecting columns

-- counting rows

-- INSERT: inserting data
-- this statement used to add a row to a table
INSERT INTO Customer (name, city, state)
VALUES ('Jimi Hendrix', 'Renton', 'WA');

-- UPDATE: updating data
-- this statement is used to change data
UPDATE Customer
SET
Address = '123 Music Avenue',
Zip = '98056'
WHERE id = 5;

-- deleting data
-- this statement is used to delete data