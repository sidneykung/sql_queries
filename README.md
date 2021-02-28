## SQL Queries

This repository contains fundamental SQL queries. Please note that every SQL system accepts a different syntax so be sure to refer to documentation.

## Resources
- [Khan Academy’s Intro to SQL course](https://www.khanacademy.org/computing/computer-programming/sql): Instructional videos and hands-on activities reinforcing the SQL you learned in the course. (5 hours)
- [Codecademy’s Learn SQL course](https://www.codecademy.com/learn/learn-sql): Four free interactive lessons that do not require a Pro subscription. (3 hours)
- [SQLBolt](https://sqlbolt.com/): Proceeds from basic queries to more complicated queries and row/table manipulation. (3 hours)
- [SelectStarSQL](https://selectstarsql.com/): Reviews SQL fundamentals in the context of a research project about capital punishment. (3 hours)
- [Kaggle’s Intro to SQL course](https://www.kaggle.com/learn/intro-to-sql): Teaches SQL fundamentals in Jupyter Notebooks using Python and Google BigQuery. (5 hours)
- [W3Schools](https://www.w3schools.com/sql/default.asp)
- [PostgreSQL Exercises](https://pgexercises.com/)

## Fundamentals

#### Managing Data
- `CREATE TABLE` creates a new table
- `INSERT INTO` adds a new row to a table
- `SELECT` queries data from a table
- `ALTER TABLE` changes an existing table
- `UPDATE` edits a row in a table
- `DELETE FROM` deletes rows from a table

#### Queries
- `SELECT` queries data from a table
- `AS` creates alias for a column or table
- `DISTINCT` returns unique values
- `WHERE` filters the results of the query based on specific conditions
- `LIKE` is used inside of a `WHERE` clause to match a specific pattern
- `BETWEEN` filters by a range of values
- `AND` displays a row if all the conditions are true
- `OR` displays a row if any condition is true
- `ORDER BY` sorts the result
- `LIMIT` specifies the maximum number of rows that the query will return
- `CASE` creates different outputs

#### Aggregate Functions
- `COUNT()` counts the number of rows
- `SUM()` is the sum of the values in a column
- `MAX()` & `MIN()` is the largest or smallest value
- `AVG()` is the average of the values in a column
- `ROUND()` rounds the values in the column
- `GROUP BY` is a clause used with aggregate functions to combine data from one or more columns
- `HAVING` limits the results of a query based on an aggregate property.`

#### Multiple Tables
- **Primary key** is a column that serves a unique identifier for the rows in the table
- **Foreign key** is a column that contains the primary key to another table
- `JOIN` will combine rows from different tables if the join condition is true`
- `LEFT JOIN` will return every row in the left table, and if the join condition is not met, NULL values are used to fill in the columns from the right table
- `CROSS JOIN` lets us combine all rows of one table with all rows of another table
- `UNION` stacks one dataset on top of another
- `WITH` allows us to define one or more temporary tables that can be used in the final query
