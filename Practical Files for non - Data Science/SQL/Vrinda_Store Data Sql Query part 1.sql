use vrindastore;
SELECT * FROM vrinda_store;

-- WHERE
SELECT * FROM vrinda_store
WHERE Amount > 1000;

-- AND
SELECT * FROM vrinda_store
WHERE Amount > 1000 AND Status = 'Delivered';

-- OR
SELECT * FROM vrinda_store
WHERE Gender = 'Men' OR Category = 'Set';

-- WHERE NOT
SELECT * FROM vrinda_store
WHERE NOT Status = 'Cancelled';

-- ORDER BY
SELECT * FROM vrinda_store
ORDER BY Amount DESC;

-- ORDER BY
SELECT * FROM vrinda_store
ORDER BY Age ASC;

-- UPDATE
UPDATE vrinda_store
SET Amount = 600
WHERE Amount = '1000' AND Age = 58;


-- DELETE
DELETE FROM vrinda_store
WHERE Status = 'Cancelled';

-- LIMIT
SELECT * FROM vrinda_store
LIMIT 5;

-- MIN
SELECT MIN(Amount) AS min_amount FROM vrinda_store;

-- MAX
SELECT MAX(Amount) AS max_amount FROM vrinda_store;

-- COUNT
SELECT COUNT(*) AS total_orders FROM vrinda_store;

-- AVG
SELECT AVG(Amount) AS avg_amount FROM vrinda_store;

-- SUM
SELECT SUM(Qty) AS total_qty FROM vrinda_store;

