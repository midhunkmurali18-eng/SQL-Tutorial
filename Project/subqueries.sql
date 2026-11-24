USE universitydb;

-- Subquery to find students not enrolled in any course 
SELECT s.student_name FROM students s 
	WHERE student_id NOT IN (
    SELECT student_id FROM enrollments
    );
    
-- Find instructors teaching the most courses

SELECT instruct_name
FROM instructors
WHERE instruct_id IN (
    SELECT instruct_id FROM instructor_courses GROUP BY instruct_id HAVING COUNT(course_id) = (
        SELECT MAX(course_count) FROM (
			SELECT COUNT(course_id) AS course_count FROM instructor_courses GROUP BY instruct_id
        ) AS instructor_counts 
	));


