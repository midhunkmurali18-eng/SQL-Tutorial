USE students;
SHOW tables;

SELECT * FROM marks;
SELECT * FROM students;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mechanical'),
(3, 'Electrical'),
(4, 'Civil');

CREATE TABLE Students_2(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id)
);

INSERT INTO Students_2 VALUES
(101, 'Arun', 1),
(102, 'Rahul', 2),
(103, 'Anu', 1),
(104, 'Meera', 3),
(105, 'Vishnu', NULL);

SELECT * FROM Students_2;
SELECT * FROM departments;

-- INNER JOIN 
-- Return all matching joins from both tables
-- Vishnu is not returned as department id is Null
-- Civil Department is also not showed because is is not assigned to any students
SELECT students_2.student_name,departments.department_name 
FROM students_2 INNER JOIN departments
ON students_2.department_id=departments.department_id;
-- Using As
SELECT s.student_name,d.department_name
FROM students_2 AS s INNER JOIN departments AS d
ON s.department_id = d.department_id;

-- LEFT JOIN
-- All records from the left table.
-- Matching records from the right table.
-- NULL values when there is no match.
SELECT s.student_name, d.department_name 
FROM students_2 AS s LEFT JOIN departments AS d 
ON s.department_id = d.department_id;

-- RIGHT JOIN
-- All records from the right table.
-- Matching records from the left table.
-- NULL values when there is no match.
SELECT s.student_name, d.department_name 
FROM students_2 AS s RIGHT JOIN departments AS d 
ON s.department_id = d.department_id;

-- FULL OUTER JOIN
-- All matching records.
-- All non-matching records from the left table.
-- All non-matching records from the right table.
SELECT s.student_name, d.department_name 
FROM students_2 AS s LEFT JOIN departments AS d 
ON s.department_id = d.department_id

UNION

SELECT s.student_name, d.department_name 
FROM students_2 AS s RIGHT JOIN departments AS d 
ON s.department_id = d.department_id;

-- CROSS JOINS
-- CROSS JOIN produces the Cartesian product of two tables.
-- Every row from the first table is combined with every row from the second table.
-- For example:
-- Suppose Table A contains 3 rows and Table B contains 4 rows.
-- Total combinations:
-- 3 X 4 = 12
-- Practical use cases:
-- - Generating combinations.
-- - Creating product-size combinations.
-- - Generating dates and categories.
SELECT * FROM students_2 CROSS JOIN departments;

-- 	SELF JOINS
-- A SELF JOIN is when a table is joined with itself.
SELECT * FROM students_2;
ALTER TABLE students_2 ADD COLUMN rep_id INT;
UPDATE students_2 SET rep_id=CASE
WHEN student_id=101 THEN 102
WHEN student_id=102 THEN 103
WHEN student_id=103 THEN 104
WHEN student_id=104 THEN 105
END
WHERE student_id IN (101,102,103,104,105);
-- Here Rep_id refers to another Students student_id
-- Display Students and their Rep names Using Self Join
SELECT S.student_name AS student_name, R.student_name as rep_name
FROM students_2 S LEFT JOIN students_2 R 
ON s.student_id=r.rep_id;

-- You Can Also Use Joins with Where, Group By and Having