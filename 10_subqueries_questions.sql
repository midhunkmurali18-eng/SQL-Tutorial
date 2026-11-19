USE company_db;

SELECT * FROM departments;
SELECT * FROM employees;

-- Find employees whose salary is less than the lowest salary in the IT department.
SELECT employee_name,salary FROM employees
WHERE salary < (
SELECT MIN(salary) FROM employees WHERE department_id=1
);

-- Find employees who joined after the earliest hired employee.
SELECT employee_name,hire_date FROM employees
WHERE hire_date > (
SELECT MIN(hire_date) FROM employees
); 

-- Find employees working in departments located in Bangalore or Chennai.
SELECT employee_name, job_role FROM employees
WHERE department_id IN (
SELECT department_id FROM departments WHERE location IN ('Bangalore','Chennai')
);

-- Find employees who do not belong to the IT or HR departments.
SELECT employee_name, department_id FROM employees
WHERE department_id NOT IN (
SELECT department_id FROM departments WHERE department_name IN ('IT','HR')
);

-- Find employees earning more than at least one employee in the HR department.
SELECT employee_name, department_id FROM employees
WHERE salary > ANY (
SELECT salary FROM employees WHERE department_id = 2
);

-- Find employees earning more than every employee in the HR department.
SELECT employee_name, department_id FROM employees
WHERE salary > ALL (
SELECT salary FROM employees WHERE department_id = 2
);

-- Find departments that do not have employees.
SELECT department_id, department_name FROM departments
WHERE department_id NOT IN (
SELECT department_id FROM employees WHERE department_id IS NOT NULL
);

-- Find employees who belong to departments with a budget greater than ₹30,00,000.
SELECT employee_name, job_role FROM employees
WHERE department_id IN (
SELECT department_id FROM departments WHERE budget >= 3000000
);

-- Find employees whose salary matches the salary of at least one employee in another department.
SELECT employee_name, salary FROM employees e
WHERE salary = ANY (
SELECT salary FROM employees WHERE department_id <> e.department_id
);

-- Find employees earning more than their department's average salary.
SELECT e.employee_name, e.salary FROM employees e
WHERE e.salary > (
SELECT AVG(e2.salary) FROM employees e2 WHERE e.department_id = e2.department_id
);

-- Find the highest-paid employee in each department.
SELECT e.employee_name, e.department_id FROM employees e
WHERE e.salary = (
SELECT MAX(e2.salary) FROM employees e2 WHERE e.department_id = e2.department_id
) ORDER BY department_id ASC;

-- Find employees earning more than their managers.
SELECT e.employee_name, e.salary, e.manager_id FROM employees e 
WHERE e.salary > (
SELECT m.salary FROM employees m WHERE m.employee_id = e.manager_id
);

-- Find departments having more than two employees.
SELECT d.department_name, d.location, 
(SELECT COUNT(*) FROM employees e WHERE e.department_id=d.department_id) AS employee_count
FROM departments d 
WHERE (
SELECT COUNT(*) FROM employees e WHERE e.department_id=d.department_id
) >2 ;