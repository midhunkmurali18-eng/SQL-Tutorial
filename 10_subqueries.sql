USE company_db;

SELECT * FROM employees;
SELECT * FROM departments;

-- 1. Scalar subquery or single row subquery
-- A scalar subquery returns exactly one row and one column.

-- It is commonly used with comparison operators:
-- =, >, <, >=, <=, !=

-- Example 1: Find employees earning more than the average salary.
SELECT employee_name,salary FROM employees 
WHERE 
salary > (SELECT AVG(salary) FROM employees);

-- Example 2: Find the employee earning the highest salary.
SELECT employee_name,salary FROM employees
WHERE
salary = (SELECT MAX(salary) FROM employees);

-- Example 3: Find employees earning more than Arun.
SELECT employee_name,salary FROM employees
WHERE
salary > ( SELECT salary FROM employees WHERE employee_name='Arun');


-- 2. Multiple-row subqueries
-- A multiple-row subquery returns multiple values.

-- You generally use these operators:
-- - IN
-- - NOT IN
-- - ANY
-- - ALL

-- Example: Find employees working in IT or HR.
SELECT employee_name,department_id FROM employees 
WHERE department_id IN ( 
SELECT department_id FROM departments WHERE department_name IN ('IT','HR')
);

-- Example: Find departments without employees.
SELECT department_name,department_id FROM departments
WHERE department_id NOT IN (
SELECT department_id FROM employees WHERE department_id IS NOT NULL
);

-- ANY operator
-- ANY means the condition must be true for at least one value returned by the subquery.

-- Example: Find employees earning more than at least one employee in HR.
SELECT employee_name,salary FROM employees 
WHERE salary > ANY (
SELECT salary FROM employees WHERE department_id=2
);

-- ALL operator
-- ALL means the condition must be true for every value returned by the subquery.

-- Example: Find employees earning more than every employee in HR.
SELECT employee_name,salary FROM employees 
WHERE salary > ALL (
SELECT salary FROM employees WHERE department_id=2
);


-- 3. Correlated subquery
-- A correlated subquery is a subquery that depends on the outer query.
-- Unlike a non-correlated subquery, it cannot execute independently because it references a column from the outer query.

-- Example: Find employees earning more than their department's average salary.
SELECT e.employee_name, e.salary, e.department_id FROM employees e
WHERE e.salary > ( 
SELECT AVG(e2.salary) FROM employees e2 WHERE e.department_id = e2.department_id
);

-- Example: Find the highest-paid employee in each department.
SELECT e.employee_name, e.salary, e.department_id FROM employees e
WHERE e.salary = (
SELECT MAX(e2.salary) FROM employees e2 WHERE e.department_id=e2.department_id
);

