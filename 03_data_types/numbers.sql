-- In SQL, there are 2 basic types of categories of numeric types for representing integers and real numbers

-- integers will mostly fall into these 3 categories
-- 1. INTEGER for whole numbers
-- precision specifies how many bits are used to represent the integer
INTEGER(precision)
-- 2. DECIMAL for fixed precision numbers with a decimal point
DECIMAL(precision, scale)
-- 3. MONEY for specialed cases of decimal types
MONEY(precision, scale)

-- precision refers to how many digits are represented
-- scale is the magnitude of a number that might be represented

-- real types
REAL(precision)
FLOAT(precision)

--

-- TYPEOF: what type is that value?
SELECT TYPEOF( 1 + 1 );
-- result is integer
SELECT TYPEOF( 1 + 1.0 );
-- result is real
SELECT TYPEOF('panda');
-- result is text
SELECT TYPEOF('panda' + 'koala');
-- result is integer
-- SQLite tries to convert the strings to integers and ends up with 0
-- some systems will use the plus sign to concatenate the strings

--

-- integer division
SELECT 1 / 2;
-- result is 0 (expected is .5)
SELECT 1.0 / 2;
-- result is 0.5 because one of the operands is a real number
-- you can cast one of the intergers as a real number without adding .0
SELECT CAST(1 AS REAL) / 2;
-- result is 0.5
SELECT 17 / 5;
-- result is 3
-- if we use the modulo operator % as a second value,
SELECT 17 / 5 , 17 % 5;
-- result is 3 with a remainder of 2

--

-- rounding numbers
SELECT ROUND(2.55555);
-- result is 3
SELECT ROUND(2.55555, 3);
-- result is 2.556
SELECT ROUND(2.55555, 0);
-- result is 3 (0 is default)