-- subselects are nested queries
-- in SQL, the result of a select statement is effectively a table and can always be used as you would use a table

-- creating table for example
CREATE TABLE t ( a TEXT, b TEXT);
INSERT INTO t VALUES ('NY0123', 'US4567');

-- subselect statement
SELECT 
SUBSTR(a, 1, 2) AS State, 
SUBSTR(a, 3) AS SCode,
SUBSTR(b, 1, 2) AS Country, 
SUBSTR(b, 3) AS CCode 
FROM t;

-- this simple string slicing takes 'NY0123' and 'US4567' which are 2 columns in 1 row
-- and returns a table with the columns State, SCode, Country and CCode
-- which have the values State - NY, SCode - 0123, Country - US, and CCode - 4567

-- we can actually use this statement in a join
-- to take the country codes in CCode and turn them inot the names of the countries in the country table in the world database

SELECT co.Name, ss.CCode FROM (
SELECT SUBSTR(a, 1, 2) AS State, SUBSTR(a, 3) AS SCode,
SUBSTR(b, 1, 2) AS Country, SUBSTR(b, 3) AS CCode FROM t
) AS ss
JOIN Country AS co
ON co.Code2 = ss.Country
;

--

-- example: query a list of albums that have tracks with a duration of 90 seconds or less
SELECT DISTINCT album_id FROM track WHERE duration <= 90;
-- with this query, we don't know what the album names are
-- so we can use this select statement as a subselect
SELECT * FROM album 
WHERE id IN (SELECT DISTINCT album_id FROM track WHERE duration <= 90)
;
-- this query returns a table with the album id, title, artist, label and date released

-- now we can use this subselect in a joint query to get the individual track information for these albums
SELECT a.title AS album, a.artist, t.track_number AS seq, t.title, t.duration AS secs
FROM album AS a
JOIN track AS t ON t.album_id = a.id
WHERE a.id IN (SELECT DISTINCT album_id FROM track WHERE duration <= 90)
ORDER BY a.title, t.track_number;
-- this query returns a table with the album name, artist, track number, track title and duration in seconds

-- to modify the query to get songs off the 2 albums that are 90 seconds or less, we simply move the subslect to the JOIN statement
SELECT a.title AS album, a.artist, t.track_number AS seq, t.title, t.duration AS secs
FROM album AS a
JOIN (
    SELECT DISTINCT album_id, track_number, duration, title 
    FROM track 
    WHERE duration <= 90
) AS t
ON t.album_id = a.id
ORDER BY a.title, t.track_number;
-- the right side of our join is now the subselect, aka the source of the data on the right side
-- other than that, the query is the same