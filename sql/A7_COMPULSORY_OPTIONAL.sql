--A7 COMPULSORY
USE assignment;
SELECT * FROM students;
--1. a. Students who passed SQL or Excel but failed Python
(SELECT student_name
FROM students
WHERE 
sql_pass_fail = 'pass' 
UNION 
SELECT student_name
FROM students
WHERE 
excel_pass_fail = 'pass')
INTERSECT
SELECT student_name
FROM students
WHERE 
python_pass_fail = 'fail'

--b. Students who passed Python or Excel but failed SQL
(SELECT student_name
FROM students
WHERE 
python_pass_fail = 'pass' 
UNION 
SELECT student_name
FROM students
WHERE 
excel_pass_fail = 'pass')
INTERSECT
SELECT student_name
FROM students
WHERE 
SQL_pass_fail = 'fail';

--c. Students who passed SQL or Python but failed Excel
(SELECT student_name
FROM students
WHERE 
SQL_pass_fail = 'pass' 
UNION 
SELECT student_name
FROM students
WHERE 
python_pass_fail = 'pass')
INTERSECT
SELECT student_name
FROM students
WHERE 
excel_pass_fail = 'fail';

--d. Students who failed SQL or Excel but passed Python
(SELECT student_name
FROM students
WHERE 
SQL_pass_fail = 'fail' 
UNION 
SELECT student_name
FROM students
WHERE 
excel_pass_fail = 'fail')
INTERSECT
SELECT student_name
FROM students
WHERE 
python_pass_fail = 'pass';

--e. Students who failed Python or Excel but passed SQL
(SELECT student_name
FROM students
WHERE 
python_pass_fail = 'fail' 
UNION 
SELECT student_name
FROM students
WHERE 
excel_pass_fail = 'fail')
INTERSECT
SELECT student_name
FROM students
WHERE 
SQL_pass_fail = 'pass';

--f. Students who failed SQL or Python but passed Excel
(SELECT student_name
FROM students
WHERE 
SQL_pass_fail = 'fail' 
UNION 
SELECT student_name
FROM students
WHERE 
python_pass_fail = 'fail')
INTERSECT
SELECT student_name
FROM students
WHERE 
excel_pass_fail = 'pass';

--2. Write a query to add a grade column in a given table. Allot grade to each student according to their score given in the table.
--Grades : A+, A, A-, B+, B, B-, C+, C-, C, D+, D, F   Score >=93 A+ AND Score < 60 F
CREATE TABLE Marks
(ID int,
Name varchar(10),
Score int);
INSERT INTO Marks 
VALUES
(1, 'Shimosala', 60),
(2, 'Ivan', 80),
(3, 'Metodija', 52),
(4, 'Callum', 98),
(5, 'Leila', 84),
(6, 'Aparecida', 82),
(7, 'Ursula', 69),
(8, 'Ramazan', 78),
(9, 'Corona', 87),
(10, 'Alise', 57),
(11, 'Galadriel', 89),
(12, 'Merel', 99),
(13, 'Cherice', 55),
(14, 'Nithya', 81),
(15, 'elsad', 71),
(16, 'Liisi', 90),
(17, 'Johanna', 90),
(18, 'Anfisa', 90),
(19, 'Ryosuke', 97),
(20, 'Salchai', 61),
(21, 'elbert', 63),
(22, 'Katelyn', 51);
SELECT * FROM Marks;
SELECT *, CASE 
WHEN score >=93 THEN 'A+'
WHEN score >90 THEN 'A'
WHEN score >88 THEN 'A-'
WHEN score >85 THEN 'B+'
WHEN score >83 THEN 'B'
WHEN score >80 THEN 'B-'
WHEN score >78 THEN 'C+'
WHEN score >75 THEN 'C'
WHEN score >72 THEN 'C-'
WHEN score >70 THEN 'D+'
WHEN score >65 THEN 'D'
WHEN score >=60 THEN 'D-'
ELSE 'F'
END AS Grade
FROM Marks
SELECT * FROM Marks
--2.a Create a table from Marks table, containing the number of students who passed and failed according to their score.
SELECT  --create table
CASE 
WHEN Score >=60 THEN 'pass'
WHEN score <60 THEN 'fail'
END  AS RESULTS,
COUNT(id) AS  NUMBER_OF_STUDENTS
FROM Marks
GROUP BY CASE 
WHEN Score >=60 THEN 'pass'
WHEN score <60 THEN 'fail'
END

--2.b create a table from marks, which have the following columns
SELECT CASE 
WHEN score >=93 THEN 'A+'
WHEN score >90 THEN 'A'
WHEN score >88 THEN 'A-'
WHEN score >85 THEN 'B+'
WHEN score >83 THEN 'B'
WHEN score >80 THEN 'B-'
WHEN score >78 THEN 'C+'
WHEN score >75 THEN 'C'
WHEN score >72 THEN 'C-'
WHEN score >70 THEN 'D+'
WHEN score >65 THEN 'D'
WHEN score >=60 THEN 'D-'
ELSE 'F'
END AS GRADE, COUNT(ID) AS NUMBER_OF_STUDENTS
FROM Marks
GROUP BY CASE 
WHEN score >=93 THEN 'A+'
WHEN score >90 THEN 'A'
WHEN score >88 THEN 'A-'
WHEN score >85 THEN 'B+'
WHEN score >83 THEN 'B'
WHEN score >80 THEN 'B-'
WHEN score >78 THEN 'C+'
WHEN score >75 THEN 'C'
WHEN score >72 THEN 'C-'
WHEN score >70 THEN 'D+'
WHEN score >65 THEN 'D'
WHEN score >=60 THEN 'D-'
ELSE 'F'
END;
SELECT * FROM [Students ];

--3. WAQ for the following
--a. Students whose names start with A and who joined in march
SELECT * 
FROM [Students ]
WHERE Student_Name like 'A%' AND DATEPART(MONTH,joining_date) = 03;

--b. Students having C in their name and at least 7 characters in their name.
SELECT * 
FROM [Students ]
WHERE  LEN(Student_Name) >= 7 AND Student_Name like '%c%';

--c. In which month the maximum number of students registered
SELECT TOP 1 DATEPART(MONTH,Joining_Date) AS JOINING_MONTH, COUNT(student_name) NUMBER_OF_STUDENTS
FROM [Students ]
GROUP BY DATEPART(MONTH,Joining_Date)
ORDER BY COUNT(student_name) DESC ;

--d. Student with minimum duration(days, and months) in EXCEL, SQL and python.
SELECT TOP 1 student_name, DATEDIFF(DAY,Joining_Date,Leaving_Date) AS DAYS_DURATION, DATEDIFF(MONTH,Joining_Date,Leaving_Date) AS MONTHS_DURATION
FROM [Students ]
ORDER BY  DATEDIFF(DAY,Joining_Date,Leaving_Date), DATEDIFF(MONTH,Joining_Date,Leaving_Date)

--e. Section wise average duration (days and months) of students in course.
SELECT section, AVG(DATEDIFF(month,joining_date,leaving_date)) AS MONTH_DIFF, AVG(DATEDIFF(DAY,joining_date,leaving_date)) AS DAY_DIFF
FROM [Students ]
GROUP BY section;
