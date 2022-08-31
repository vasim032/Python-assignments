USE [ecomm_data];
SELECT * FROM [dbo].[Customers];
SELECT * FROM [dbo].[Orders];
SELECT * FROM [dbo].[OrderDetails];
SELECT * FROM [dbo].[Products];
ALTER TABLE [dbo].[Products] DROP COLUMN rating;
/*Q.6.
(1) Find the Country wise distinct count of customers */
SELECT Country, COUNT( distinct CustomerID) AS num_customers
FROM [dbo].[Customers]
GROUP BY Country

--Q 6 (2) Create the following table:
SELECT a.city, a.country, COUNT(a.CustomerID) AS customer_count, COUNT(c.OrderID) AS total_orders
FROM [dbo].[Customers] AS a 
LEFT JOIN [dbo].[Orders] AS b
ON a.CustomerID = b.CustomerID
LEFT JOIN [dbo].[OrderDetails] AS c
ON b.OrderID = c.OrderID
GROUP BY a.city, a.country;

--Q 6(3) Create the following table:
SELECT DATEPART(YEAR, a.DateEntered) AS Year, COUNT(b.OrderID) AS Total_orders, SUM(c.Quantity) AS total_quantity, SUM(d.Sale_Price) AS Total_sales
FROM Customers AS a 
LEFT JOIN Orders AS b ON a.CustomerID = b.CustomerID
LEFT JOIN OrderDetails AS c ON b.OrderID = c.OrderID
LEFT JOIN Products AS d ON c.ProductID = d.ProductID
GROUP BY DATEPART(YEAR, a.DateEntered);

--Q 6 (4) Find the Best Performing product in terms of Total Quantity Consumed
SELECT TOP 1 a.Product, SUM(b.quantity) AS total_quantity
FROM Products AS a 
LEFT JOIN OrderDetails AS b 
ON a.ProductID = b.ProductID
GROUP BY a.Product 
ORDER BY SUM(b.quantity) DESC;