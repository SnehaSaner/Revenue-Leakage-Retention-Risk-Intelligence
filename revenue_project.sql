CREATE DATABASE revenue_project;

USE revenue_project;

RENAME TABLE `global_superstore(csv)` TO orders;

SELECT COUNT(*) FROM orders;

SELECT * FROM orders LIMIT 5;

Desc orders;

ALTER TABLE orders 
CHANGE COLUMN `ï»¿Order ID` Order_ID TEXT;

ALTER TABLE orders CHANGE COLUMN `Order Date` Order_Date TEXT;
ALTER TABLE orders CHANGE COLUMN `Ship Date` Ship_Date TEXT;
ALTER TABLE orders CHANGE COLUMN `Ship Mode` Ship_Mode TEXT;
ALTER TABLE orders CHANGE COLUMN `Customer ID` Customer_ID TEXT;
ALTER TABLE orders CHANGE COLUMN `Customer Name` Customer_Name TEXT;
ALTER TABLE orders CHANGE COLUMN `Postal Code` Postal_Code TEXT;
ALTER TABLE orders CHANGE COLUMN `Product ID` Product_ID TEXT;
ALTER TABLE orders CHANGE COLUMN `Sub-Category` Sub_Category TEXT;
ALTER TABLE orders CHANGE COLUMN `Product Name` Product_Name TEXT;
ALTER TABLE orders CHANGE COLUMN `Shipping Cost` Shipping_Cost DOUBLE;
ALTER TABLE orders CHANGE COLUMN `Order Priority` Order_Priority TEXT;
ALTER TABLE orders CHANGE COLUMN `Profit Margin` Profit_Margin TEXT;
ALTER TABLE orders CHANGE COLUMN `Revenue Leakage Flag` Revenue_Leakage_Flag TEXT;
ALTER TABLE orders CHANGE COLUMN `Discount Level` Discount_Level TEXT;

ALTER TABLE orders 
MODIFY Order_Date DATE;

ALTER TABLE orders 
MODIFY Ship_Date DATE;

CREATE VIEW revenue_leakage_summary AS
SELECT 
    Category,
    SUM(CASE WHEN Profit < 0 THEN Sales ELSE 0 END) AS Leakage_Revenue,
    SUM(Sales) AS Total_Revenue,
    ROUND(SUM(CASE WHEN Profit < 0 THEN Sales ELSE 0 END)/SUM(Sales)*100,2) AS Leakage_Percent
FROM orders
GROUP BY Category;

SELECT count(distinct Customer_ID)
FROM orders;

SELECT Customer_ID, COUNT(DISTINCT Order_ID) AS order_count
FROM orders
GROUP BY Customer_ID
HAVING COUNT(DISTINCT Order_ID) > 1;

CREATE VIEW retention_summary AS
SELECT 
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    
    COUNT(DISTINCT CASE 
        WHEN order_count > 1 THEN Customer_ID 
    END) AS Repeat_Customers,
    
    ROUND(
        COUNT(DISTINCT CASE 
            WHEN order_count > 1 THEN Customer_ID 
        END) 
        / COUNT(DISTINCT Customer_ID) * 100, 
    2) AS Retention_Rate_Percent

FROM (
    SELECT Customer_ID, COUNT(DISTINCT Order_ID) AS order_count
    FROM orders
    GROUP BY Customer_ID
) AS customer_orders;

SELECT * FROM retention_summary;

CREATE VIEW retention_by_segment AS
SELECT 
    Segment,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT CASE WHEN order_count > 1 THEN Customer_ID END) AS Repeat_Customers,
    ROUND(
        COUNT(DISTINCT CASE WHEN order_count > 1 THEN Customer_ID END) 
        / COUNT(DISTINCT Customer_ID) * 100, 2
    ) AS Retention_Rate
FROM (
    SELECT Segment, Customer_ID, COUNT(DISTINCT Order_ID) AS order_count
    FROM orders
    GROUP BY Segment, Customer_ID
) t
GROUP BY Segment;

SELECT * FROM retention_by_segment;