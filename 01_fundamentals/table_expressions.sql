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

-- NULL values
