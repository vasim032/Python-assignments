
CREATE TABLE emp1 
(Name varchar(10),
year int,
sales int);
INSERT INTO emp1 VALUES
('Pankaj', 2010, 72500),
('Rahul', 2010, 60500),
('Sandeep', 2010, 52000),
('Pankaj', 2011, 45000),
('Sandeep', 2011, 82500),
('Rahul', 2011, 35600),
('Pankaj', 2012, 32500),
('Pankaj', 2010, 20500),
('Rahul', 2011, 200500),
('Sandeep', 2010, 32000);
select * from emp1;
--Q. 1 .a.
SELECT year, Pankaj, Rahul, Sandeep
FROM emp1),),
(
PIVOT(SUM(sales) FOR Name IN (Pankaj, Rahul, Sandeep)) AS pivot_new

--b
SELECT name, [2010], [2011], [2012]
FROM emp1
PIVOT(SUM(sales) FOR year IN ([2010], [2011], [2012])) AS pivot_new

CREATE TABLE table_new 
(Student varchar(10),
Subject varchar(15),
Marks int);
INSERT INTO table_new VALUES
('Jacob', 'Mathematics', 100),
('Jacob', 'Science', 95),
('Jacob', 'Geography', 90),
('Amilee', 'Mathematics', 90),
('Amilee', 'Science', 95),
('Amilee', 'Geography', 100);
SELECT * FROM table_new;
SELECT student, Mathematics, Science, Geography
FROM table_new
PIVOT(AVG(marks) FOR subject IN (Mathematics, Science, Geography)) AS pivot_table_new
ORDER BY Student DESC;

CREATE TABLE tab_result
(Team1 varchar(1),
Team2 varchar(2),
Result varchar(1))
INSERT INTO tab_result VALUES
('A', 'B', 'A'),
('A', 'C','C'),
('B', 'D', 'D'),
('A', 'D','A');
SELECT * FROM tab_result;

SELECT * 
FROM tab_result
PIVOT(COUNT(DISTINCT result) FOR 