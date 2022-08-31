USE [Hello World];
--question 1
CREATE table assignment_table(
customerid int,
first_name varchar(15), 
last_name varchar(20), 
city varchar(20), 
country varchar(20), 
pincode int);
INSERT INTO [dbo].[assignment_table]
values
(1, 'Geetika', 'Chauhan', 'MHOW','India', 453441),
(2, 'Piyush', 'Patidar', 'Indore', 'India', 453401),
(3, 'Nitin', 'Chauhan', 'New York', 'USA', 666784),
(4, 'Naincy', 'Raj', 'New Jersey', 'USA', 789442)

--question 2
ALTER TABLE [dbo].[assignment_table] ADD state varchar(20);

--question 3
UPDATE [dbo].[assignment_table] SET state= 'Maha' WHERE customerid =1
UPDATE [dbo].[assignment_table] SET state= 'MP' WHERE customerid =2
UPDATE [dbo].[assignment_table] SET state= 'ABC' WHERE customerid =3
UPDATE [dbo].[assignment_table] SET state= 'XYZ' WHERE customerid =4

--question 4
INSERT INTO [dbo].[assignment_table] values (5, 'Vasim', 'Khan', 'Nagpur', 'India', 445001);

--question 5
DELETE FROM [dbo].[assignment_table] WHERE city = 'Indore';

--question 6
UPDATE [dbo].[assignment_table] SET city = 'Indore' WHERE first_name = 'Geetika';

--question 7
UPDATE [dbo].[assignment_table] SET city = 'Lucknow', state = 'UP', country= 'India' WHERE customerid = 4;

--question 8
DELETE FROM [dbo].[assignment_table] WHERE country = 'USA';

--question 9
DELETE FROM [dbo].[assignment_table];

select * from [dbo].[assignment_table]

