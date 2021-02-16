-- using the join clause, SQL may easily perform queries on related data from multiple tables
--typically, unique ID columns are used to create relationships

-- default: INNER JOIN
-- the result of an inner join will include rows from both tables where the join condition is met

-- OUTER JOIN
-- LEFT OUTER JOIN: rows where the condition is met plus all the rows from the table on the left, where the condition is not met
-- RIGHT OUTER JOIN: likewise, it includes rows from the table on the right but many databases don't support right joins
-- typically, a right join can be rewritten as a left join by simply changing the order of the tables in the query
-- FULL OUTER JOIN: combines the effects of left and right joins

-- example of inner join
SELECT l.description AS left_desc, r.description AS right_desc
FROM left_table AS l
JOIN right_table AS r ON l.id = r.id
;
-- the ON clause tells the condition under which these two tables will join
-- and because those description columns are named the same thing, we need to give them aliases
-- in this query, the left_table is considered the left side of the join

-- example of left join
SELECT l.description AS left_desc, r.description AS right_desc
FROM left_table AS l
LEFT JOIN right_table AS r ON l.id = r.id
;
-- this query returns all of the left_table plus the joined part from right_table where the columns match

-- practical example from sale and item tables in 'test' database
SELECT s.id AS sale, s.date, i.name, i.description, s.price
FROM sale AS s
JOIN item AS i on s.item_id = i.id
;

-- Junction Table: relating multiple tables
SELECT c.name AS Cust, c.zip AS Item, i.description, s.quantity AS Quen, s.price AS price
FROM sale AS s
JOIN item AS i ON s.item_id = i.id
JOIN customer AS c on s.customer_id = c.id
ORDER BY Cust, Item
;
-- this query only shows customers that have sales