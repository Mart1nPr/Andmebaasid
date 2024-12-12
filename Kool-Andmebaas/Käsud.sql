CREATE DATABASE kool;

USE kool;

-- Tabel: teachers
CREATE TABLE teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Tabel: subjects
CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100)
);

-- Tabel: classes (klassid)
CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

-- Tabel: students (õpilased)
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    gender VARCHAR(10),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);

-- Tabel: student_subjects (õpilaste ja ainete seosed)
CREATE TABLE student_subjects (
    student_id INT,
    subject_id INT,
    grade VARCHAR(5),
    exam_date DATE,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- Tabel: attendance (kohalolek)
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Tabel: assignments (kodutööd)
CREATE TABLE assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_id INT,
    assignment_name VARCHAR(100),
    due_date DATE,
    max_score INT,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- Tabel: student_assignments (õpilased ja kodutööd)
CREATE TABLE student_assignments (
    student_id INT,
    assignment_id INT,
    score INT,
    PRIMARY KEY (student_id, assignment_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id)
);


-- Andmete sisestus tabelitesse
-- Õpetaja andmed
INSERT INTO teachers (first_name, last_name, email, phone) VALUES
('Mari', 'Jõgi', 'mari.jogi@kool.ee', '+372 512 3456'),
('Tomi', 'Saar', 'tomi.saar@kool.ee', '+372 523 6789'),
('Kristiina', 'Mänd', 'kristiina.mand@kool.ee', '+372 545 1234'),
('Jüri', 'Kase', 'juri.kase@kool.ee', '+372 533 9876'),
('Anu', 'Hõbe', 'anu.hobe@kool.ee', '+372 515 2468');

-- Õppeainete andmed
INSERT INTO subjects (subject_name) VALUES
('Ajalugu'),
('Matemaatika'),
('Keemia'),
('Inglise keel'),
('Geograafia');

-- Klasside andmed
INSERT INTO classes (class_name, teacher_id) VALUES
('10A', 1),
('10B', 2),
('11A', 3),
('11B', 4),
('12A', 5);

-- Õpilaste andmed
INSERT INTO students (first_name, last_name, birth_date, gender, class_id) VALUES
('Andres', 'Jürgenson', '2007-03-12', 'Male', 1),
('Mari-Liis', 'Kask', '2008-06-25', 'Female', 2),
('Kait', 'Kivisalu', '2006-09-08', 'Male', 3),
('Kristel', 'Tamm', '2007-02-17', 'Female', 4),
('Mikk', 'Ristla', '2005-08-05', 'Male', 5),
('Eliise', 'Pärtel', '2008-11-02', 'Female', 1),
('Sander', 'Õunapuu', '2007-10-14', 'Male', 2),
('Laura', 'Paal', '2009-07-22', 'Female', 3),
('Karl-Martin', 'Põder', '2006-12-03', 'Male', 4),
('Lauri', 'Laansalu', '2008-01-30', 'Male', 5);

-- Õpilaste ja ainete seosed
INSERT INTO student_subjects (student_id, subject_id, grade, exam_date) VALUES
(1, 1, 'A', '2024-06-15'),
(1, 2, 'B', '2024-06-16'),
(2, 1, 'A', '2024-06-15'),
(2, 3, 'B', '2024-06-16'),
(3, 2, 'C', '2024-06-15'),
(4, 4, 'A', '2024-06-15'),
(5, 5, 'B', '2024-06-16'),
(6, 3, 'A', '2024-06-15'),
(7, 2, 'B', '2024-06-16'),
(8, 4, 'A', '2024-06-15');

-- Kohalolek
INSERT INTO attendance (student_id, date, status) VALUES
(1, '2024-12-01', 'Present'),
(2, '2024-12-01', 'Present'),
(3, '2024-12-01', 'Absent'),
(4, '2024-12-01', 'Present'),
(5, '2024-12-01', 'Present'),
(6, '2024-12-01', 'Present'),
(7, '2024-12-01', 'Absent'),
(8, '2024-12-01', 'Present'),
(9, '2024-12-01', 'Present'),
(10, '2024-12-01', 'Present');

-- Kodutööd
INSERT INTO assignments (subject_id, assignment_name, due_date, max_score) VALUES
(1, 'Ajalugu kontrolltöö', '2024-12-20', 10),
(2, 'Matemaatika ülesanded', '2024-12-22', 15),
(3, 'Keemia kodutöö', '2024-12-19', 12),
(4, 'Inglise keele essee', '2024-12-18', 10),
(5, 'Geograafia projekt', '2024-12-21', 20);

-- Õppilaste kodutööd
INSERT INTO student_assignments (student_id, assignment_id, score) VALUES
(1, 1, 9),
(1, 2, 13),
(2, 3, 11),
(3, 4, 8),
(4, 5, 18),
(5, 1, 9),
(6, 2, 14),
(7, 3, 12),
(8, 4, 10),
(9, 5, 19);

-- Tabeli vaated
CREATE VIEW view_teachers AS
SELECT * FROM teachers;

CREATE VIEW view_subjects AS
SELECT * FROM subjects;

CREATE VIEW view_classes AS
SELECT * FROM classes;

CREATE VIEW view_students AS
SELECT * FROM students;

CREATE VIEW view_student_subjects AS
SELECT * FROM student_subjects;

CREATE VIEW view_attendance AS
SELECT * FROM attendance;

CREATE VIEW view_assignments AS
SELECT * FROM assignments;

CREATE VIEW view_student_assignments AS
SELECT * FROM student_assignments;






