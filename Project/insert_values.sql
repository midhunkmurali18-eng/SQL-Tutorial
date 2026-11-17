USE universityDB;

INSERT INTO departments
(department_id, department_name, department_code, department_building, department_phone)
VALUES
(1, 'Computer Science', 'CSE', 'Block A', '0471234567'),
(2, 'Mechanical Engineering', 'ME', 'Block B', '0471234568'),
(3, 'Electronics Engineering', 'ECE', 'Block C', '0471234569'),
(4, 'Civil Engineering', 'CE', 'Block D', '0471234570'),
(5, 'Electrical Engineering', 'EEE', 'Block E', '0471234571');

INSERT INTO students
(student_id, student_name, student_email, student_phone,
student_dob, student_gender, department_id, student_address, admission_date)
VALUES
(1, 'Arun Kumar', 'arun@gmail.com', '9876500001', '2003-05-12', 'Male', 1, 'Kochi', '2021-08-01'),
(2, 'Meera Nair', 'meera@gmail.com', '9876500002', '2002-11-20', 'Female', 1, 'Trivandrum', '2021-08-01'),
(3, 'Rahul Das', 'rahul@gmail.com', '9876500003', '2003-02-15', 'Male', 2, 'Kollam', '2021-08-05'),
(4, 'Anjali Menon', 'anjali@gmail.com', '9876500004', '2002-07-25', 'Female', 3, 'Calicut', '2021-08-05'),
(5, 'Vishnu Raj', 'vishnu@gmail.com', '9876500005', '2003-09-10', 'Male', 4, 'Alappuzha', '2022-08-01'),
(6, 'Sneha Thomas', 'sneha@gmail.com', '9876500006', '2002-04-18', 'Female', 5, 'Kottayam', '2022-08-01'),
(7, 'Adithya S', 'adithya@gmail.com', '9876500007', '2003-12-05', 'Other', 1, 'Kannur', '2022-08-05'),
(8, 'Nikhil Mohan', 'nikhil@gmail.com', '9876500008', '2002-06-30', 'Male', 2, 'Palakkad', '2022-08-05'),
(9, 'Devika R', 'devika@gmail.com', '9876500009', '2003-03-22', 'Female', 3, 'Thrissur', '2023-08-01'),
(10, 'Akhil Babu', 'akhil@gmail.com', '9876500010', '2002-10-14', 'Male', 4, 'Pathanamthitta', '2023-08-01');

INSERT INTO courses
(course_id, course_name, course_code, course_credits, semester, department_id)
VALUES
(1, 'Python Programming', 'CSE101', 4, 1, 1),
(2, 'Database Management Systems', 'CSE201', 4, 3, 1),
(3, 'Machine Learning', 'CSE301', 3, 5, 1),
(4, 'Data Structures', 'CSE202', 4, 3, 1),
(5, 'Thermodynamics', 'ME101', 4, 1, 2),
(6, 'Digital Electronics', 'ECE201', 3, 3, 3),
(7, 'Structural Engineering', 'CE301', 4, 5, 4),
(8, 'Power Systems', 'EEE301', 4, 5, 5),
(9, 'Computer Networks', 'CSE401', 3, 7, 1),
(10, 'Artificial Intelligence', 'CSE402', 4, 7, 1);

INSERT INTO instructors
(instruct_id, instruct_name, instruct_email, instruct_phone,
instruct_gender, instruct_salary, department_id, hire_date)
VALUES
(1, 'Suresh Kumar', 'suresh@university.com', '9123400001', 'Male', 55000, 1, '2018-06-10'),
(2, 'Priya Menon', 'priya@university.com', '9123400002', 'Female', 60000, 1, '2019-07-15'),
(3, 'Rajesh Nair', 'rajesh@university.com', '9123400003', 'Male', 50000, 2, '2020-01-20'),
(4, 'Lakshmi Devi', 'lakshmi@university.com', '9123400004', 'Female', 58000, 3, '2017-09-12'),
(5, 'Manoj Thomas', 'manoj@university.com', '9123400005', 'Male', 52000, 4, '2021-03-18'),
(6, 'Anitha Paul', 'anitha@university.com', '9123400006', 'Female', 62000, 5, '2016-11-25'),
(7, 'Deepak Raj', 'deepak@university.com', '9123400007', 'Male', 57000, 1, '2022-02-14'),
(8, 'Reshma S', 'reshma@university.com', '9123400008', 'Female', 54000, 2, '2020-08-05');

INSERT INTO enrollments
(enroll_id, student_id, course_id, enroll_date, enroll_status)
VALUES
(1, 1, 1, '2021-09-01', 'Completed'),
(2, 1, 2, '2022-01-10', 'Completed'),
(3, 1, 3, '2023-01-10', 'Enrolled'),
(4, 2, 1, '2021-09-01', 'Completed'),
(5, 2, 4, '2022-01-15', 'Completed'),
(6, 2, 3, '2023-01-12', 'Enrolled'),
(7, 3, 5, '2021-09-05', 'Completed'),
(8, 3, 6, '2022-01-15', 'Dropped'),
(9, 4, 6, '2021-09-10', 'Completed'),
(10, 4, 2, '2022-01-20', 'Enrolled'),
(11, 5, 7, '2022-09-01', 'Completed'),
(12, 5, 8, '2023-01-15', 'Enrolled'),
(13, 6, 8, '2022-09-05', 'Completed'),
(14, 6, 5, '2023-01-20', 'Enrolled'),
(15, 7, 1, '2022-09-01', 'Completed'),
(16, 7, 9, '2024-01-10', 'Enrolled'),
(17, 8, 5, '2022-09-05', 'Completed'),
(18, 8, 7, '2023-01-15', 'Dropped'),
(19, 9, 6, '2023-09-01', 'Enrolled'),
(20, 10, 7, '2023-09-05', 'Enrolled');

INSERT INTO class_schedule
(schedule_id, class_room, course_id, instruct_id,
day_of_week, start_time, end_time, academic_year)
VALUES
(1, 'Room A101', 1, 1, 'Monday', '09:00:00', '10:00:00', '2024-2025'),
(2, 'Room A102', 2, 2, 'Monday', '10:00:00', '11:00:00', '2024-2025'),
(3, 'Room A103', 3, 7, 'Tuesday', '09:00:00', '10:00:00', '2024-2025'),
(4, 'Room A104', 4, 1, 'Tuesday', '10:00:00', '11:00:00', '2024-2025'),
(5, 'Room B101', 5, 3, 'Wednesday', '09:00:00', '10:00:00', '2024-2025'),
(6, 'Room C101', 6, 4, 'Wednesday', '10:00:00', '11:00:00', '2024-2025'),
(7, 'Room D101', 7, 5, 'Thursday', '09:00:00', '10:00:00', '2024-2025'),
(8, 'Room E101', 8, 6, 'Thursday', '10:00:00', '11:00:00', '2024-2025'),
(9, 'Room A105', 9, 2, 'Friday', '09:00:00', '10:00:00', '2024-2025'),
(10, 'Room A106', 10, 7, 'Friday', '10:00:00', '11:00:00', '2024-2025');

SELECT * FROM departments;

SELECT * FROM students;

SELECT * FROM courses;

SELECT * FROM instructors;

SELECT * FROM enrollments;

SELECT * FROM class_schedule;