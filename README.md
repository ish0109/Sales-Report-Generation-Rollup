# Project: Sales Report Generation using SQL Server ROLLUP

## Overview

This project involves creating a SQL Server-based sales report that summarizes sales data by product category and product name. The main goal is to use the `ROLLUP` function in SQL Server to calculate **subtotals per category** and a **grand total** across all sales, and then visualize the results using Microsoft Excel charts.

## Table Structure

The table `ProductSales` contains the following columns:
- `ProductCategory` (VARCHAR): The category of the product sold (e.g., Beverages, Snacks).
- `ProductName` (VARCHAR): The name of the product (e.g., Tea, Coffee).
- `SaleAmount` (DECIMAL): The amount of the sale.

## Steps

1. **Create the Database and Table:**
   ```sql
   CREATE DATABASE SalesReportGeneration;
   USE SalesReportGeneration;

   CREATE TABLE ProductSales (
       ProductCategory VARCHAR(50),
       ProductName VARCHAR(100),
       SaleAmount DECIMAL(10,2)
   );
2. **Insert Sample Data:**
```sql
INSERT INTO ProductSales (ProductCategory, ProductName, SaleAmount) VALUES
('Beverages', 'Tea', 100.00),
('Beverages', 'Coffee', 150.00),
('Beverages', 'Juice', 200.00),
('Snacks', 'Chips', 120.00),
('Snacks', 'Cookies', 180.00),
('Snacks', 'Nuts', 160.00),
('Dairy', 'Milk', 250.00),
('Dairy', 'Cheese', 300.00);
```

3. **Generate the ROLLUP Report:**
```sql
SELECT 
    ISNULL(ProductCategory, 'TOTAL') AS ProductCategory,
    ISNULL(ProductName, 'Subtotal') AS ProductName,
    SUM(SaleAmount) AS TotalSales
FROM ProductSales
GROUP BY ROLLUP (ProductCategory, ProductName);
```
4. **Create a View for Reusability:**
```sql
CREATE VIEW vw_ProductSalesReport AS
SELECT 
    ISNULL(ProductCategory, 'TOTAL') AS ProductCategory,
    ISNULL(ProductName, 'Subtotal') AS ProductName,
    SUM(SaleAmount) AS TotalSales
FROM ProductSales
GROUP BY ROLLUP (ProductCategory, ProductName);
```
5. **Query the View:**
```sql
SELECT * FROM vw_ProductSalesReport;
```
**Usage**
Run the above SQL script in SQL Server Management Studio (SSMS) to generate the sales report using the ROLLUP operator. You can copy the output and visualize it in Excel using clustered column charts or stacked bar charts to show product-wise and category-wise sales trends.

Screenshot
<img width="1388" height="1091" alt="Screenshot 2025-07-22 212426" src="https://github.com/user-attachments/assets/42833d5a-94c0-432a-b84b-9129f3ec705a" />

Visualisation using Excel charts:
<img width="929" height="308" alt="image" src="https://github.com/user-attachments/assets/fb891af9-ed15-40fc-a1e2-5d0a8a76e2f1" />


Contact
If you have any questions or would like to discuss the project:

Name: Ishita Ghosh

ID: CT_CSI_SQ_4171 

Email: ishitag0109@gmail.com

LinkedIn: www.linkedin.com/in/ishita01
