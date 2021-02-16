-- dates and times in SQL are typically represented with the most significant parts to the left and the most significant parts to the right
-- they are also generally stored as UTC (Coordinated Universal Time)

-- date nad time related functions
-- (varies from system to system)
-- here are the functions for SQLlite

-- the 'now' timestamp is very common usage, and every system has a convenient way of finding the current time and date
SELECT DATETIME('now');
-- returns 2019-10-29 21:21:32
SELECT DATE('now');
-- returns 2019-10-29
SELECT TIME('now');
-- returns 21:21:32

-- different systems perform DATETIME arithmatic in different ways
-- SQLite calculations are performed with text string arguments to the date and time functions
SELECT DATETIME('now', '+1 day');
-- returns 2019-10-30 21:21:32
SELECT DATETIME('now', '+3 days');
-- returns 2019-11-01 21:21:32
SELECT DATETIME('now', '-1 month');
-- returns 2019-09-29 21:21:32
SELECT DATETIME('now', '+1 year');
-- returns 2020-10-29 21:21:32
SELECT DATETIME('now', '+3 hours', '+27 minutes', '-1 day', '+3 years');
-- returns 2022-10-29 00:50:06

-- SQLite documentation: https://www.sqlite.org/lang_datefunc.html