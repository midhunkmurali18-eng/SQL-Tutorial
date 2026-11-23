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
-- JUNCTION TABLE
CREATE TABLE instructor_courses ( 
	instruct_id INT,
    course_id INT,
	FOREIGN KEY ( instruct_id ) REFERENCES instructors(instruct_id) ON DELETE CASCADE,
    FOREIGN KEY ( course_id ) REFERENCES courses(course_id) ON DELETE CASCADE
    );
    
INSERT INTO instructor_courses(instruct_id,course_id) 
VALUES (1,1),
		(1,2),
        (1,5),
        (2,3),
        (2,6),
        (3,7),
        (3,8),
        (4,3),
        (4,1),
        (4,9),
        (5,10),
        (6,5);
        
SELECT * FROM instructor_courses;
-- Courses taught by instructor Suresh Kumar :
SELECT i.instruct_name, c.course_name, course_code FROM 
	instructors i INNER JOIN instructor_courses ic ON i.instruct_id = ic.instruct_id 
    INNER JOIN courses c ON ic.course_id = c.course_id 
    WHERE instruct_name = 'Suresh Kumar';
    
-- Show all students enrolled in a specific course
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM departments;

-- Students enrolled in Python Programming
SELECT s.student_name, d.department_name, c.course_name FROM 
	students s INNER JOIN departments d ON s.department_id = d.department_id
    INNER JOIN courses c ON d.department_id = c.department_id
    WHERE course_name = 'Python Programming';
    
