use [hello world];
SELECT * FROM cgpa;
UPDATE table cgpa 
SET x= round(x) 
/*Q 1. QA. Find the overall rank of each student in class.
Note : Try all the rank functions and suggest which rank function should be used for ranking and
why?*/
SELECT *, DENSE_RANK() OVER (order by x DESC) AS student_rank
FROM cgpa;
SELECT * FROM cgpa;
/*QB. WAQ to find the section wise
a. Average CGPA*/
SELECT *, AVG(X) OVER (PARTITION BY section) AS avg_cgpa
FROM cgpa;

--b. Cumulative average of CGPA
SELECT *,AVG(X) OVER(ORDER BY roll_number) AS com_avg
FROM cgpa;

--c. First rank holder (Assign lowest rank to highest scorer)
SELECT TOP 1 *,  DENSE_RANK() OVER (order by X DESC) as student_rank
FROM cgpa;

--d. Highest scorer
SELECT TOP 1 *, MAX(X) OVER (order by X DESC) as highest_marks
FROM cgpa;
SELECT * FROM employee;
SELECT * FROM departments;
--Q 4. Find the following from the given tables.
--a. Find the rank of each employee according to their salary
SELECT *, dense_rank () OVER (ORDER BY salary) AS rank_salary
FROM employee;

--b. Find the 3rd highest salary in the company using a window function.
SELECT * FROM (
SELECT *, dense_rank() OVER (ORDER BY salary DESC) AS salary_rank 
FROM employee)c
WHERE salary_rank = 3;

use [hello world];
select * from employee;
select * from departments;

--c. Find the 4th Highest salary in each department.
SELECT * FROM(
SELECT a.*, b.departments, DENSE_RANK() OVER (PARTITION BY b.departments ORDER BY a.salary DESC) AS salary_rank
FROM employee AS a LEFT JOIN departments AS b
ON a.dept_id = b.id)c WHERE salary_rank = 4

--d. Find the department wise cumulative salary with salary ordered in ascending order.
SELECT *, SUM(a.salary) OVER (PARTITION BY b.Departments ORDER BY a.salary) AS com_salary
FROM employee AS a LEFT JOIN Departments AS b 
ON a.Dept_ID = b.ID;

/*e. Print the average salary of the employees in a new column using a window function,
partitioning by gender.*/
SELECT *, AVG(salary) OVER (ORDER BY ID) AS avg_salary
FROM employee;

/*f. Divide the employees into quartiles by utilizing their Salary to bucket them. Maximum
salaried employees should fall in 1st Quartile.
(Here, Quartile means divide data into 4 buckets)*/
SELECT * FROM employee;
SELECT *, NTILE(4) OVER (ORDER BY salary DESC) AS empl_division
FROM employee;

/*5. You are given a Transactions table for the year 2021 Columns(id, remark, amount, CREATEDAT,
userID). For each user, find the MONTH when the total amount transacted by them was
maximum*/
SELECT *, MONTH(

--6. Find the cumulative sum of sales month wise: Question on sales
SELECT SUM(sales) OVER (PARTITION BY MONTH(DATE)) AS com_sales
FROM table;