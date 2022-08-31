USE [Hello World];
CREATE TABLE Departments 
(ID int,
Departments varchar(15));
INSERT INTO Departments VALUES
(1, 'IT'),
(2, 'Management'),
(3, 'Sales'),
(4, 'HR'),
(5, 'Accounts');

SELECT * FROM employee;
SELECT * FROM Departments;
/*Q.1 Find the following from the given tables.
a. Find the cumulative sum of salary using:
i. window function*/SELECT *, SUM(salary) OVER(ORDER BY ID) AS com_salaryFROM employee --ii. self joinSELECT a.Salary, SUM(b.salary) AS com_salaryFROM employee AS a LEFT JOIN employee AS bON a.ID >= b.ID GROUP BY a.salaryORDER BY SUM(b.salary)/*b. Find the department wise average salary using:
i. Window function*/
SELECT *, AVG(a.Salary) OVER(PARTITION BY b.departments) AS avg_salaryFROM employee AS aLEFT JOIN Departments AS bON a.dept_id = b.id--ii. Group BySELECT b.Departments, AVG(a.salary) AS avg_salaryFROM employee AS aRIGHT JOIN departments AS bON a.dept_id = b.IDGROUP BY b.Departments;--c. Find the employees who have their salary greater than their Department’s average salary.SELECT * FROM employee;
SELECT * FROM Departments;

select * from (
select * ,Avg(salary) over (partition by Dept_ID) As AVG_SAL from Employee)AAA 
where salary>AVG_SAL;

--d. Write a query to print the maximum salary per job role (using window function) 
SELECT *, MAX(SALARY) OVER (PARTITION BY job_role ORDER BY job_role) AS max_salary
FROM employee;

--e. Write a query to print the minimum salary per job role (using window function) 
SELECT *, MIN(salary) OVER (PARTITION BY job_role ORDER BY job_role) AS min_salary
FROM employee;

/* f. Write a query to print the maximum salary per job role (using window function),
minimum salary per job role (using window function) in two separate columns in the
output table (this is a combination of 1c and 1d).*/
SELECT *, MAX(SALARY) OVER (PARTITION BY job_role ORDER BY job_role) AS max_salary,
MIN(salary) OVER (PARTITION BY job_role ORDER BY job_role) AS min_salary
FROM employee;

--g. Write a query to print the maximum salary per department (using window function) 
SELECT *, MAX(a.salary) OVER (PARTITION BY b.departments ORDER BY b.departments) AS max_salary
FROM employee AS a LEFT JOIN Departments AS b
ON a.dept_id = b.ID

--h. Write a query to print the minimum salary per department (using window function)
SELECT *, MIN(a.salary) OVER (PARTITION BY b.departments ORDER BY b.departments) AS min_salary
FROM employee AS a LEFT JOIN Departments AS b
ON a.dept_id = b.ID
select * from employee;
select * from Departments;

--2. a. Create a view for each department and name the view in the name of the department. 
CREATE VIEW IT AS
SELECT a.* 
FROM employee AS a LEFT JOIN Departments AS b
ON a.Dept_ID = b.ID
WHERE b.Departments = 'IT';

CREATE VIEW Management AS
SELECT a.* 
FROM employee AS a LEFT JOIN Departments AS b
ON a.Dept_ID = b.ID
WHERE b.Departments = 'Management';

CREATE VIEW Sales AS
SELECT a.* 
FROM employee AS a LEFT JOIN Departments AS b
ON a.Dept_ID = b.ID
WHERE b.Departments = 'Sales';

CREATE VIEW HR AS
SELECT a.* 
FROM employee AS a LEFT JOIN Departments AS b
ON a.Dept_ID = b.ID
WHERE b.Departments = 'HR';

CREATE VIEW Accounts AS
SELECT a.* 
FROM employee AS a LEFT JOIN Departments AS b
ON a.Dept_ID = b.ID
WHERE b.Departments = 'Accounts'

--b. Create a view for each gender and name the view as male and female.CREATE VIEW Male AS
SELECT a.* 
FROM employee AS a LEFT JOIN Departments AS b
ON a.Dept_ID = b.ID
WHERE a.Gender = 'M';

CREATE VIEW Female AS
SELECT a.* 
FROM employee AS a LEFT JOIN Departments AS b
ON a.Dept_ID = b.ID
WHERE a.Gender = 'F';

SELECT * from employee;
SELECT * FROM Departments;
-- c. Create a view containing 5 highest paid employees. 
CREATE VIEW highest_paid_employee AS
SELECT TOP 5 name, salary 
FROM employee
ORDER BY Salary DESC
SELECT * FROM highest_paid_employee;