SELECT * FROM employee;
SELECT * FROM employee
WHERE salary > 60000;
SELECT * FROM employee
WHERE location = 'New York';
SELECT * FROM employee_project
WHERE location = 'New York' AND project_name = 'Project Alpha';
SELECT * FROM employee
WHERE salary BETWEEN 50000 AND 70000;
SELECT employee_id, COUNT(project_id) AS project_count
FROM employee_project
GROUP BY employee_id
HAVING project_count > 1;
