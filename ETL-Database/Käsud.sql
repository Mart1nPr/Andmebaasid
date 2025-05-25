-- ETL
USE etl;
select * from contact;
select * from customer;

-- Target
USE target;
select * from audit;
select * from customer;

-- Creating tables for target database
CREATE TABLE IF NOT EXISTS customer (
    idcode VARCHAR(20) PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    email VARCHAR(150),
    country CHAR(3),
    address VARCHAR(255),
    gender ENUM('Male', 'Female', 'Other'),
    birthdate DATE,
    juridical BOOLEAN
);

CREATE TABLE IF NOT EXISTS audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type ENUM('INSERT', 'UPDATE', 'DELETE'),
    idcode VARCHAR(20),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    old_data TEXT,
    new_data TEXT
);

-- Inserts data to target database
INSERT INTO target.customer (idcode, firstname, lastname, email, country, address, gender, birthdate, juridical)
SELECT
    c.idcode,
    c.firstname,
    c.lastname,
    c.email,
    c.country,
    c.address,
    CASE
        WHEN cu.gender = 'Female' THEN 'Female'
        WHEN cu.gender = 'Male' THEN 'Male'
        ELSE 'Other'
    END AS gender,
    STR_TO_DATE(cu.birthdate, '%m/%d/%Y'),
    IF(cu.juridical = 'true' OR cu.juridical = '1', 1, 0)
FROM
    etl.contact c
JOIN
    etl.customer cu ON c.idcode = cu.idcode
ON DUPLICATE KEY UPDATE
    firstname = VALUES(firstname),
    lastname = VALUES(lastname),
    email = VALUES(email),
    country = VALUES(country),
    address = VALUES(address),
    gender = VALUES(gender),
    birthdate = VALUES(birthdate),
    juridical = VALUES(juridical);


-- Target trigger
-- Insert trigger
DROP TRIGGER IF EXISTS trg_customer_insert;
DELIMITER $$
CREATE TRIGGER trg_customer_insert
AFTER INSERT ON target.customer
FOR EACH ROW
BEGIN
    INSERT INTO audit(action_type, idcode, new_data)
    VALUES (
        'INSERT',
        NEW.idcode,
        CONCAT_WS(',', 
            NEW.firstname, NEW.lastname, NEW.email, NEW.country, NEW.address,
            NEW.gender, NEW.birthdate, NEW.juridical)
    );
END$$
DELIMITER ;

-- Update trigger
DROP TRIGGER IF EXISTS trg_customer_update;
DELIMITER $$
CREATE TRIGGER trg_customer_update
AFTER UPDATE ON target.customer
FOR EACH ROW
BEGIN
    INSERT INTO audit(action_type, idcode, old_data, new_data)
    VALUES (
        'UPDATE',
        NEW.idcode,
        CONCAT_WS(',', 
            OLD.firstname, OLD.lastname, OLD.email, OLD.country, OLD.address,
            OLD.gender, OLD.birthdate, OLD.juridical),
        CONCAT_WS(',', 
            NEW.firstname, NEW.lastname, NEW.email, NEW.country, NEW.address,
            NEW.gender, NEW.birthdate, NEW.juridical)
    );
END$$
DELIMITER ;

-- Delete trigger
DROP TRIGGER IF EXISTS trg_customer_delete;
DELIMITER $$
CREATE TRIGGER trg_customer_delete
AFTER DELETE ON target.customer
FOR EACH ROW
BEGIN
    INSERT INTO audit(action_type, idcode, old_data)
    VALUES (
        'DELETE',
        OLD.idcode,
        CONCAT_WS(',', 
            OLD.firstname, OLD.lastname, OLD.email, OLD.country, OLD.address,
            OLD.gender, OLD.birthdate, OLD.juridical)
    );
END$$
DELIMITER ;