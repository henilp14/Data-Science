USE vrindastoredata;
SELECT
    Category,
    SUM(CASE WHEN Gender = 'Women' THEN Amount ELSE 0 END) AS TotalWomenAmount,
    SUM(CASE WHEN Gender = 'Men' THEN Amount ELSE 0 END) AS TotalMenAmount
FROM vrindastoredatatable
GROUP BY Category;
