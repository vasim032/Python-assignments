--optional 12
/*c. Filter the records to have customers who ordered more than once. Now rank their orders based on
ascending order of order dates. */
SELECT * FROM [dbo].[CustomerDetails (1)];
SELECT * FROM [dbo].[CustomerOrders (1)];

SELECT *, rank() OVER(PARTITION BY customerid ORDER BY orderdate) AS order_rank
FROM [dbo].[CustomerOrders (1)] 
WHERE CustomerID IN(
SELECT CustomerID 
FROM [dbo].[CustomerOrders (1)] 
GROUP BY CustomerID 
HAVING COUNT(OrderID) > 1);
