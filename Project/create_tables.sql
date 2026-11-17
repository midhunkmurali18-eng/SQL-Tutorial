CREATE DATABASE universityDB;
USE universityDB;

CREATE TABLE departments (
department_id INT PRIMARY KEY AUTO_INCREMENT,
department_name VARCHAR(100) NOT NULL UNIQUE,
department_code VARCHAR(100) NOT NULL UNIQUE,
department_building VARCHAR(100),
department_phone VARCHAR(100)
);

CREATE TABLE students(
student_id INT PRIMARY KEY AUTO_INCREMENT,
student_name VARCHAR (100) NOT NULL,
student_email VARCHAR(100) NOT NULL UNIQUE,
student_phone VARCHAR(15) UNIQUE,
student_dob DATE NOT NULL,
student_gender ENUM('Male','Female','Other') NOT NULL,
department_id INT,
student_address VARCHAR(100),
admission_date DATE NOT NULL,
CONSTRAINT fk_department FOREIGN KEY ( department_id ) REFERENCES departments(department_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE courses(
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(100) NOT NULL UNIQUE,
course_code VARCHAR(50) NOT NULL UNIQUE,
course_credits INT,
semester INT CHECK(semester BETWEEN 1 AND 8),
department_id INT,
CONSTRAINT fk_department_courses FOREIGN KEY ( department_id ) REFERENCES departments(department_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE instructors(
instruct_id INT PRIMARY KEY AUTO_INCREMENT,
instruct_name VARCHAR(100) NOT NULL,
instruct_email VARCHAR(100) NOT NULL UNIQUE,
instruct_phone VARCHAR(15) NOT NULL UNIQUE,
instruct_gender ENUM('Male','Female','Other') NOT NULL,
instruct_salary INT CHECK(instruct_salary > 0),
department_id INT,
hire_date DATE NOT NULL,
CONSTRAINT fk_instruct_department FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE enrollments(
enroll_id INT PRIMARY KEY AUTO_INCREMENT,
student_id INT,
course_id INT,
enroll_date DATE NOT NULL,
enroll_status ENUM('Enrolled','Dropped','Completed') DEFAULT 'Enrolled',
CONSTRAINT fk_enroll_students FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_enroll_course FOREIGN KEY ( course_id ) REFERENCES courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE class_schedule(
schedule_id INT PRIMARY KEY AUTO_INCREMENT,
class_room VARCHAR(50) NOT NULL,
course_id INT NOT NULL,
instruct_id INT NOT NULL,
day_of_week ENUM('Monday','Tuesday','Wednesday','Thursday','Friday') NOT NULL,
start_time TIME NOT NULL,
end_time TIME NOT NULL,
CHECK ( end_time > start_time ),
academic_year VARCHAR(50) NOT NULL,
CONSTRAINT fk_course_schedule FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_instructor_schedule FOREIGN KEY (instruct_id) REFERENCES instructors(instruct_id) ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM departments;
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM instructors;
SELECT * FROM enrollments;
SELECT * FROM class_schedule;
