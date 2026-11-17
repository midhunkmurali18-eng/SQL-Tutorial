USE collegedb;
CREATE TABLE students_dob ( ID INT PRIMARY KEY AUTO_INCREMENT , NAME VARCHAR(50), CITY VARCHAR(50), DOB DATE);

SELECT * FROM students_dob;

SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();
SELECT DATE(NOW());
SELECT TIME(NOW());
SELECT CURRENT_TIMESTAMP();
SELECT UTC_DATE();
SELECT UTC_TIME();
SELECT UTC_TIMESTAMP();
-- UTC : UNIVERSAL REFERENCE TIME

SELECT YEAR(DOB) FROM students_dob;
SELECT MONTH(DOB) FROM students_dob;
SELECT DAY(DOB) FROM students_dob;

SELECT HOUR(TIME(NOW()));
SELECT MINUTE(TIME(NOW()));
SELECT SECOND(TIME(NOW()));

-- TIMESTAMPDIFF() – Difference in years, months or days
-- syntax: TIMESTAMPDIFF(unit, start_date, end_date);
-- CALCULATE AGE USING DOB
SELECT NAME, TIMESTAMPDIFF(YEAR,DOB,CURDATE()) AS AGE FROM students_dob;
SELECT NAME,TIMESTAMPDIFF(MONTH,DOB,CURDATE()) AS months_since_birth FROM students_dob;
SELECT NAME,TIMESTAMPDIFF(WEEK,DOB,CURDATE()) AS weeks_since_birth FROM students_dob;

-- SELECT STUDENTS BORN IN 2003
SELECT * FROM students_dob WHERE YEAR(DOB) = 2003;

-- CALCULATE DIFFERENCE BETWEEN TWO DATES IN DAYS
SELECT DATEDIFF('2026-11-12', '2003-05-12');

-- Get the number of days since each student's birth:
SELECT NAME,DOB,DATEDIFF(CURDATE(),DOB) AS days_since_birth FROM students_dob ;

-- DATE_ADD() : Adds a specified time interval to a date.
-- syntax: DATE_ADD(date, INTERVAL value unit);
SELECT NAME,DOB,DATE_ADD(DOB, INTERVAL 10 DAY) AS add_10_days FROM students_dob;
SELECT NAME,DOB,DATE_ADD(DOB, INTERVAL 2 MONTH) AS add_2_months FROM students_dob;
SELECT NAME,DOB,DATE_ADD(DOB, INTERVAL 18 YEAR) AS add_18_years FROM students_dob;

-- DATE_SUB() – Subtract time from a date
SELECT NAME,DOB,DATE_SUB(DOB, INTERVAL 10 DAY) AS subtracts_10_days FROM students_dob;

SELECT NAME,DOB,DATE_FORMAT(DOB,'%d-%m-%Y') AS formated_dob FROM students_dob;
SELECT NAME,DOB,DATE_FORMAT(DOB,'%d-%M-%Y %W') AS formated_dob FROM students_dob;

-- STR_TO_DATE() – Convert a string into a date
-- syntax : STR_TO_DATE(string, format);
SELECT STR_TO_DATE('12-05-2003', '%d-%m-%Y'); 

-- LAST_DAY() – Get the last day of a month
SELECT NAME,DOB,LAST_DAY(DOB) AS last_day_of_month FROM students_dob;

SELECT * FROM students_dob WHERE DOB > '2003-01-01';
SELECT * FROM students_dob WHERE YEAR(DOB) = 2002;
SELECT * FROM students_dob WHERE DOB BETWEEN '2002-05-12' AND '2003-01-01';

SELECT * FROM students_dob WHERE MONTH(DOB)=12;
SELECT * FROM students_dob WHERE TIMESTAMPDIFF(YEAR,DOB,CURDATE()) > 23;
