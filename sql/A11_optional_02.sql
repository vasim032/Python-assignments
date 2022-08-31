USE Hello_World;
SELECT * FROM [dbo].[CustomerDetails (1)];
SELECT * FROM [dbo].[CustomerOrders (1)];
/*1. What is the difference between Group By and Window Functions? List 3
differences in terms of advantages and disadvantages.*//*

2. Given Two Tables, perform the following:
CustomerOrders.csv
CustomerDetails.csv*/
/*a. Calculate the total order amount of all the customers using:
i. Group By
ii. Window Function*/
SELECT CustomerID, SUM(orderamount) As sum
FROM [dbo].[CustomerOrders (1)]
GROUP BY CustomerID

SELECT CustomerID, SUM(orderamount) OVER(partition by CustomerID) AS sum
FROM [dbo].[CustomerOrders (1)]

--b. Write a Query to add the city wise cumulative order amounts in a new column
SELECT * FROM [dbo].[CustomerDetails (1)];
SELECT * FROM [dbo].[CustomerOrders (1)];

SELECT *, SUM(b.orderamount) OVER(PARTITION BY a.city ORDER BY b.orderID) AS COM_order_amount
FROM [dbo].[CustomerDetails (1)] AS a
LEFT JOIN [dbo].[CustomerOrders (1)] AS b
ON a.customername = b.customername;

/*c. Write a Query to find the cumulative sum of order amounts based on ascending order of order dates using:
i. Self Join
ii. Window Function*/
SELECT a.orderamount, sum(b.orderamount) AS com_sum
FROM [dbo].[CustomerOrders (1)] AS a
LEFT JOIN [dbo].[CustomerOrders (1)] AS b
ON a.OrderID >= b.OrderID
GROUP BY a.orderamount
ORDER BY sum(b.orderamount), b.OrderDate

SELECT orderamount, SUM(orderamount) OVER(ORDER BY orderdate) AS com_sum
FROM [dbo].[CustomerOrders (1)]
/*d. Extract the different Month-Year combinations from the orderdates. Now calculate 
the cumulative average of order amounts partitioning by the Month-Year combinations.*/
SELECT * FROM [dbo].[CustomerDetails (1)];
SELECT * FROM [dbo].[CustomerOrders (1)];

SELECT  MONTH(orderDate) AS month, YEAR(orderdate) AS year, orderamount,
AVG(orderAmount) OVER(PARTITION BY MONTH(orderDate), YEAR(orderdate) ORDER BY orderamount) AS com_avg_order_amount
FROM [dbo].[CustomerOrders (1)];

