--A7 OPTIONAL
USE assignment;
CREATE TABLE Venue
(VenueID int,
Venue_Name varchar(3),
Rating int);
INSERT INTO Venue
VALUES
(1, 'AB', 2),
(2, 'BC', 3),
(3, 'CD', 1),
(4, 'EF', 3),
(5, 'FG', 4),
(6, 'GH', 5),
(7, 'HI', 3),
(8, 'IJ', 4),
(9, 'JK', 2),
(10, 'KL', 1);
SELECT * FROM Venue;
SELECT *, CASE
WHEN rating in(1,2) THEN 'Good'
WHEN rating in(3,4) THEN 'Average'
WHEN rating = 5 THEN 'Worst'
END AS Buckets
FROM Venue;

--3. From the above resultant table, print the number of venues categorised in each bucket by applying case when in the group by clause and also
--find average rating in each bucket

SELECT CASE
WHEN rating in(1,2) THEN 'Good'
WHEN rating in(3,4) THEN 'Average'
WHEN rating = 5 THEN 'Worst'
END AS Buckets, count(venue_name) as num_venue
FROM Venue
group by CASE
WHEN rating in(1,2) THEN 'Good'
WHEN rating in(3,4) THEN 'Average'
WHEN rating = 5 THEN 'Worst'
END;
--4. WAQ to print the output of the above question with any other method you can think of.

--Q5 a. Sort the table by placing the records of Countries Canada & Mexico at the top and then sort rest of the records by Customer’s name
SELECT * FROM [Customers ];
SELECT *
FROM [Customers ]
ORDER BY CASE WHEN COUNTRY IN ('CANADA','MEXICO') THEN 0
ELSE 1
END;

--b. Bucketize the countries into three categories - Tier1, Tier2 &
--Tier3(however you want) and find the count of customers in each
--of the buckets
SELECT DISTINCT COUNTRY FROM [Customers ];
SELECT *, CASE WHEN COUNTRY IN ('ARGENTINA','AUSTRIA', 'BELGIUM', 'BRAZIL', 'CANADA', 'DENMARK', 'FINLAND', 'FRANCE', 'GERMANY') THEN 'TIER1'
WHEN COUNTRY IN ('IRELAND', 'ITALY','MEXICO', 'NORWAY', 'POLAND','PORTUGAL','SPAIN','SWEDEN','SWITZERLAND','UK') THEN 'TIER2'
WHEN COUNTRY IN ('USA', 'VENEZUELA') THEN 'TIER3' 
END
FROM CUSTOMERS;

SELECT CASE WHEN COUNTRY IN ('ARGENTINA','AUSTRIA', 'BELGIUM', 'BRAZIL', 'CANADA', 'DENMARK', 'FINLAND', 'FRANCE', 'GERMANY') THEN 'TIER1'
WHEN COUNTRY IN ('IRELAND', 'ITALY','MEXICO', 'NORWAY', 'POLAND','PORTUGAL','SPAIN','SWEDEN','SWITZERLAND','UK') THEN 'TIER2'
WHEN COUNTRY IN ('USA', 'VENEZUELA') THEN 'TIER3' 
END AS BUCKETS, COUNT(CUSTOMERID) AS NUM_CUSTOMER
FROM [Customers ]
GROUP BY CASE WHEN COUNTRY IN ('ARGENTINA','AUSTRIA', 'BELGIUM', 'BRAZIL', 'CANADA', 'DENMARK', 'FINLAND', 'FRANCE', 'GERMANY') THEN 'TIER1'
WHEN COUNTRY IN ('IRELAND', 'ITALY','MEXICO', 'NORWAY', 'POLAND','PORTUGAL','SPAIN','SWEDEN','SWITZERLAND','UK') THEN 'TIER2'
WHEN COUNTRY IN ('USA', 'VENEZUELA') THEN 'TIER3' 
END;

--c. Bucketize the postal codes into categories utilising their length as
--the parameter for bucketing and find the count of customers in
--each bucket and order them in ascending order of their customer count
SELECT * FROM [Customers ];

SELECT CASE WHEN LEN(POSTALCODE) IN (3,4) THEN 'BUCKET 1'
WHEN LEN(POSTALCODE) IN (5,6) THEN 'BUCKET 2'
ELSE 'BUCKET 3'
END AS BUCKET, COUNT(CUSTOMERID) AS NUM_CUSTOMERS
FROM CUSTOMERS
GROUP BY CASE WHEN LEN(POSTALCODE) IN (3,4) THEN 'BUCKET 1'
WHEN LEN(POSTALCODE) IN (5,6) THEN 'BUCKET 2'
ELSE 'BUCKET 3'
END;
