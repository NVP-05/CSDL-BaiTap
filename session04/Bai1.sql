CREATE DATABASE bai1;
USE bai1;

CREATE TABLE machine_room (
    machine_room_id INT PRIMARY KEY,
    name_manager VARCHAR(50),
    name_room VARCHAR(50)
);

CREATE TABLE computer (
    computer_id INT PRIMARY KEY,
    hard_drive_capacity VARCHAR(50),
    ram_capacity VARCHAR(50),
    cpu_speed VARCHAR(50),
    machine_room_id INT,
    FOREIGN KEY (machine_room_id) REFERENCES machine_room (machine_room_id)
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    name_subject VARCHAR(50),
    course_duration INT
);

CREATE TABLE sign_in (
    registration_date VARCHAR(50),
    machine_room_id INT,
    subject_id INT,
    FOREIGN KEY (machine_room_id) REFERENCES machine_room (machine_room_id),
    FOREIGN KEY (subject_id) REFERENCES subjects (subject_id)
);