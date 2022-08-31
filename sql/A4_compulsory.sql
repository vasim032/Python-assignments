Create database assignment;
use assignment;
select * from [dbo].[Worker];

--Question 3 (A)
select department from [dbo].[Worker];

--question 3 (B)
select * from [dbo].[Worker] order by first_name;

--question 3 (C)
select * from [dbo].[Worker] WHERE department = 'Admin';

--question 3 (D)
select * from [dbo].[Worker] WHERE salary between 100000 and 500000;

--question 3 (E)
select * from [dbo].[Worker] WHERE joining_date between '2014-02-01' and '2014-02-28';
select * from [dbo].[Worker];
--question 3 (F)
select count(worker_id) as no_of_workers from [dbo].[Worker] group by DEPARTMENT order by no_of_workers desc;

--question 3 (G)
select top 10 * from [dbo].[Worker];
select * from [dbo].[Worker];
