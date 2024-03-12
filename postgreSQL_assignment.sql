-- Active: 1709553243337@@127.0.0.1@5433@company_db@public
CREATE database company_db;
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    department_id INT REFERENCES departments(department_id),
    salary NUMERIC(7, 2),
    status VARCHAR(50)
);
DROP TABLE employees;
ALTER TABLE employees ALTER COLUMN status TYPE VARCHAR(50);
SELECT * from employees;
INSERT INTO departments (department_name) VALUES 
    ('Engineering'),
    ('Marketing'),
    ('Finance');

INSERT INTO employees (employee_name, age, email, department_id, salary, status) VALUES
    ('Alice', 30, 'alice@example.com', 1, 60000, NULL),
    ('Bob', 35, 'bob@example.net', 2, 65000, NULL),
    ('Charlie', 28, 'charlie@google.com', 1, 55000, NULL),
    ('David', 33, 'david@yahoo.com', 2, 62000, NULL),
    ('Eve', 31, 'eve@example.net', 3, 58000, NULL),
    ('Frank', 29, 'frank@example.com', 1, 59000, NULL),
    ('Grace', 34, 'grace@google.com', 2, 63000, NULL),
    ('Henry', 32, 'henry@yahoo.com', 3, 57000, NULL),
    ('Ivy', 27, 'ivy@gmail.com', 1, 56000, NULL),
    ('Jack', 36, 'jack@example.net', 2, 64000, NULL),
    ('Karen', 29, 'karen@gmail.com', 3, 60000, NULL),
    ('Liam', 33, 'liam@gmail.com', 1, 59000, NULL),
    ('Mia', 31, 'mia@yahoo.com', 2, 62000, NULL),
    ('Nora', 28, 'nora@yahoo.com', 3, 57000, NULL),
    ('Oliver', 35, 'oliver@example.net', 1, 61000, NULL),
    ('Penelope', 30, 'penelope@google.com', 2, 63000, NULL),
    ('Quinn', 32, 'quinn@google.com', 3, 59000, NULL),
    ('Rachel', 27, 'rachel@gmail.com', 1, 55000, NULL),
    ('Sam', 34, 'sam@example.net', 2, 64000, NULL),
    ('Taylor', 31, 'taylor@yahoo.com', 3, 58000, NULL);
SELECT * from departments;
SELECT * from employees;

-- Query 1

SELECT * from employees WHERE salary>60000;

-- Query 2
SELECT employee_name from employees LIMIT 2 OFFSET 2;

-- Query 3
SELECT avg(age) as average_age from employees;

-- Query 4
SELECT employee_name from employees  WHERE email ILIKE '%example.com' OR email ILIKE '%example.net'
 OR email ILIKE '%google.com';

-- Query 5
SELECT employee_name from employees JOIN departments on employees.department_id = departments.department_id
WHERE departments.department_name = 'Engineering';

-- Query 6
UPDATE employees set status = 'Promoted' WHERE salary = (SELECT max(salary) from employees);

-- Query 7
SELECT  department_name,avg(salary) from employees JOIN departments on employees.department_id = departments.department_id GROUP BY department_name;
