CREATE DATABASE Students ; 
USE Students ;

CREATE TABLE student_details ( 
ID INT PRIMARY KEY,
NAME VARCHAR (50),
AGE INT ) ; 

ALTER TABLE student_details ADD COLUMN email VARCHAR(100) UNIQUE;

RENAME TABLE student_details TO students;

INSERT INTO students ( id , name , age , email ) 
values 
( 104, 'Ajay', 21, 'ajay123@gmail.com'),
(105, 'Alan', 23, 'alan123@gmail.com'),
(106, 'Sanjay', 20, 'sanjay123@gmail.com'),
(107,'Arun', 24, 'arun123@gmail.com') ;

ALTER TABLE students ADD COLUMN DOB DATE;

INSERT INTO students (DOB)
VALUES ('2004-09-23');

TRUNCATE TABLE students;

DROP TABLE students;

SELECT * FROM students;

SHOW TABLES;