-- in SQL, you can save a query as a view and you can use that view as if it were a table

-- example of a simple query
SELECT id, album_id, title, track_number,
    duration / 60 AS m, duration % 60 AS s 
FROM track;

-- CREATE VIEW: save this query as a view
CREATE VIEW trackView AS
SELECT id, album_id, title, track_number,
    duration / 60 AS m, duration % 60 AS s 
FROM track;

-- now we can use that view in a queru
SELECT a.title AS album, a.artist, t.track_number AS seq, t.title, t.s, t.s
FROM album AS a
JOIN trackView AS t ON t.album_id = a.id
ORDER BY a.title, t.track_number;
-- this query returns album name, artist, track number, track title, minutes and seconds
-- so it's using the trackView just as you would use a table

-- deleting a view
DROP VIEW IF EXISTS trackView;

-- a view can be a simple, straight query
-- or it can be a more complex, joined query
-- the technique can be exactly the same

CREATE VIEW joinedAlbum AS
SELECT a.artist AS artist,
    a.title AS album,
    t.title AS track,
    t.track_number AS trachno,
    t.duration / 60 AS m,
    t.duration % 60 AS s
FROM track as t
JOIN album AS a ON a.id = t.album_id;
-- this joined table has the artist name, album, track name, track number, minutes and seconds

-- now we can use the view just like a table
SELECT * FROM joinedAlbum;

-- we can use the substring trick to get the duration and time notation
SELECT artist, album, track, trackno,
m || ':' || substr('00' || s, -2, 2) AS duration
FROM joinedAlbum;

-- deleting this view
DROP VIEW IF EXISTS joinedAlbum;
