use vrindastoredata;
-- LIKE / Wildcards
SELECT * 
FROM vrindastoredatatable
WHERE Category LIKE 'kurta%';  

-- IN
SELECT * 
FROM vrindastoredatatable
WHERE Status IN ('Delivered', 'Returned');  --

-- BETWEEN
SELECT * 
FROM vrindastoredatatable
WHERE Amount BETWEEN 100 AND 500;  

-- Aliases
SELECT SKU AS product_sku, Amount AS total_amount
FROM vrindastoredatatable;

-- UNION
SELECT Age, Amount 
FROM vrindastoredatatable
WHERE Channel = 'Amazon' AND Category = 'kurta'
UNION
SELECT Age, Amount 
FROM vrindastoredatatable
WHERE Channel = 'Amazon' AND Category = 'kurta';  

-- GROUP BY
SELECT ship_city, SUM(Amount) AS total_spent
FROM vrindastoredatatable
WHERE Category = 'kurta'
GROUP BY ship_city;  

-- HAVING
SELECT ship_city, SUM(Amount) AS total_spent
FROM vrindastoredatatable
WHERE Category = 'kurta'
GROUP BY ship_city
HAVING SUM(Amount) > 500;

-- EXISTS
SELECT ship_country
FROM vrindastoredatatable AS v
WHERE EXISTS (
  SELECT 1
  FROM vrindastoredatatable AS s
  WHERE s.ship_city = v.ship_city AND s.Category = 'kurta'
);  

--  ANY
SELECT Amount, ship_city
FROM vrindastoredatatable
WHERE Amount > ANY (SELECT Amount FROM vrindastoredatatable WHERE Amount < 200 AND Category = 'kurta');  

-- ALL
SELECT Amount, ship_state
FROM vrindastoredatatable
WHERE Amount > ALL (SELECT Amount FROM vrindastoredatatable WHERE Status = 'Pending' AND Category = 'kurta');

-- CASE
SELECT Order_ID, Amount,
  CASE
    WHEN Amount > 1000 THEN 'High'
    WHEN Amount BETWEEN 500 AND 1000 THEN 'Medium'
    ELSE 'Low'
  END AS Order_Category
FROM vrindastoredatatable
WHERE Category = 'kurta';

-- NULL Functions
SELECT Order_ID, COALESCE(Amount, 0) AS Total_Amount
FROM vrindastoredatatable
WHERE Category = 'kurta'; 

-- Operators
SELECT Order_ID, Amount
FROM vrindastoredatatable
WHERE Amount > 500 AND ship_state = 'PUNJAB' AND Category = 'kurta'; 

SELECT Order_ID, Amount
FROM vrindastoredatatable
WHERE Amount > 500 OR ship_country = 'IN' AND Category = 'kurta'; 

SELECT Order_ID, Amount
FROM vrindastoredatatable
WHERE NOT ship_state = 'PUNJAB' AND Category = 'kurta';  