USE collegedb;
SELECT * FROM STUDENTS;

SELECT UPPER(NAME) FROM students;
SELECT LOWER(NAME) FROM students;
SELECT LENGTH(NAME) FROM students;

-- LENGTH RETURN BYTES WHERE AS CHAR_LENGTH RETURNS NO OF CHARACTERS.
SELECT NAME,LENGTH(NAME) AS name_length FROM students;
SELECT NAME,LENGTH(NAME) AS name_length, CITY, LENGTH(CITY) AS city_length, CHAR_LENGTH(CITY) AS no_of_chars FROM STUDENTS;

SELECT CONCAT(NAME,' - ',DEPARTMENT) AS student_details FROM students;
SELECT CONCAT(NAME,' - ',DEPARTMENT,' scored ',MARKS,' OUT OF 100 ') AS marks_scored FROM students;
-- CONCAT_WS You Specify the Separator once only
SELECT CONCAT_WS(' - ',NAME,DEPARTMENT,CITY) AS students_details FROM students;

-- TRIM()
SELECT TRIM(' HELLO WORLD ') AS RESULT;
SELECT LTRIM(' HELLO WORLD') AS RESULT;
SELECT RTRIM('HELLO WORLD ') AS RESULT;

-- SUBSTRING(string, start_position, length)
SELECT SUBSTRING(CITY,1,4) AS city_four FROM students;

-- LEFT()
-- Extracts characters from the beginning.
SELECT LEFT(CITY,4) AS city_four FROM  students;

-- RIGHT()
-- Extracts characters from the end.
SELECT RIGHT(CITY,4) AS city_four FROM students;

-- REPLACE(string, old_string, new_string), Replaces a specific substring with another substring.
SELECT REPLACE(DEPARTMENT, 'CS', 'Computer Science') AS cs_replace FROM students;

-- REVERSE() Reverses a string.
SELECT REVERSE(NAME) FROM students;

-- INSTR(string, substring) Returns the position of the first occurrence of a substring.
SELECT INSTR(NAME,'i') FROM students;

-- LOCATE(substring, string) Similar to INSTR(), but the argument order is different.
SELECT LOCATE('CS',DEPARTMENT) FROM students;

-- LPAD() and RPAD() These functions add characters to a string until it reaches the specified length.
SELECT LPAD(AGE,4,0) FROM students;
SELECT RPAD(AGE,4,0) FROM students;

-- REPEAT() Repeats a string a specified number of times.
SELECT REPEAT(NAME,3) FROM STUDENTS;

-- SPACE() Returns a string containing a specified number of spaces.
SELECT CONCAT(NAME,SPACE(10),DEPARTMENT) FROM students;

-- FORMAT() Formats a number with commas and a specified number of decimal places.
SELECT FORMAT(1234567.891, 2);

-- SUBSTRING_INDEX() This is one of the most useful string functions for real-world data cleaning.
-- SYNTAX : SUBSTRING_INDEX(string, delimiter, count)
SELECT SUBSTRING_INDEX('arun@gmail.com', '@', 1) AS Everything_Before;
-- Here, 1 means extract everything before the first @.
SELECT SUBSTRING_INDEX('midhun@gmail.com','@',-1) AS Everything_After;
-- Here, -1 means extract everything after the first @.

SELECT * FROM STUDENTS;