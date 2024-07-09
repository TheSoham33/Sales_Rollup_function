/*CREATE TABLE Sales (
    ProductCategory VARCHAR(50),
    ProductName VARCHAR(50),
    SaleAmount DECIMAL(10, 2)
);
INSERT INTO Sales (ProductCategory, ProductName, SaleAmount) VALUES
('Electronics', 'Laptop', 1000),
('Electronics', 'Phone', 800),
('Electronics', 'Tablet', 500),
('Clothing', 'Shirt', 300),
('Clothing', 'Pants', 400);
('Furniture', 'Sofa', 1200),
('Furniture', 'Bed', 900),
('Furniture', 'Chair', 200),
('Electronics', 'Charger', 200),
('Electronics', 'Power Bank', 900),
('Clothing', 'Pajama', 350),
('Clothing', 'Punjabi', 800);*/


SELECT 
    COALESCE(ProductCategory, 'Total') AS ProductCategory, 
    COALESCE(ProductName, 'Total') AS ProductName, 
    SUM(SaleAmount) AS TotalSales
FROM 
    Sales
GROUP BY 
    ROLLUP(ProductCategory, ProductName)
ORDER BY 
    CASE WHEN ProductCategory IS NULL THEN 1 ELSE 0 END, 
    ProductCategory, 
    CASE WHEN ProductName IS NULL THEN 1 ELSE 0 END, 
    ProductName;





