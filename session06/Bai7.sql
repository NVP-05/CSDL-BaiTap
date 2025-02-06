USE session06;

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    duration INT NOT NULL,
    fee DECIMAL(10, 2) NOT NULL
);

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (full_name, email, phone)
VALUES
('Nguyen Van An', 'nguyenvanan@example.com', '0901234567'),
('Tran Thi Bich', 'tranthibich@example.com', '0912345678'),
('Le Van Cuong', 'levancuong@example.com', '0923456789'),
('Pham Minh Hoang', 'phamminhhoang@example.com', '0934567890'),
('Do Thi Ha', 'dothiha@example.com', '0945678901'),
('Hoang Quang Huy', 'hoangquanghuy@example.com', '0956789012');

INSERT INTO courses (course_name, duration, fee)
VALUES
('Python Basics', 30, 300000),
('Web Development', 50, 1000000),
('Data Science', 40, 1500000);

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2025-01-10'), 
(2, 2, '2025-01-11'), 
(3, 3, '2025-01-12'), 
(4, 1, '2025-01-13'), 
(5, 2, '2025-01-14'), 
(6, 2, '2025-01-10'), 
(2, 3, '2025-01-17'), 
(3, 1, '2025-01-11'), 
(4, 3, '2025-01-19'); 

SELECT 
    s.student_id,
    s.full_name AS student_name,
    s.email,
    SUM(c.fee) AS total_fee_paid,
    COUNT(e.course_id) AS total_courses 
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY s.student_id, s.full_name, s.email
HAVING total_courses > 1
ORDER BY total_fee_paid DESC
LIMIT 5;

SELECT 
    s.student_id,
    s.full_name AS student_name,
    s.email,
    c.fee AS course_fee,
    CASE 
        WHEN c.fee < 500000 THEN 'Low'
        WHEN c.fee BETWEEN 500000 AND 1000000 THEN 'Medium'
        ELSE 'High'
    END AS fee_category,
    e.enrollment_date
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
ORDER BY c.fee ASC, student_name DESC;

SELECT 
    c.course_name,
    c.fee AS course_fee,
    COUNT(e.student_id) AS total_students,
    SUM(c.fee) AS total_revenue 
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name, c.fee
HAVING total_students > 1
ORDER BY total_students DESC, total_revenue DESC
LIMIT 10;
