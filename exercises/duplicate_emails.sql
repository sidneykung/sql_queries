-- https://leetcode.com/problems/duplicate-emails/

-- Write a SQL query to find all duplicate emails in a table named Person.

SELECT Email
    FROM Person
    GROUP BY email
    HAVING COUNT(Email) > 1;
