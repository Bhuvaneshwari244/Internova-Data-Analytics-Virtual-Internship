CREATE DATABASE internova_ecommerce;

USE internova_ecommerce;

SELECT COUNT(*) AS total_records
FROM cleaned_ecommerce_sales;

SELECT *
FROM cleaned_ecommerce_sales
LIMIT 10;

DESCRIBE cleaned_ecommerce_sales;

SELECT COUNT(*) AS total_records
FROM cleaned_ecommerce_sales;

SELECT
    Order_Date,
    Quantity,
    Price,
    Total,
    Original_Total,
    Gross_Amount,
    Total_Difference
FROM cleaned_ecommerce_sales
LIMIT 15;

SELECT VERSION();


SELECT
    COUNT(*) AS total_records,
    COUNT(ID) AS non_null_ids,
    COUNT(DISTINCT ID) AS unique_ids,
    MIN(ID) AS minimum_id,
    MAX(ID) AS maximum_id
FROM cleaned_ecommerce_sales;


SELECT ID, Customer_Name, Order_ID
FROM cleaned_ecommerce_sales
ORDER BY ID;

SELECT COUNT(*) AS total_records
FROM ecommerce_sales_staging;


SELECT ID, Quantity
FROM ecommerce_sales_staging
WHERE Quantity IS NULL OR Quantity = ''
ORDER BY ID;


CREATE TABLE ecommerce_sales AS
SELECT
    CAST(NULLIF(ID, '') AS UNSIGNED) AS ID,
    Customer_Name,
    Order_ID,
    STR_TO_DATE(NULLIF(Order_Date, ''), '%Y-%m-%d') AS Order_Date,
    Product,
    Category,
    CAST(NULLIF(Quantity, '') AS SIGNED) AS Quantity,
    CAST(NULLIF(Price, '') AS DECIMAL(12,2)) AS Price,
    Payment_Method,
    Status,
    CAST(NULLIF(Total, '') AS DECIMAL(14,3)) AS Total,
    CAST(NULLIF(Original_Total, '') AS DECIMAL(14,3)) AS Original_Total,
    CAST(NULLIF(Gross_Amount, '') AS DECIMAL(14,3)) AS Gross_Amount,
    CAST(NULLIF(Total_Difference, '') AS DECIMAL(14,3)) AS Total_Difference,
    Total_Check
FROM ecommerce_sales_staging;



SELECT COUNT(*) AS total_records
FROM ecommerce_sales;

DESCRIBE ecommerce_sales;


SELECT COUNT(*) AS total_records
FROM ecommerce_sales;


SELECT *
FROM ecommerce_sales
ORDER BY ID
LIMIT 10;


SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT Customer_Name) AS unique_customers,
    COUNT(DISTINCT Order_ID) AS unique_orders,
    SUM(Quantity) AS total_units_sold,
    SUM(Total) AS total_recorded_sales,
    COUNT(Total) AS valid_sales_records,
    COUNT(*) - COUNT(Total) AS missing_sales_records,
    ROUND(AVG(Total), 2) AS average_recorded_value
FROM ecommerce_sales;



SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS sales_month,
    COUNT(*) AS total_transactions,
    COUNT(Total) AS valid_sales_records,
    ROUND(SUM(Total), 2) AS monthly_recorded_sales
FROM ecommerce_sales
WHERE Order_Date IS NOT NULL
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY sales_month;




SELECT
    Product,
    SUM(Quantity) AS total_units_sold,
    COUNT(*) AS total_transactions,
    COUNT(Total) AS valid_sales_records,
    ROUND(SUM(Total), 2) AS total_recorded_sales
FROM ecommerce_sales
GROUP BY Product
ORDER BY total_recorded_sales DESC;


SELECT
    Category,
    SUM(Quantity) AS total_units_sold,
    COUNT(*) AS total_transactions,
    COUNT(Total) AS valid_sales_records,
    ROUND(SUM(Total), 2) AS total_recorded_sales
FROM ecommerce_sales
GROUP BY Category
ORDER BY total_recorded_sales DESC;



SELECT
    Customer_Name,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT Order_ID) AS unique_orders,
    SUM(Quantity) AS total_units_purchased,
    ROUND(SUM(Total), 2) AS total_recorded_sales
FROM ecommerce_sales
GROUP BY Customer_Name
ORDER BY total_recorded_sales DESC
LIMIT 10;


SELECT
    Status,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT Order_ID) AS unique_orders,
    COUNT(Total) AS valid_sales_records,
    SUM(Quantity) AS total_units_sold,
    ROUND(SUM(Total), 2) AS total_recorded_sales
FROM ecommerce_sales
GROUP BY Status
ORDER BY total_recorded_sales DESC;


SELECT
    Payment_Method,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT Order_ID) AS unique_orders,
    COUNT(Total) AS valid_sales_records,
    SUM(Quantity) AS total_units_sold,
    ROUND(SUM(Total), 2) AS total_recorded_sales
FROM ecommerce_sales
GROUP BY Payment_Method
ORDER BY total_recorded_sales DESC;


SELECT
    COUNT(*) AS total_records,

    SUM(Order_Date IS NULL) AS missing_order_dates,

    SUM(Category IS NULL OR Category = '') AS missing_categories,

    SUM(Quantity IS NULL) AS missing_quantities,

    SUM(Price IS NULL) AS missing_prices,

    SUM(Total IS NULL) AS missing_sales_values,

    (
        SELECT COALESCE(SUM(duplicate_count - 1), 0)
        FROM (
            SELECT COUNT(*) AS duplicate_count
            FROM ecommerce_sales
            GROUP BY ID
            HAVING COUNT(*) > 1
        ) AS duplicate_ids
    ) AS duplicate_ids,

    (
        SELECT COALESCE(SUM(duplicate_count - 1), 0)
        FROM (
            SELECT COUNT(*) AS duplicate_count
            FROM ecommerce_sales
            GROUP BY Order_ID
            HAVING COUNT(*) > 1
        ) AS duplicate_orders
    ) AS duplicate_order_ids,

    SUM(Total < 0) AS negative_sales_records

FROM ecommerce_sales;


SELECT
    ID,
    Customer_Name,
    Order_ID,
    Product,
    Quantity,
    Price,
    Total,
    Status
FROM ecommerce_sales
WHERE ID IN (
    SELECT ID
    FROM ecommerce_sales
    GROUP BY ID
    HAVING COUNT(*) > 1
)
ORDER BY ID, Order_ID;


SELECT
    ID,
    Customer_Name,
    Order_ID,
    Order_Date,
    Product,
    Category,
    Quantity,
    Price,
    Total,
    Status
FROM ecommerce_sales
WHERE Total < 0
ORDER BY Order_Date;

SELECT
    SUM(Quantity < 0) AS negative_quantity_records,
    SUM(Price < 0) AS negative_price_records,
    SUM(Total < 0) AS negative_sales_records
FROM ecommerce_sales;