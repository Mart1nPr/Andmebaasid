CREATE DATABASE TA23A;
USE TA23A;

select * from student;
select * from course;
select * from stgroup;
select * from comment;

select count(*) from student;
select count(*) from course;
select count(*) from stgroup;
select count(*) from comment;

/* stgroup */
INSERT INTO stgroup (code, description) values ("MM-22", "2022 Multimeedia");
INSERT INTO stgroup (code, description) values ("VM-24", "2024 Visuaalmeedia");
INSERT INTO stgroup (code, description) values ("TA-23", "2023 Tarkvaraarendus");
INSERT INTO stgroup (code, description) values ("TA-24", "2024 Tarkvaraarendus");

select * from stgroup;
select count(*) from stgroup;

/* student */
INSERT INTO student (id, firstname, lastname, birthdate, groupcode) values (1231231, "Juri", "Nikulin", "1954-12-23", "MM-22");
INSERT INTO student (id, firstname, lastname, birthdate, groupcode) values (1231232, "Anna", "Petrova", "1995-04-18", "VM-24");
INSERT INTO student (id, firstname, lastname, birthdate, groupcode) values (1231233, "Alex", "Smith", "1990-03-10", "TA-23");
INSERT INTO student (id, firstname, lastname, birthdate, groupcode) values (1231234, "Sofia", "Brown", "1992-09-25", "TA-24");
INSERT INTO student (id, firstname, lastname, birthdate, groupcode) values (1231235, "Dmitry", "Ivanov", "1988-11-05", "MM-22");
INSERT INTO student (id, firstname, lastname, birthdate, groupcode) values (1231236, "Maria", "Davis", "1996-01-30", "VM-24");
INSERT INTO student (id, firstname, lastname, birthdate, groupcode) values (1231237, "Igor", "Miller", "1982-02-18", "TA-23");
INSERT INTO student (id, firstname, lastname, birthdate, groupcode) values (1231238, "Elena", "Wilson", "1996-07-22", "TA-24");
INSERT INTO student (id, firstname, lastname, birthdate, groupcode) values (1231239, "Vladimir", "Anderson", "1981-04-12", "MM-22");
INSERT INTO student (id, firstname, lastname, birthdate, groupcode) values (1231240, "Olga", "Taylor", "1980-12-01", "VM-24");
INSERT INTO student (id, firstname, lastname, birthdate, groupcode) values (1231241, "Sergey", "Thomas", "1979-08-28", "TA-23");
INSERT INTO student (id, firstname, lastname, birthdate, groupcode) values (1231242, "Natalia", "Jackson", "1993-05-14", "TA-24");

select * from student;
select count(*) from student;
select groupcode, count(*) from student group by groupcode;

/* Comment */
INSERT INTO comment (id, studentid, comment) values (1, "1231231", "Oli tunnis väga hea.");
INSERT INTO comment (id, studentid, comment) values (2, "1231237", "Hilines tundi 40 minutit.");
INSERT INTO comment (id, studentid, comment) values (3, "1231242", "Oli väga tubli!");

select * from comment;
select count(*) from comment;
