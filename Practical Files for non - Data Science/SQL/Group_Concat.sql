use vrindastoredata;
-- STUFF is not supported in MySql So GROUP_CONCAT is used with help of Seperator ,
SELECT 
    Cust_ID,
    GROUP_CONCAT(Order_ID ORDER BY Order_ID SEPARATOR ',') AS OrderIDs
FROM vrindastoredatatable
GROUP BY Cust_ID;



