USE universitydb;

-- Count number of students in each department
SELECT d.department_name, COUNT(s.student_id) AS no_of_students FROM 
	students s INNER JOIN departments d ON s.department_id=d.department_id 
    GROUP BY d.department_id;
    
-- List instructors with the number of courses they teach
SELECT i.instruct_name, COUNT(ic.course_id) AS no_of_courses FROM 
	instructors i INNER JOIN instructor_courses ic ON i.instruct_id = ic.instruct_id
    INNER JOIN courses c ON ic.course_id = c.course_id
    GROUP BY ic.instruct_id;
    
-- Find the department with the most students
SELECT d.department_name, COUNT(s.student_id) AS no_of_students FROM 
	students s INNER JOIN departments d ON s.department_id = d.department_id
    GROUP BY d.department_name ORDER BY no_of_students DESC LIMIT 1;
    
