USE vrindastoredata;
-- CTE
WITH TotalSpent AS (
    SELECT 
        Cust_ID, 
        SUM(Amount) AS TotalAmountSpent
    FROM vrindastoredatatable
    GROUP BY Cust_ID
)
SELECT 
    v.Cust_ID, 
    v.Order_ID, 
    v.Amount, 
    t.TotalAmountSpent
FROM vrindastoredatatable v
JOIN TotalSpent t ON v.Cust_ID = t.Cust_ID;
