USE startersql;

CREATE TABLE user_log (
    id 
INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO user_log(user_id,name)
    VALUES(NEW.id,NEW.name);
END $$
DELIMITER ;

CALL add_users('Luffy','luffy@gmail.com','Male','2002-08-30',95000);

SELECT * FROM user_log;

-- DROP THE TRIGGER
DROP TRIGGER IF EXISTS after_user_insert;