-- CREATE: creating a table
CREATE TABLE table_name (
    column_a INTEGER,
    column_b TEXT,
    column_c TEXT
);
-- column declarations are typically on a line by themselves and followed by a type declaration

-- inserting data into this new empty table
INSERT INTO table_name VALUES ( 1, 'This', 'Right here!');

-- inserting data into specific columns only
INSERT INTO table_name (column_b, column_c) VALUES ('That', "Over there!");
-- this query would have a NULL value for column_a

-- you can also use the results from a SELECT statement to add rows to a table
INSERT INTO table_name (column_a, column_b, column_c) SELECT id, name, description FROM item; 

-- DELETE FROM: deleting rows
DELETE FROM table_name WHERE column_a = 3;

-- DROP TABLE: delete a table from a database
-- note that this is different from DELETE, that deletes specific data
DROP TABLE table_name;
-- you can add IF EXISTS so the query won't have an error if the table doesn't already exist
DROP TABLE IF EXISTS table_name;

-- 

-- NULL values: a result with no value/ lack of a value
-- SELECT * FROM text WHERE a = NULL; wouldn't get any results
-- to test for NULL values, you need a special condition called IS NULL
SELECT * FROM table_name WHERE column_a IS NULL;
-- or we can query for values that are not NULL
SELECT * FROM table_name WHERE column_a is NOT NULL;

--

-- constraining columns: setting rules/behaviors for columns
CREATE TABLE table_name (
    column_a INTEGER NOT NULL,
    column_b TEXT NOT NULL,
    column_c TEXT NOT NULL
);
-- by adding NOT NULL to each column when creating the table, queries that insert NULL values will fail

-- you could also give the column a default value
CREATE TABLE table_name (
    column_a INTEGER DEFAULT 'missing',
    column_b TEXT,
    column_c TEXT
);
-- now when we fail to add data explicitly to column_a, then it will insert this default value

-- another common constraing ensures that every value in a column is unique
CREATE TABLE table_name (
    column_a INTEGER UNIQUE,
    column_b TEXT,
    column_c TEXT
);
-- so if you try to insert the same data twice, then there will be an error
-- depending on the system, the NULL value could be exempt from the UNIQUE constraint

--

-- ALTER TABLE: changing a schema
-- for example, adding a new column
ALTER TABLE table_name ADD column_d TEXT;
-- this query will add a new column with NULL values
-- the capabilities and the syntax of this statement varies widely between systems, so always be sure to consult your system's documentation

-- ID Column: a column that holds a unique value for each row in a table
-- typically they are automatically populated. and the method for creating a ID column is not standardized
-- here is how it works for SQLite, but it will be different across systems
CREATE TABLE table_name (
    id INTEGER PRIMARY KEY,
    column_a INTEGER,
    column_b TEXT,
    column_c TEXT
);
-- when you insert values into this table, the id column will populate itself

-- 

-- WHERE: filtering data
-- WHERE with OR
SELECT Name, Continent, Population FROM Country
WHERE Population < 100000 OR Population IS NULL ORDER BY Population DESC;

-- WHERE with AND
SELECT Name, Continent, Population FROM Country
WHERE Population < 100000 AND Continent = 'Oceania' ORDER BY Population DESC;

-- WHERE with LIKE
-- querying countries with 'island' somewhere in the name by using wildcard %
SELECT Name, Continent, Population FROM Country
WHERE Name LIKE '%island%' ORDER BY Name;
-- querying countries with 'a' as the second letter in the name by using wildcard _
SELECT Name, Continent, Population FROM Country
WHERE Name LIKE '_a%' ORDER BY Name;

-- WHERE with IN: used to select results that match values in  alist
SELECT Name, Continent, Population FROM Country
WHERE Continent IN ('Europe', 'Asia') ORDER BY Name;
-- this query will match any country where the continent is Europe or Asia

--

-- SELECT DISTINCT: querying unique values
SELECT DISTINCT Continent FROM Country;

--

-- ORDER BY: ordering output
-- sorting by alphabetical order
SELECT Name FROM Country ORDER BY Name;
-- descending sorts by Z-A
SELECT Name FROM Country ORDER BY Name DESC;
-- ascending is the defaul A-Z
SELECT Name FROM Country ORDER BY Name ASC;
-- the query below will sort by continent first and then name
SELECT Name FROM Country ORDER BY Continent, Name;

--

-- CASE WHEN: conditional expressions (if/else statements)
-- getting the # of countries that have 'island' in the name
SELECT
CASE WHEN Name LIKE '%island%' THEN 1 ELSE NULL END;

-- CASE WHEN format:
SELECT
CASE 
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;