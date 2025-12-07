USE vrindastore;
SELECT
    Date,
    SKU,
    Amount,
    AVG(Amount) OVER (PARTITION BY Age) AS Avg_Amount_Age
FROM
    vrinda_store
WHERE
Age = 77;

