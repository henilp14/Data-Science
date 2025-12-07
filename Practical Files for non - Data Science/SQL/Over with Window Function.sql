SELECT 
    id, 
    Order_ID, 
    Cust_ID, 
    Gender, 
    Age, 
    Date, 
    Status, 
    Channel, 
    SKU, 
    Category, 
    Size, 
    Qty, 
    currency, 
    Amount,
    ship_city, 
    ship_state, 
    ship_postal_code, 
    ship_country, 
    B2B,

    ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Amount DESC) AS RowNum,

    RANK() OVER (PARTITION BY Category ORDER BY Amount DESC) AS RankInCategory,

    DENSE_RANK() OVER (PARTITION BY Category ORDER BY Amount DESC) AS DenseRankInCategory,

    NTILE(4) OVER (ORDER BY Amount DESC) AS AmountQuartile,

    LEAD(Amount) OVER (PARTITION BY Cust_ID ORDER BY Date) AS NextOrderAmount,

    LAG(Amount) OVER (PARTITION BY Cust_ID ORDER BY Date) AS PreviousOrderAmount,

    FIRST_VALUE(Amount) OVER (PARTITION BY Gender ORDER BY Date) AS FirstOrderAmountByGender,

    LAST_VALUE(Amount) OVER (PARTITION BY Gender ORDER BY Date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LastOrderAmountByGender,

    SUM(Amount) OVER (PARTITION BY Cust_ID ORDER BY Date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS CumulativeAmountSpent,

    AVG(Amount) OVER (PARTITION BY Category) AS AverageAmountInCategory,

    MIN(Amount) OVER (PARTITION BY Category) AS MinAmountinCategory,

    MAX(Amount) OVER (PARTITION BY Category) AS MaxAmountincategory

FROM vrindastoredatatable;
