USE students;

CREATE TABLE marks ( 
mark_id INT UNIQUE,
student_id INT UNIQUE,
FOREIGN KEY(student_id) REFERENCES students(id)
);

ALTER TABLE marks ADD COLUMN subject VARCHAR(100) , ADD COLUMN marks INT ;

INSERT INTO marks(mark_id,student_id,subject,marks)
values ( 1001,104,'ENGLISH',78),
(1002,105,'SCIENCE',82),
(1003,106,'MATHS',95);

ALTER TABLE marks MODIFY subject ENUM('ENGLISH','SCIENCE','MATHS');

SELECT *FROM STUDENTS;

SELECT *FROM MARKS;

SHOW CREATE TABLE marks;

DESC MARKS;