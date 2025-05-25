CREATE TABLE `Staff`(
    `staff_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `Sections`(
    `section_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `section_name` VARCHAR(255) NOT NULL
);

CREATE TABLE `Subjects`(
    `subject_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `subject_name` VARCHAR(255) NOT NULL
);

CREATE TABLE `Students`(
    `student_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `roll_no` VARCHAR(255) NOT NULL,
    `class` VARCHAR(255) NOT NULL,
    `section_id` BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (`section_id`) REFERENCES `Sections`(`section_id`)
);

CREATE TABLE `StudentFees`(
    `fee_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `student_id` BIGINT UNSIGNED NOT NULL,
    `amount_paid` DECIMAL(8, 2) NOT NULL,
    `payment_date` DATE NOT NULL,
    FOREIGN KEY (`student_id`) REFERENCES `Students`(`student_id`)
);

CREATE TABLE `TeacherSalaries`(
    `salery_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `staff_id` BIGINT UNSIGNED NOT NULL,
    `amount` DECIMAL(8, 2) NOT NULL,
    `payment_date` DATE NOT NULL,
    FOREIGN KEY (`staff_id`) REFERENCES `Staff`(`staff_id`)
);

CREATE TABLE `Rooms`(
    `room_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `room_name` VARCHAR(255) NOT NULL
);

CREATE TABLE `RoomAssignments`(
    `assignments_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `class` VARCHAR(255) NOT NULL,
    `section_id` BIGINT UNSIGNED NOT NULL,
    `room_id` BIGINT UNSIGNED NOT NULL,
    `day_of_week` VARCHAR(255) NOT NULL,
    `time_slot` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`section_id`) REFERENCES `Sections`(`section_id`),
    FOREIGN KEY (`room_id`) REFERENCES `Rooms`(`room_id`)
);

CREATE TABLE `SectionSubjectTeacher`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `section_id` BIGINT UNSIGNED NOT NULL,
    `subject_id` BIGINT UNSIGNED NOT NULL,
    `staff_id` BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (`section_id`) REFERENCES `Sections`(`section_id`),
    FOREIGN KEY (`subject_id`) REFERENCES `Subjects`(`subject_id`),
    FOREIGN KEY (`staff_id`) REFERENCES `Staff`(`staff_id`)
);