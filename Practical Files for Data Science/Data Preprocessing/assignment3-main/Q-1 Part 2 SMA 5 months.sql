-- SMA for 5 Months

use vrinda;
WITH monthly_sales AS
(SELECT `month`,`B2B`,SUM(`Amount`) as TotalSales
FROM vrinda 
WHERE `month` IN ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')

GROUP BY `month`, `B2B`),
sma AS 
(SELECT`month`,`B2B`,TotalSales,AVG(TotalSales) OVER (PARTITION BY `B2B` ORDER BY FIELD(`month`, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec') ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS SMA
FROM monthly_sales)

SELECT`month`,`B2B`,TotalSales,SMA
FROM sma
ORDER BY FIELD(`month`, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'), `B2B`;