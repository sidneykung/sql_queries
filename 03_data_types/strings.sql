-- in standard SQL, a string is represented by a series of characters in single quote marks
SELECT 'a literal SQL string';
-- note that older database systems like MySQL may use double quotes instead

-- if you need to use a single quote in your string, you use two single quotes to represent the one

-- concating strings
-- standard SQL provides a concatenation operator ||
-- SQLite, post SQL and many other systems
SELECT 'This' || '&' || 'that';
-- MySQL uses a function
SELECT CONCAT('This', '&', 'that');
-- Microsoft SQL uses a non standard operator
SELECT 'This' + '&' + 'that';

-- string functions
-- these also vary from system to system. there are only a few string functions that are considered standard

-- LEN: length of a string
SELECT Name, LEN(Name) AS Length FROM City, ORDER BY DESC, Name;
-- sometimes LENGTH(string)

-- SUBSTR: selecting part of a string
-- format
SUBTR(string, start, length);
-- example to return the word 'string'
SELECT SUBSTR('this string', 6)
-- example to return 'str'
SELECT SUBSTR('this string', 6, 3)

-- selecting the year, month, day from column 'released' with strings in the format yyyy-mm-dd
SELECT released
SUBSTR(released, 1, 4) AS Year,
SUBSTR(released, 6, 2) AS Month,
SUBSTR(released, 9, 2) AS Day
FROM album ORDER BY released;

-- TRIM: removing spaces
-- remove all spaces
SELECT TRIM('   string   ')
-- remove spaces from the beginning of the string
SELECT LTRIM('   string   ')
-- remove spaces from the end of the string
SELECT RTRIM('   string   ')
-- specify which characters to remove
-- removing the period characters from both side of the string
SELECT TRIM('...string...', '.')
-- you can also apply LTRIM and RTRIM here

-- UPPER/LOWER: normalizing strings
UPPER('StRinG');
LOWER('StRinG');
-- practical example
SELECT UPPER(name) FROM City ORDER BY Name;
SELECT LOWER(name) FROM City ORDER BY Name;

