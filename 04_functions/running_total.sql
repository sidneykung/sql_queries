-- in SQL, a running total is the cumulative sum of previous numbers in a column

-- example 1
SELECT registration_date, registred_users,
  SUM(registred_users) 
  OVER (ORDER BY registration_date) AS total_users
FROM registration;

-- this query creates another column called total_users with the running total

-- registered_users is the argument of SUM() because we want to obtain the cumulative sum of users from this column
-- the OVER() clause has the argument ORDER BY registration_date
-- the rows of the result set are sorted according to the registration_date column 

-- example 2
-- what if we want different running totals according to the values in a column?
SELECT country, registration_date, registred_users,
  SUM(registred_users) 
  OVER (PARTITION BY country ORDER BY registration_date)
  AS total_users
FROM registration;
-- this query calculates the sum of users for each day, first for users from England and then from users from Poland

-- example 3
-- check each gamer's total cumulative score for each day in two different games
SELECT game_id, game_level, gamer_id, competition_date, score,
  SUM(score)
  OVER (PARTITION BY game_id, gamer_id 
        ORDER BY competition_date)
  AS total_score
FROM competition;

-- source for queries in this file:
-- https://learnsql.com/blog/what-is-a-running-total-and-how-to-compute-it-in-sql/