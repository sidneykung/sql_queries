-- A window function performs a calculation across a set of table rows that are somehow related to the current row. 
-- This is comparable to the type of calculation that can be done with an aggregate function. 
-- But unlike regular aggregate functions, use of a window function does not cause rows to become grouped into a single output row — the rows retain their separate identities.

-- a common example of this is the running total
SELECT duration_seconds,
    SUM(duration_seconds) OVER (ORDER BY start_time) AS running_total
FROM tutorial.dc_bikeshare_q1_2012;

-- refer to the running_total.sql file for more query examples
-- the SUM() makes it like any other aggregation, but adding OVER designates it as a window function
-- you can read the query as:
-- "take the sum of duration_seconds over the entire result set, in order by start_time"

--

-- ROW_NUMBER(): displays the number of a given row
-- it starts at 1 and number the rows according to the ORDER BY part of the window statement
-- ROW_NUMBER() doesn't require you to specify a variable withiin parentheses

SELECT start_terminal, start_time, duration_seconds,
    ROW_NUMBER() OVER (ORDER BY start_time) AS row_number
FROM tutorial.dc_bikeshare_q1_2012
WHERE start_time < '2012-01-08';

-- RANK()
-- this is a little different from ROW_NUMBER()
-- for example, if you order by start_time, some terminals have rides with two identical start times
-- in this case, they are given the same rank

SELECT start_terminal, duration_seconds,
    RANK() OVER (PARTITION BY start_terminal
    ORDER BY start_time) AS rank
FROM tutorial.dc_bikeshare_q1_2012;

--

-- LAG and LEAD
-- sometimes it's useful to compare rows to preceding or following rows
-- you can use LAG or LEAD to create columns that pull values from other rows
-- all you need to do is enter which column to pull from and how many rows away you'd like to do the pull
-- LAG pulls from previous rows
-- LEAD pulls from following rows

SELECT start_terminal, duration_seconds,
    LAG(duration_seconds, 1) OVER
        (PARTITION BY start_terminal ORDER BY duration_seconds) AS lag,
    LEAD(duration_seconds, 1) OVER
        (PARTITION BY start_terminal ORDER BY duration_seconds) AS lead
FROM tutorial.dc_bikeshare_q1_2012
WHERE start_time < '2012-01-08'
ORDER BY start_terminal, duration_seconds;

-- this is especially useful if oyu want to calculate differences between rows
SELECT start_terminal, duration_seconds, 
    duration_seconds -LAG(duration_seconds, 1) OVER
        (PARTITION BY start_terminal ORDER BY duration_seconds) AS difference
FROM tutorial.dc_bikeshare_q1_2012
WHERE start_time < '2012-01-08'
ORDER BY start_terminal, duration_seconds;

-- source for queries in this file:
-- https://mode.com/sql-tutorial/sql-window-functions/