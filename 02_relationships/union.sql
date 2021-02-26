-- UNION
-- sometimes we just want to stack one dataset on top of the other

SELECT *
FROM table1
UNION
SELECT *
FROM table2;

-- SQL has strict rules for appending data:
-- 1. tables must have the same number of columns
-- 2. the columns must have the same data types in the same order as the first table