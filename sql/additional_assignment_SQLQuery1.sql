USE Hello_World;
SELECT * FROM [table 1];
CREATE TABLE [table 2]
(EMPLOYEE_ID INT,
FIRST_NAME VARCHAR(10),
LAST_NAME VARCHAR(10),
EMAIL VARCHAR(10),
SALARY INT,
MANAGER_ID INT,
DEPARTMENT_ID INT);
INSERT INTO [table 2] VALUES
(100, 'Steven', 'King', 'SKING', 24000, 0,90),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', 17000, 100, 90),
(102, 'Lex', 'De Haan', 'LDEHAAN', 17000, 100, 90),
(103, 'Alexander', 'Hunold', 'AHUNOLD', 9000, 102 ,60),
(104, 'Bruce', 'Ernst', 'BERNST', 6000, 103, 60),
(105, 'David', 'Austin', 'DAUSTIN', 4800, 103, 60);
CREATE TABLE [table 3]
(GRADE_LEVEL VARCHAR(1),
LOWESER_SAL INT,
HIGHEST_SAL INT);
INSERT INTO [table 3] VALUES
('A', 1000, 2999),
('B', 3000, 5999),
('C', 6000, 9999),
('D', 10000, 14999),
('E', 15000, 24999),
('F', 25000, 40000);
SELECT * FROM [table 1];
SELECT * FROM [table 2];
SELECT * FROM [table 3];
--a. Write a query in SQL to display the first name, last name, department number, and department name for each employee
SELECT b.first_name, b.last_name, a.department_id, a.department_name
FROM [table 1] AS a
RIGHT JOIN [table 2] AS b
ON a.DEPARTMENT_ID = b.DEPARTMENT_ID;
--b. Write a query in SQL to display the first name, last name, salary, and job grade for all employees
SELECT b.first_name, b.last_name, b.salary, CASE
WHEN b.SALARY IN (1000, 2999) THEN 'A'
WHEN b.SALARY IN (3000, 5999) THEN 'B'
WHEN b.SALARY IN (6000, 99990) THEN 'C'
WHEN b.SALARY IN (10000, 14999) THEN 'D'
WHEN b.SALARY IN (15000, 24999) THEN 'E'
WHEN b.SALARY IN (25000, 40000) THEN 'F'
END AS JOB_GRADE
FROM [table 1] AS a
RIGHT JOIN [table 2] AS b ON a.DEPARTMENT_ID = b.DEPARTMENT_ID

--c. Write a query to identify all managers and get all the available details for them
SELECT a.MANAGER_ID, a.LOCATION_ID, a.DEPARTMENT_NAME
FROM [table 1] AS a 
LEFT JOIN [table 2] AS b 
ON a.DEPARTMENT_ID = b.DEPARTMENT_ID

USE [Hello World];
SELECT * FROM Employees;

--Q4. You are given Table Employees, Employees.csv
--Write a query
--1. Add “@abccompany.com” in the end to email and create a new column called
--Email_detail
ALTER TABLE Employees ADD [email detail] AS(email + '@abccompany.com')

--2. Find cumulative average of commission_pct at department_id and manager_id level.
--Exclude the records which have commission_pct as Zero(0)
SELECT manager_id, department_id, SUM(commission_pct) OVER (ORDER BY employee_id) AS comm_sum
FROM Employees
WHERE COMMISSION_PCT != 0

--3. Find maximum and minimum salary for employees under each Manager with their Name
SELECT FIRST_NAME, LAST_NAME, MAX(SALARY), MIN(SALARY)
FROM Employees
GROUP BY MANAGER_ID,MAX(SALARY), MIN(SALARY)

--4. Find all the employees who have “an” in first name and “a” in last name along with
--their manager’s name
SELECT a.FIRST_NAME AS employee, b.FIRST_NAME AS manager
FROM Employees AS a LEFT JOIN Employees AS b
ON a.MANAGER_ID = b.EMPLOYEE_ID
WHERE a.FIRST_NAME like '%an%' AND a.LAST_NAME like '%a%'

