-- CROSS JOIN
-- sometimes, we just want to combine all rows of one table with all rows of another table

SELECT shirts.shirt_color, pants.pants_color
FROM shirts
CROSS JOIN pants;

-- the third line performs a CROSS JOIN with the pants table

-- note that cross joins don't require an ON statement
-- because you're not really joining on any columns

-- a more common usage of CROSS JOIN is when we need to compare each row of a table to a list of values

SELECT *
FROM newspaper
CROSS JOIN months
WHERE start_month <= month
AND end_month >= month;
-- this query selects all the months where a user was subscribed to the newspaper

SELECT month, COUNT(*)
FROM newspaper
CROSS JOIN months
WHERE start_month <= month
AND end_month >= month
GROUP BY month;
-- this query aggregates over eahc month to count the number of subscribers