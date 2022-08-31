USE [Hello World];

--2. a. Calculate the total order amount of all the customers using:
--i. Group By
SELECT SUM(orderamount) AS total_order_amount
FROM customerorders;

--ii. Window Function
SELECT SUM(orderamount) OVER (PARTITION BY orderID) AS total_order_amount
FROM customerorders;

--b. Write a Query to add the city wise cumulative order amounts in a
--new column.
SELECT *, SUM(a.orderamount) OVER (ORDER BY b.city) AS cum_order_amount
FROM customerorders AS a LEFT JOIN customerdetails AS b
ON a.customername = b.customername
SELECT * FROM customerorders;
SELECT * FROM customerdetails;
/*c. Write a Query to find the cumulative sum of order amounts based
on ascending order of order dates using:
i. Self Join*/
SELECT SUM(a.orderamount) AS com_salary
FROM customerorders AS a LEFT JOIN customerorders AS b
ON a.orderamount >= b.orderamount
GROUP BY a.orderamount
ORDER BY a.orderdate

ii. Window Function
select now();