use assignment;
CREATE TABLE employeeinfo(
EmpID int,
EmpFname varchar(10),
EmpLname varchar(15),
Department varchar(10),
Project text,
Address varchar(20),
DOB datetime,
Gender char(1));
select * from employeeinfo;
select count(empid) as gender_count, gender from employeeinfo GROUP BY gender;
INSERT INTO employeeinfo VALUES 
(1, 'Sanjay', 'Mehra', 'HR', 'P1', 'Hyderabad(HYD)', '01/12/19', 'M'),
(2 ,'Ananya', 'Mishra', 'Admin','P2','Delhi(DEL)', '02/05/19', 'F'),
(3, 'Rohan', 'Diwan', 'Account', 'P3', 'Mumbai(BOM)', '01/01/19', 'M'),
(4, 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hyderabas(HYD)', '02/05/19', 'F'),
(5, 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi(DEL)', '03/07/19', 'M');

select count(Empid) as no_of_employees, department FROM employeeinfo GROUP BY department ORDER BY no_of_employees;
select count(empid) as no_of_employee, department from employeeinfo GROUP BY Department HAVING COUNT(empid) > 1
select count(empid) as no_of_employee, department from employeeinfo GROUP BY Department HAVING COUNT(empid) < 2

CREATE TABLE employeepostion(
EmpID int,
Empposition varchar(15),
Dateofjoining date,
salary int);
select * from employeepostion;
select * from employeeinfo;

INSERT INTO employeepostion VALUES
(1 ,'Manager', '01/05/2022', 500000),
(2, 'Executive' ,'02/05/2022', 75000),
(3, 'Manager', '01/05/2022', 90000),
(4, 'Lead', '02/05/2022', 85000),
(5, 'Executive', '01/05/2022', 300000);
Select empposition, SUM(salary) salary_sum FROM employeepostion GROUP BY Empposition 
Select empposition, SUM(salary) FROM employeepostion where empposition ='manager' GROUP BY Empposition 
--A5 optional
SELECT empposition, AVG(salary) AS average_salary FROM employeepostion GROUP BY Empposition;
SELECT *, CAST(salary AS varchar(10)) salary_stringtype FROM employeepostion 
SELECT MAX(salary) AS salary1, MIN(salary) as salary2, empposition FROM employeepostion GROUP BY Empposition;
SELECT dateofjoining, CAST(dateofjoining AS VARCHAR(20)) AS new_column FROM employeepostion;
SELECT department, COUNT(EMPid) AS no_of_employee FROM employeeinfo GROUP BY Department HAVING COUNT(EMPID) >= 2;
select count(empid) as no_of_employee, department from employeeinfo GROUP BY Department HAVING COUNT(empid) > 1
select count(empid) as no_of_employee, department from employeeinfo GROUP BY Department HAVING COUNT(empid) < 2
select * from employeepostion;
select * from employeeinfo;
--Q.2 Write a query to retrieve the list of employees working in the same department. (give any department as filter)select count(empid) as no_of_employee, department from employeeinfo GROUP BY Department HAVING COUNT(empid) > 1
Select empposition, SUM(salary) salary_sum FROM employeepostion GROUP BY Empposition 
--Q.3 Write a query to retrieve Departments which have less than 2 employees working in it.select count(empid) as no_of_employee, department from employeeinfo GROUP BY Department HAVING COUNT(empid) < 2
--Q.4 Write a query to retrieve EmpPostion along with total salaries paid for each of them.Select empposition, SUM(salary) salary_sum FROM employeepostion GROUP BY Empposition --Q.5. Write a query to find the sum of salaries of employees with position “Manager”.Select empposition, SUM(salary) FROM employeepostion where empposition ='manager' GROUP BY Empposition--Q.6. Write a query to find the gender count of the employees.select count(empid) as gender_count, gender from employeeinfo GROUP BY gender;--OPTIONAL--Q1 From EmployeePosition table print average salaries Position wiseSELECT empposition, AVG(salary) AS average_salary FROM employeepostion GROUP BY Empposition;--2. Write a Query (WAQ) to get the Male to Female Ratio of employees.--3. Print all data from the employeeposition table with Salary casted as string datatype. Predict what error 
--you will get if you execute query of question 1 with salary casted as stringSELECT *, CAST(salary AS varchar(10)) salary_stringtype FROM employeepostion--4. WAQ to print max and min salary department wise.SELECT MAX(salary) AS salary1, MIN(salary) as salary2, empposition FROM employeepostion GROUP BY Empposition;--5. Use 3 different methods to change datatype of DateofJoining Column to string.Using CAST 
SELECT dateofjoining, CAST(dateofjoining AS VARCHAR(20)) AS new_column FROM employeepostion;
Using CONVERT
SELECT dateofjoining, CAST(VARCHAR(20), dateofjoining) AS new_column FROM employeepostion;
