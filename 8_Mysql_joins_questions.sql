CREATE DATABASE JoinPracticeDB;
USE JoinPracticeDB;

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    course_id INT,
	CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

INSERT INTO Courses (course_id, course_name)
VALUES
(101, 'Python'),
(102, 'SQL'),
(103, 'Java'),
(105, 'Power BI'),
(106, 'Data Science');

INSERT INTO Students (student_id, name, course_id)
VALUES
(1, 'Rahul', 101),
(2, 'Priya', 102),
(3, 'Arun', 103),
(4, 'Meera', 105),
(5, 'John', NULL);

-- Display student names along with their course names.
-- INNER JOIN
SELECT Students.name,Courses.course_name FROM students INNER JOIN courses
ON students.course_id=courses.course_id;

-- Find the number of students enrolled in each course.
SELECT c.course_name,COUNT(s.student_id) AS total_students
FROM Students s
INNER JOIN courses c
	ON s.course_id=c.course_id
GROUP BY c.course_name;

-- Display all students along with their course names, including students without a course.
SELECT s.name,c.course_name
FROM students s
LEFT JOIN courses c 
ON s.course_id=c.course_id;

-- Find students who have not enrolled in any course.
SELECT s.name,c.course_name
FROM students s
LEFT JOIN courses c 
ON s.course_id=c.course_id
WHERE course_name IS NULL;

-- Display all courses along with the students enrolled in them.
SELECT c.course_name,s.name
FROM students s
	RIGHT JOIN courses c 
ON s.course_id=c.course_id;

-- Find courses that have no students enrolled.
SELECT c.course_name,s.name
FROM students s
	RIGHT JOIN courses c 
ON s.course_id=c.course_id
WHERE name IS NULL;

-- Display all students and all courses, including unmatched records.
SELECT c.course_name,s.name
FROM students s
	LEFT JOIN courses c 
ON s.course_id=c.course_id
UNION
SELECT c.course_name,s.name
FROM students s
	RIGHT JOIN courses c 
ON s.course_id=c.course_id;

-- Display students without matching courses and courses without matching students.
SELECT c.course_name,s.name
FROM students s
	LEFT JOIN courses c 
ON s.course_id=c.course_id 
WHERE course_name is NULL
UNION
SELECT c.course_name,s.name
FROM students s
	RIGHT JOIN courses c 
ON s.course_id=c.course_id
WHERE name IS NULL;

-- Display students enrolled in either Python or Java.
SELECT s.name,c.course_name 
FROM students s INNER JOIN courses c 
ON s.course_id=c.course_id
WHERE course_name= 'Python' OR course_name='Java';

-- Display students whose course ID is greater than 101.
SELECT s.name,c.course_name 
FROM students s LEFT JOIN courses c 
ON s.course_id=c.course_id
WHERE s.course_id > 101;

-- Find the total number of students in all courses.
SELECT COUNT(s.student_id) as Total_Students_In_All_Courses FROM 
students s INNER JOIN courses c 
ON s.course_id=c.course_id;