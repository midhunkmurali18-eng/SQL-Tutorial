CREATE TABLE alter_students( 
ID INT PRIMARY KEY, 
NAME VARCHAR(100),
AGE INT
);

INSERT INTO alter_students ( ID , NAME , AGE )
VALUES (101,'MIDHUN',22),
(102,'ASWIN',23),
(103,'ARUN',24),
(104,'AKASH',20) ;

ALTER TABLE alter_students ADD COLUMN email VARCHAR(100) UNIQUE, ADD COLUMN city  VARCHAR(100);

ALTER TABLE ALTER_STUDENTS MODIFY COLUMN age tinyint;

ALTER TABLE alter_students RENAME COLUMN name TO student_name;

ALTER TABLE alter_students DROP COLUMN email;

INSERT INTO alter_students (id, city )
VALUES (101,'Trivandrum'),
(102,'Attingal'),
(103,'Kollam'),
(104,'Kochi');

DESC alter_students;

SELECT * FROM alter_students;