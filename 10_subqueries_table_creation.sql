USE company_db;

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    budget DECIMAL(12,2)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    job_role VARCHAR(100),
    salary DECIMAL(10,2),
    hire_date DATE,
    department_id INT,
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

INSERT INTO departments
(department_name, location, budget)
VALUES
('IT', 'Bangalore', 5000000),
('HR', 'Chennai', 2000000),
('Finance', 'Mumbai', 3000000),
('Marketing', 'Delhi', 2500000),
('Sales', 'Hyderabad', 3500000),
('Research', 'Pune', 4000000);

INSERT INTO employees
(employee_name, job_role, salary, hire_date, department_id, manager_id)
VALUES
('Arun', 'Manager', 90000, '2018-05-10', 1, NULL),
('Priya', 'Developer', 60000, '2020-06-15', 1, 1),
('Rahul', 'Developer', 75000, '2019-03-20', 1, 1),
('Sneha', 'HR Manager', 85000, '2017-08-12', 2, NULL),
('Kiran', 'HR Executive', 45000, '2021-01-10', 2, 4),
('Vishnu', 'Accountant', 70000, '2019-11-05', 3, NULL),
('Anjali', 'Financial Analyst', 55000, '2022-04-18', 3, 6),
('Meera', 'Marketing Manager', 95000, '2016-02-25', 4, NULL),
('Ajay', 'Marketing Executive', 50000, '2021-07-14', 4, 8),
('Deepak', 'Sales Manager', 80000, '2018-09-30', 5, NULL),
('Neha', 'Sales Executive', 40000, '2022-12-01', 5, 10),
('Rohit', 'Sales Executive', 65000, '2020-10-10', 5, 10),
('Manu', 'Data Scientist', 100000, '2019-05-22', 1, 1);

SELECT * FROM departments;
SELECT * FROM employees;