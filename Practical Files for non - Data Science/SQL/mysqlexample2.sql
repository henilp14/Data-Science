INSERT INTO employee (name, salary, location, date_of_joining) VALUES
('Alice', 50000, 'New York', '2022-01-15'),
('Bob', 60000, 'San Francisco', '2021-09-05'),
('Charlie', 70000, 'Chicago', '2020-11-20');
SELECT * FROM employee
WHERE salary IS NULL;
SELECT * FROM employee
WHERE salary IS NOT NULL;
UPDATE employee
SET salary = 75000
WHERE employee_id = 1;
SELECT * FROM employee 
LIMIT 5;
SELECT * FROM employee 
LIMIT 5 OFFSET 5;
SELECT MIN(salary) AS min_salary,
 MAX(salary) AS max_salary,
 AVG(salary) AS avg_salary
 FROM employee;
SELECT SUM(salary) AS total_salary
 FROM employee;
SELECT * FROM employee 
WHERE name LIKE 'A%';
SELECT * FROM employee 
WHERE name LIKE '%Al%';
SELECT * FROM employee
 WHERE employee_id IN (1, 2, 3);
 SELECT e.name, p.project_name 
 FROM employee e 
 INNER JOIN employee_project p 
 ON e.employee_id = p.employee_id;
SELECT name FROM employee
WHERE location = 'New York'
UNION
SELECT name FROM employee
WHERE location = 'San Francisco';
SELECT name FROM employee
WHERE location = 'New York'
UNION ALL
SELECT name FROM employee
WHERE location = 'San Francisco';
SELECT location, COUNT(*) AS number_of_employees
FROM employee
GROUP BY location;
SELECT location, AVG(salary) AS avg_salary
FROM employee
GROUP BY location
HAVING AVG(salary) > 60000;
SELECT * FROM employee e
WHERE EXISTS (
    SELECT 1 FROM employee_project p
    WHERE e.employee_id = p.employee_id
);
SELECT * FROM employee
WHERE salary > ANY (
    SELECT salary FROM employee WHERE location = 'San Francisco'
);
SELECT * FROM employee
WHERE salary > ALL (
    SELECT salary FROM employee WHERE location = 'San Francisco'
);
SELECT name,
       CASE
           WHEN salary < 50000 THEN 'Low'
           WHEN salary BETWEEN 50000 AND 80000 THEN 'Medium'
           WHEN salary > 80000 THEN 'High'
       END AS salary_category
FROM employee;
