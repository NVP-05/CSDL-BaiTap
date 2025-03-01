create database bai2;
use bai2;

create table students (
    student_id int primary key not null auto_increment,
    name varchar(255) not null,
    age int check (age > 0),
    email varchar(225) not null unique
);

INSERT INTO students (name, email, age) 
VALUES 
('Nguyen Van A', 'nguyenvana@example.com', 22), 
('Le Thi B', 'lethib@example.com', 20), 
('Tran Van C', 'tranvanc@example.com', 23), 
('Pham Thi D', 'phamthid@example.com', 21);

update students
set email = 'newemail@example.com'
where student_id = 3;