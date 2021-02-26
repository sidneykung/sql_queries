-- often times, we want to combine two tables, but one of them is the result of another calculation

-- the WITH statement allows us to perform a sperate query
-- (such as aggregating customer's subscriptions)

WITH previous_results AS (
   SELECT ...
   ...
   ...
   ...
)
SELECT *
FROM previous_results
JOIN customers
  ON _____ = _____;

-- essentially, we are ptting the whole first query inside the parentheses () and giving it a name
-- after that, we can us ethis name as if it's a table and write a new query using the first query

WITH previous_query AS (
   SELECT customer_id,
      COUNT(subscription_id) AS 'subscriptions'
   FROM orders
   GROUP BY customer_id
)
SELECT customers.customer_name, 
   previous_query.subscriptions
FROM previous_query
JOIN customers
  ON previous_query.customer_id = customers.customer_id;