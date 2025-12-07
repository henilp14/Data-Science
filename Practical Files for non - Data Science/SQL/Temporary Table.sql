use vrindastoredata;
CREATE TEMPORARY TABLE TempTotalSpent AS
SELECT 
    Cust_ID, 
    SUM(Amount) AS TotalAmountSpent
FROM vrindastoredatatable
GROUP BY Cust_ID;

SELECT * FROM TempTotalSpent;

DROP TEMPORARY TABLE TempTotalSpent;
