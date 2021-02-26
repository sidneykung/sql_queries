-- a self join is a regular join, but the table is joined with itself
-- this method is useful for querying hierarchical data or comparing rows within the same table

-- syntax
SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;
-- t1 and t2 are aliases for the same table

-- this query matches customers that are from the same city
SELECT A.CustomerName AS Customer_1, B.CustomerName AS Customer_2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;