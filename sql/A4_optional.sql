use assignment
select * from [dbo].[Worker];
--question 1
select first_name, last_name, department from [dbo].[Worker] order by SALARY desc;

--question 2
select first_name, last_name from [dbo].[Worker] order by JOINING_DATE desc;

--question 3
select distinct department from [dbo].[Worker];

--question 4
select salary from [dbo].[Worker] where SALARY > 10000 and DEPARTMENT = 'HR';

--question 5
select first_name, last_name from [dbo].[Worker] WHERE LAST_NAME like 'A%';

--question 6
select last_name from [dbo].[Worker] WHERE LAST_NAME like '%w%';
