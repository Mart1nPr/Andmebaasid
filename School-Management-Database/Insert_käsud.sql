INSERT INTO Staff (name) VALUES ('Martin Pruus');

INSERT INTO Sections (section_name) VALUES ('Tarkvaraarendaja');

INSERT INTO Subjects (subject_name) VALUES ('Andmebaasid');

INSERT INTO Students (name, roll_no, class, section_id) VALUES ('Martin Pruus', 'TPTTA23A', 'TA23A', 1);

INSERT INTO StudentFees (student_id, amount_paid, payment_date) VALUES (1, 150.00, '2025-05-25');

INSERT INTO TeacherSalaries (staff_id, amount, payment_date) VALUES (1, 1200.00, '2025-05-25');

INSERT INTO Rooms (room_name) VALUES ('Ruum A302');

INSERT INTO RoomAssignments (class, section_id, room_id, day_of_week, time_slot) VALUES ('TA23A', 1, 1, 'Esmaspäev', '10:05-11:45');

INSERT INTO SectionSubjectTeacher (section_id, subject_id, staff_id) VALUES (1, 1, 1);