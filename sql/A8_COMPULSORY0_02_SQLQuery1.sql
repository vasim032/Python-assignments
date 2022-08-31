USE ecomm_data;
SELECT * FROM [dbo].[Customers];
SELECT * FROM [dbo].[Orders];
SELECT * FROM [dbo].[Products];
SELECT * FROM [dbo].[OrderDetails];
SELECT * FROM [dbo].[Suppliers];
--1. Find the favorite brand of all the CustomerID’s
select TOP 1  Brand, count(customerId) AS NUM_ORDERS
from Orders left join OrderDetails 
on Orders.OrderID = OrderDetails.OrderID
left join Products on OrderDetails.ProductID = Products.ProductID
GROUP BY Brand
ORDER BY count(customerId) DESC;


--2. Find the orderID’s where only products with saleprice greater than 400 were ordered
SELECT a.OrderID, b.Sale_Price
FROM [dbo].[OrderDetails] AS a
INNER JOIN [dbo].[Products] AS b
ON a.ProductID = b.ProductID
WHERE b.sale_price > 400;

--3. Find the supplierID who supplied stuff to 10+ customers who have the
--same email service provider as themselves. (Hint: Supplier First name
--occurs as a substring in the supplier email address)
SELECT * FROM SUPPLIERS;
SELECT * FROM OrderDetails;
SELECT * FROM Orders;

SELECT A.SupplierID , COUNT(C.CUSTOMERID) AS NUM_CUSTOMERS
FROM Suppliers AS A
INNER JOIN OrderDetails AS B
ON A.SupplierID = B.SupplierID
LEFT JOIN Orders AS C
ON B.OrderID = C.OrderID
GROUP BY A.SupplierID;

