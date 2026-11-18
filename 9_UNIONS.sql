USE joinpracticedb;
SHOW tables;

-- UNION
-- This returns a single list of unique names from both tables.
-- Removes Duplicates
SELECT name FROM students 
UNION
SELECT course_name FROM courses;


-- UNION ALL
-- KEEPS DUPLICATED
SELECT name FROM students 
UNION ALL
SELECT course_name FROM courses;