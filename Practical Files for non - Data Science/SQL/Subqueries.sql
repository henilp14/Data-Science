use vrindastoredata;
-- Scaler SubQuery
SELECT 
    Cust_ID,
    SUM(Amount) AS TotalAmountSpent
FROM vrindastoredatatable
GROUP BY Cust_ID
HAVING SUM(Amount) > (SELECT AVG(Amount) FROM vrindastoredatatable);

-- row subquery
SELECT 
    Order_ID,
    Cust_ID,
    Amount
FROM vrindastoredatatable v
WHERE (v.Cust_ID, v.Category) = (
    SELECT Cust_ID, Category
    FROM vrindastoredatatable
    GROUP BY Cust_ID, Category
    ORDER BY SUM(Amount) DESC
    LIMIT 1
);

-- Exists
SELECT 
    Cust_ID,
    SUM(Amount) AS TotalAmountSpent
FROM vrindastoredatatable v1
WHERE EXISTS (
    SELECT 1
    FROM vrindastoredatatable v2
    WHERE v1.Cust_ID = v2.Cust_ID
    HAVING COUNT(*) > 100
)
GROUP BY Cust_ID;

-- From
SELECT 
    Temp.Cust_ID, 
    Temp.TotalAmountSpent
FROM (
    SELECT 
        Cust_ID, 
        SUM(Amount) AS TotalAmountSpent
    FROM vrindastoredatatable
    GROUP BY Cust_ID
) AS Temp;
