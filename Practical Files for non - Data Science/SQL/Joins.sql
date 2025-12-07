-- INNER JOIN
SELECT clients.project_name,clients.client_name,employee_project.project_completion
FROM clients
INNER JOIN employee_project
ON clients.project_name = employee_project.project_name;


-- LEFT JOIN 
SELECT clients.project_name,clients.client_name,employee_project.project_completion
FROM clients
LEFT JOIN employee_project
ON clients.project_name = employee_project.project_name;

-- RIGHT JOIN
SELECT clients.project_name,clients.client_name,employee_project.project_completion
FROM clients
RIGHT JOIN employee_project
ON clients.project_name = employee_project.project_name;

-- CROSS JOIN
SELECT clients.project_name,clients.client_name,employee_project.project_completion
FROM clients
CROSS JOIN employee_project
ON clients.project_name = employee_project.project_name;

-- SELF JOIN 
SELECT c.project_name AS Employees,p.project_name AS Projects
FROM clients c
INNER JOIN employee_project p
ON c.project_name = p.project_name;
