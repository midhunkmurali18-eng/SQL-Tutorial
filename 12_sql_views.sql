USE company_db;

-- VIEWS

-- A View in MySQL is a virtual table created using the result of a SQL query.
-- It does not normally store the actual data. Instead, it stores the SQL query definition. 
-- Whenever you access the view, MySQL retrieves the data from the underlying tables.
-- Think of a view as a saved SQL query that you can use like a table.

-- CREATE VIEW Syntax : 
-- 			CREATE VIEW view_name AS
-- 			SELECT column1, column2
-- 			FROM table_name
-- 			WHERE condition;

-- Example : 

CREATE VIEW department_details AS
	SELECT e.employee_name, d.department_name, d.department_id FROM
    employees e INNER JOIN departments d 
    ON e.department_id=d.department_id;
    
CREATE VIEW salary_details AS
	SELECT employee_name, salary FROM employees;
    
SELECT * FROM department_details;
SELECT * FROM salary_details;

-- You can also apply conditions to a view:
SELECT * FROM department_details WHERE department_id=1;

-- Updating a View
-- You can modify an existing view using CREATE OR REPLACE VIEW.
CREATE OR REPLACE VIEW salary_details AS
	SELECT employee_id,employee_name,salary FROM employees;

-- To see the views available in your current database:
SHOW FULL TABLES WHERE Table_type = 'VIEW';

-- To see the SQL query used to create a particular view:
SHOW CREATE VIEW department_details;

SET AUTOCOMMIT=0;

-- Updating Data Through a View
-- You can sometimes update the original table through a view.
UPDATE department_details SET department_name='Informatin Technology' WHERE department_id=1;
SELECT * FROM department_details;
rollback;

-- Deleting a View
-- Syntax :
-- DROP VIEW view_name;
DROP VIEW salary_details;
SHOW FULL TABLES WHERE Table_type='VIEW';
rollback;