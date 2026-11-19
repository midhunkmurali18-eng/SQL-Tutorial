USE company_db;

set autocommit=0;

SELECT
department_name,
CASE department_name
    WHEN 'IT' THEN 'Technology Team'
    WHEN 'HR' THEN 'Human Resources'
    WHEN 'Sales' THEN 'Sales Team'
    WHEN 'Finance' THEN 'Accounts Team'
    ELSE 'Other Department'
END AS Team_Name
FROM departments;

SELECT employee_name, salary, 
CASE department_id 
	WHEN 1 THEN 'IT'
    WHEN 2 THEN 'HR'
    WHEN 3 THEN 'Finance'
    WHEN 4 THEN 'Marketing'
    WHEN 5 THEN 'Sales'
    WHEN 6 THEN 'Reasearch'
    ELSE 'Other Department'
END AS department_name
FROM employees;

SELECT salary FROM employees ORDER BY salary;

SELECT employee_name, salary, 
CASE 
	WHEN salary < 50000 THEN 'Low Salary'
	WHEN salary BETWEEN 50000 AND 75000 THEN 'Mid Salary'
    WHEN salary BETWEEN 75000 AND 100000 THEN 'Hign Salary'
    ELSE 'Unknown Category'
    END AS salary_category
FROM employees;

-- Display employee name and employment category based on hire date
SELECT employee_name, 
CASE
	WHEN YEAR(hire_date) < 2019 THEN 'Experienced'
    WHEN YEAR(hire_date) BETWEEN 2019 AND 2021 THEN 'Intermediate'
    WHEN YEAR(hire_date) > 2021 THEN 'Fresher'
    END AS 'experience_category'
FROM employees;

-- Display employee name and a salary increment category
SELECT employee_name, salary, 
CASE
	WHEN salary < 50000 THEN salary+salary*0.10
    WHEN salary BETWEEN 50000 AND 80000 THEN salary+salary*0.5
    WHEN salary > 80000 THEN salary+salary*0.2
    END AS 'Incremented Salary'
FROM employees;

