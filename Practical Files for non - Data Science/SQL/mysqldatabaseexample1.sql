USE corporate;
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    location VARCHAR(100),
    date_of_joining DATE
);
CREATE TABLE employee_department AS 
SELECT employee_id, name, salary, location, date_of_joining, NULL AS department 
FROM employee;

DROP TABLE employee;

ALTER TABLE employee_department 
ADD COLUMN phone_number VARCHAR(15);

ALTER TABLE employee_department 
ADD CONSTRAINT salary_positive
CHECK (salary > 0);

ALTER TABLE employee_department 
ADD CONSTRAINT unique_phone_number
UNIQUE (phone_number);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

ALTER TABLE employee_department
ADD CONSTRAINT fk_department 
FOREIGN KEY (department) 
REFERENCES departments(department_name);

CREATE VIEW department_employees AS
SELECT employee_id, name, salary, department
FROM employee_department
WHERE department IS NOT NULL;

SELECT * FROM department_employees;

DROP VIEW department_employees;
