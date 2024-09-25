/* Ülesanne 1 */
CREATE DATABASE mpruus;

/* Ülesanne 2 */
USE mpruus;

CREATE TABLE student (
    id BIGINT,
    firstname VARCHAR(256),
    lastname VARCHAR(256),
    PRIMARY KEY (id)
);

/* Ülesanne 3 */
CREATE TABLE stgroup (
    code VARCHAR(8),
    description VARCHAR(256),
    PRIMARY KEY (code)
);

CREATE TABLE course (
    code VARCHAR(8),
    description VARCHAR(256),
    PRIMARY KEY (code)
);

INSERT INTO stgroup (code, description) VALUES ("TA-23A", "Tarkvaraarendus (eesti)");
INSERT INTO stgroup (code, description) VALUES ("TA-23B", "Tarkvaraarendus (vene)");

SELECT * FROM stgroup;

INSERT INTO course (code, description) VALUES ("Math", "Mathematics");
INSERT INTO course (code, description) VALUES ("Est", "Estonian");

SELECT * FROM course;

INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899122, "Alar", "Karis", "TA-23A", "1973-3-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899123, "Allan", "Lond", "TA-23B", "2007-12-9");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899124, "Marko", "Vassiljev", "TA-23A", "2007-2-4");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899125, "Mikk", "Vakepea", "TA-23B", "2007-3-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899126, "Romet", "Koha", "TA-23A", "2007-5-25");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899127, "Martin", "Pruus", "TA-23A", "2006-12-28");

SELECT * FROM student;

/* Ülesanne 4 */
ALTER TABLE student 
ADD COLUMN groupcode VARCHAR(8),
ADD COLUMN birthdate DATE;

/* Ülesanne 5 */
ALTER TABLE student
ADD FOREIGN KEY (groupcode) REFERENCES stgroup(code);

/* Ülesanne 7 */
CREATE TABLE comment (
    id BIGINT not null auto_increment,
    studentid BIGINT,
    comment VARCHAR(256),
    FOREIGN KEY (studentid) REFERENCES student(id),
    primary key (id)
);

/* Ülesanne 8 */
SELECT 
    comment.studentid AS id,
    student.firstname AS firstname,
    student.lastname AS lastname,
    comment.comment AS comment,
    student.birthdate,
    student.groupcode
FROM 
    student
JOIN comment ON student.id = comment.studentid;

/* Ülesanne 9 */
CREATE VIEW comments AS
SELECT 
    comment.studentid AS id,
    student.firstname AS firstname,
    student.lastname AS lastname,
    comment.comment AS comment
FROM 
    student
JOIN comment ON student.id = comment.studentid;

select * from student;

INSERT INTO comment (studentid, comment) VALUES (2354899122, "Magas tunnis");
INSERT INTO comment (studentid, comment) VALUES (2354899123, "Ei kuulanud");
INSERT INTO comment (studentid, comment) VALUES (2354899124, "Lobises tunnis");
INSERT INTO comment (studentid, comment) VALUES (2354899126, "Segas kooli kaaslasi");

select * from comments;

/* Ülesanne 11 */
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899128, "Tere", "Piim", "TA-23A", "1973-3-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899129, "Aino", "Hummer", "TA-23B", "2003-4-12");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899131, "Ivar", "Vähi", "TA-23A", "1993-7-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899132, "Tõnu", "Tamm", "TA-23A", "2006-7-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899133, "Siim", "Kallas", "TA-23B", "1969-4-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899134, "Aino", "Seal", "VM-22E", "2000-4-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899135, "Arvutei", "Seal", "TA-21E", "2000-4-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899136, "Arvueti", "Seal", "TA-23A", "2000-4-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899137, "Arvueti", "Seal", "TA-23A", "2000-4-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899138, "Areevuti", "Seal", "TA-23A", "2000-4-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899139, "Arvueti", "Seael", "TA-21E", "2000-4-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899140, "Arvueti", "Seeal", "TA-21E", "2000-4-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899141, "Aervuti", "Seeal", "TA-20V", "2000-4-30");
INSERT INTO student (id, firstname, lastname, groupcode, birthdate) VALUES (2354899142, "Arvutei", "Seaeeel", "VM-22E", "2000-4-30");

select * from student;

INSERT INTO stgroup (code, description) VALUES ("TA-22E", "Tarkvaraarendus (eesti)");
INSERT INTO stgroup (code, description) VALUES ("TA-21E", "Tarkvaraarendus (eesti)");
INSERT INTO stgroup (code, description) VALUES ("VM-22E", "Visuaal Meedia (eesti)");
INSERT INTO stgroup (code, description) VALUES ("TA-20V", "Tarkvaraarendus (vene)");

select * from stgroup;

INSERT INTO comment (studentid, comment) VALUES (2354899138, "Tegi pahandust");
INSERT INTO comment (studentid, comment) VALUES (2354899134, "Segas klassi kaaslasi");

select * from comments;
