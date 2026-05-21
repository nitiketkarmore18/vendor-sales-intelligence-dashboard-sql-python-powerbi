CREATE DATABASE vendor_performance_analytics;

USE vendor_performance_analytics;

CREATE TABLE vendor_summary (
    VendorName VARCHAR(255),
    Total_Revenue DECIMAL(15,2),
    Total_Quantity_Sold INT,
    Average_Revenue_Per_Unit DECIMAL(10,2)
);

SELECT COUNT(*) FROM vendor_summary;

SELECT VendorName, Total_Revenue FROM vendor_summary
ORDER BY Total_Revenue DESC
LIMIT 10;

SELECT VendorName, Total_Revenue,
       ROUND( 
             (Total_Revenue/
             (SELECT SUM(Total_Revenue) FROM vendor_summary)) * 100, 2
		) AS Revenue_Contribution_Percentage
FROM vendor_summary
ORDER BY Total_Revenue DESC
LIMIT 10;

CREATE TABLE product_summary (
    Description VARCHAR(255),
    Total_Product_Revenue DECIMAL(15,2),
    Total_Product_Quantity INT,
    Average_Revenue_Per_Unit DECIMAL(10,2)
);

SELECT * FROM product_summary;

SELECT COUNT(*) FROM product_summary;

SELECT description, Total_Product_Revenue FROM product_summary
ORDER BY  Total_Product_Revenue DESC
LIMIT 10;

SELECT description,  Total_Product_Quantity FROM product_summary
ORDER BY  Total_Product_Quantity DESC
LIMIT 10;

SELECT  description, Average_Revenue_Per_Unit FROM product_summary
ORDER BY Average_Revenue_Per_Unit DESC
LIMIT 10;

CREATE TABLE store_summary (
     Store VARCHAR(100),
     Total_Store_Revenue DECIMAL(15,2),
     Total_Store_Quantity INT
);

SELECT * FROM store_summary;

SELECT COUNT(*) FROM store_summary;

SELECT Store, Total_Store_Revenue, Total_Store_Quantity FROM store_summary
ORDER BY Total_Store_Revenue DESC;

CREATE TABLE inventory_summary (
     Description VARCHAR(255),
     Remaining_Stock INT,
     Remaining_Inventory_Value DECIMAL(15,2)
);

SELECT description, Remaining_Stock FROM inventory_summary
ORDER BY Remaining_Stock DESC
LIMIT 10;

SELECT description, Remaining_Inventory_Value FROM inventory_summary
ORDER BY Remaining_Inventory_Value DESC
LIMIT 10;

SELECT 
    COUNT(*) AS Total_Vendors,
    ROUND(SUM(Total_Revenue), 2) AS Total_Business_Revenue,
    ROUND(AVG(Total_Revenue), 2) AS Average_Vendor_Revenue,
    MAX(Total_Revenue) AS Highest_Vendor_Revenue,
    MIN(Total_Revenue) AS Lowest_Vendor_Revenue
FROM vendor_summary;


