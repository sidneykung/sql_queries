-- triggers are operations that are automatically performed when a specific database event occurs

CREATE TRIGGER newWidgetSale AFTER INSERT ON newWidgetSale
BEGIN
UPDATE widgetCustomer SET last_order_id = NEW.id WHERE widgetCUSTOMER.id = NEW.customer_id;
END;

-- the trigger here is the INSERT ON event
-- the statement sets last order ID equal to new ID
-- this "new" keyword represents a virtual row in the widget sale table because that's where the event happened

-- a trigger can be a great way to enforce business rules, to require a table to be updated whenever another table is updated

--

-- triggers can also be used to prevent changes to rows that have already been reconciled or should not be changed for other reasons
CREATE TRIGGER updateWidgetSale BEFORE UPDATE on widgetSale
BEGIN
SELECT RAISE(ROLLBACK, 'cannot update table "widgetSale"') FROM widgetSale
WHERE id = NEW.id AND reconciled = 1;
END;
-- this trigger happens before UPDATE ON widgetSale
-- and it raises an exception if the row you're trying to update is reconciled

-- 

-- triggers may also be used to create timestamps
CREATE TRIGGER stampSale AFTER INSERT on widgetSale
BEGIN
UPDATE widgetSale SET stamp = DATETIME('now') WHERE id = NEW.id;
UPDATE widgetCustomer SET last_order_id = NEW.id, stamp = DATETIME('now')
    WHERE widgetCustomer.id = NEW.customer_id;
INSERT INTO widgetLog (stamp, event, username, tablename, table_id)
    VALUES (DATETIME('now'), 'INSERT', 'TRIGGER', 'widgetSale', NEW.id);
END;


--

-- deleting triggers
-- similar to deleting tables
DROP TRIGGER IF EXISTS newWidgetSale;
DROP TRIGGER IF EXISTS updateWidgetSale;
DROP TRIGGER IF EXISTS stampSale;