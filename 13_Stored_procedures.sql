USE startersql;

SELECT * FROM users;

DELIMITER $$
CREATE PROCEDURE select_users()
BEGIN
	SELECT * FROM users;
END $$
DELIMITER ;

CALL select_users();

DELIMITER $$
CREATE PROCEDURE add_users(
	IN p_name VARCHAR(100),
    IN P_email VARCHAR(100),
    IN p_gender ENUM('Male','Female','Other'),
    IN p_dob DATE,
    IN p_salary DECIMAL(10,2)
)
BEGIN
	INSERT INTO users(name,email,gender,date_of_birth,salary)
    VALUES (p_name, p_email, p_gender, p_dob, p_salary);
    SELECT * FROM users;
END $$
DELIMITER ;

CALL add_users('Roronoa Zoro','zoro@gmail.com','Male','2000-04-22',82000);


-- To display procedures
SHOW PROCEDURE STATUS WHERE DB='startersql';

-- to drop procedures
DROP PROCEDURE IF EXISTS select_users;