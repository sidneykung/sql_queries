-- a transaction is a group of operations that are handled as one unit of work
-- in practice, this means that you may have many operations, and if any of these fail, the entire group of operations is treated as fail
-- then the entire database is restored to its state before the entire group of operations was started
-- generally, transactional operations could improve reliability and performance for larger or more complex operations

BEGIN TRANSACTION;
INSERT INTO widgetSales ( inv_id, quan, price) VALUES ( 1,5, 500);
UPDATE widgetInventory SET onhand = (onhand=5) WHERE id = 1;
END TRANSACTION;

-- in MySQL, it's START TRANSACTION instead of BEGIN TRANSACTION
-- and many systems will accept COMMIT instead of END TRANSACTION

BEGIN TRANSACTION;
INSERT INTO widgetInventory ( description, onhand) VALUES ( 'toy', 25);
ROLLBACK;
-- using ROLLBACK before the end of a transaction will abort the current transaction

-- using a transaction can signifigantly speed up a large amoung of queries
-- instead of executing 1,000 queries sequentially, just wrap them in a tranaction and they will be executed all at once

