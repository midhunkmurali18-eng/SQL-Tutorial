USE universityDB;

SELECT * FROM students;

SET sql_safe_updates=0;

SET AUTOCOMMIT=0;

-- Update a student’s contact information
UPDATE students SET student_email='vishnu123@gmail.com', student_phone='9897962312' WHERE student_name='Vishnu Raj';
COMMIT;

-- Delete a course 
SELECT * FROM courses;
DELETE FROM courses WHERE course_id = 3; 
ROLLBACK;

-- Enroll a student into a course
DESC enrollments;
INSERT INTO enrollments
(student_id, course_id, enroll_date, enroll_status)
VALUES 
(1,10,'2024-08-12',DEFAULT);
SELECT * FROM enrollments;
COMMIT;

-- Display student details along with department name
SELECT * FROM students;
SELECT * FROM departments;
SELECT students.student_name,departments.department_name FROM departments INNER JOIN students 
ON students.department_id = departments.department_id;

-- List all courses taught by a specific instructor 
SELECT * FROM instructors;
SELECT * FROM courses;
