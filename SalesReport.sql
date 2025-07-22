CREATE DATABASE SalesReportGeneration;
USE SalesReportGeneration;
Create the Sales table
CREATE TABLE ProductSales (
ProductCategory VARCHAR(50),
ProductName VARCHAR(100),
SaleAmount DECIMAL(10,2));
-- Insert sample data
INSERT INTO ProductSales (ProductCategory, ProductName, SaleAmount) VALUES
('Beverages', 'Tea', 100.00),
('Beverages', 'Coffee', 150.00),
('Beverages', 'Juice', 200.00),
('Snacks', 'Chips', 120.00),
('Snacks', 'Cookies', 180.00),
('Snacks', 'Nuts', 160.00),
('Dairy', 'Milk', 250.00),
('Dairy', 'Cheese', 300.00);
-- Sales report using ROLLUP
SELECT 
    ISNULL(ProductCategory, 'TOTAL') AS ProductCategory,
    ISNULL(ProductName, 'Subtotal') AS ProductName,
    SUM(SaleAmount) AS TotalSales
FROM ProductSales
GROUP BY ROLLUP (ProductCategory, ProductName);
GO
CREATE VIEW vw_ProductSalesReport AS
SELECT 
    ISNULL(ProductCategory, 'TOTAL') AS ProductCategory,
    ISNULL(ProductName, 'Subtotal') AS ProductName,
    SUM(SaleAmount) AS TotalSales
FROM ProductSales
GROUP BY ROLLUP (ProductCategory, ProductName);
GO
SELECT * FROM vw_ProductSalesReport;

