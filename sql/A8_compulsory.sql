--4. Import Projects.csv and link it to worker.csv data sets to find the following (Use Joins in each of the following): Projects.csv Worker.csv
--4. 1. Get Worker name, project name order by first name from "Worker" and "Projects" for those
--worker which have been assigned project already
USE assignment;
SELECT * FROM [dbo].[Projects];
SELECT * FROM [dbo].[Worker (1)];
SELECT [dbo].[Worker (1)].FIRST_NAME, [dbo].[Projects].Project_Name
FROM [dbo].[Projects]
INNER JOIN [dbo].[Worker (1)]
ON [dbo].[Projects].Worker_ID = [dbo].[Worker (1)].WORKER_ID
ORDER BY [dbo].[Worker (1)].FIRST_NAME

--4. 2. Get employee name, project name order by first name from "Worker" and "Projects" 
--for all worker even if they have not been assigned a project
SELECT [dbo].[Worker (1)].FIRST_NAME, [dbo].[Worker (1)].LAST_NAME, [dbo].[Projects].Project_Name
FROM [dbo].[Projects]
RIGHT JOIN [dbo].[Worker (1)]
ON [dbo].[Projects].Worker_ID = [dbo].[Worker (1)].WORKER_ID
ORDER BY [dbo].[Worker (1)].FIRST_NAME

--4. 3. Write down the query to fetch Worker & Project who have been assigned more than one project.
SELECT WORKER_ID, COUNT(PROJECT_ID) AS NUM_PROJECTS
FROM Projects 
GROUP BY Worker_ID
HAVING COUNT(PROJECT_ID) > 1;

--4. 4. Get complete record(employee name, project name) from both tables([Worker],
--[Project]), if no match is found in any table then show NULL.
SELECT *
FROM [dbo].[Worker (1)]
FULL OUTER JOIN [dbo].[Projects]
ON  [dbo].[Worker (1)].WORKER_ID = [dbo].[Projects].Worker_ID;

--4. 5. Get all project name even they have not matching any Worker ID, in left table, order
--by firstname from " Worker " and " Projects "
SELECT *
FROM [dbo].[Worker (1)] AS a
RIGHT JOIN [dbo].[Projects] AS b
ON a.WORKER_ID = b.Worker_ID
WHERE B.Project_ID IS NOT NULL
ORDER BY a.FIRST_NAME;

--5.Write an SQL query to report all customers who never order anything.
