-- aggregate data is information derived from more than one row at a time

-- COUNT function
SELECT COUNT(*) FROM Country;
-- result is a count of 239 rows in the country table

SELECT COUNT(population) FROM Country;
-- result is a count of non-NULL values in the population column in the country table

-- count of countries in each region
SELECT Region, COUNT(*) AS Count
FROM Country
GROUP BY Region
ORDER BY Count DESC, Region;
-- the result is a table with one row per region and the aggregate value in another column

-- this also works with joined query
-- query to find the number of tracks on albums by the Beatles, but for albums with 10 or more tracks
SELECT a.title AS Album, COUNT(t.track_number) AS tracks
FROM track AS t
JOIN album as a
    ON a.id = t.album_id
WHERE a.artist = 'The Beatles'
GROUP BY a.id
HAVING Tracks >= 10
ORDER BY Tracks DESC, Album;

--

-- DISTINCT can be used on any of the aggregate functions
SELECT COUNT(DISTICT HeadofState) FROM Country

--

-- HAVING vs. WHERE
-- the HAVING clause is like the WHERE clause but for aggregate data
-- you can still use the WHERE clause to operate on the non-aggregate parts of the same query
-- note that WHERE needs to be before GROUP BY
-- and HAVING needs to be after GROUP BY

-- AVG: returns the average value for a column of numerical values
-- query average of all the population values for every country in the Country table
SELECT AVG(Population) FROM Country;

-- we can use the GROUP BY clause again to get the average population for each region
SELECT Region, AVG(Population) FROM Country GROUP BY Region;

-- MIN: minimum value
-- MAX: maximum value
SELECT Region, MIN(Population), MAX(Population) FROM Country GROUP BY Region;

-- SUM: sum of all values in an aggregate
SELECT Region, SUM(Population) FROM Country GROUP BY Region;