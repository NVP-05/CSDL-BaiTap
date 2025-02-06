USE session05;

CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Nam', 'Nu') NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);

CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Da Dat', 'Chua Dat') NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE medical_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    diagnosis TEXT NOT NULL,
    treatment_plan TEXT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

INSERT INTO patients (full_name, date_of_birth, gender, phone_number)
VALUES
    ('Nguyen Van An', '1985-05-15', 'Nam', '0901234567'),
    ('Tran Thi Binh', '1990-09-12', 'Nu', '0912345678'),
    ('Pham Van Cuong', '1978-03-20', 'Nam', '0923456789'),
    ('Le Thi Dung', '2000-11-25', 'Nu', '0934567890'),
    ('Vo Van Em', '1982-07-08', 'Nam', '0945678901'),
    ('Hoang Thi Phuong', '1995-01-18', 'Nu', '0956789012'),
    ('Ngo Van Giang', '1988-12-30', 'Nam', '0967890123'),
    ('Dang Thi Hanh', '1992-06-10', 'Nu', '0978901234'),
    ('Bui Van Hoa', '1975-10-22', 'Nam', '0989012345');

INSERT INTO doctors (full_name, specialization, phone_number, email)
VALUES
    ('Le Minh', 'Noi Tong Quat', '0908765432', 'leminh@hospital.vn'),
    ('Phan Huong', 'Nhi Khoa', '0918765432', 'phanhuong@hospital.vn'),
    ('Nguyen Tuan', 'Tim Mach', '0928765432', 'nguyentuan@hospital.vn'),
    ('Dang Quang', 'Than Kinh', '0938765432', 'dangquang@hospital.vn'),
    ('Hoang Dung', 'Da Lieu', '0948765432', 'hoangdung@hospital.vn'),
    ('Vu Hanh', 'Phu San', '0958765432', 'vuhanh@hospital.vn'),
    ('Tran An', 'Noi Tiet', '0968765432', 'tranan@hospital.vn'),
    ('Lam Phong', 'Ho Hap', '0978765432', 'lamphong@hospital.vn'),
    ('Pham Ha', 'Chan Thuong Chinh Hinh', '0988765432', 'phamha@hospital.vn');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, status)
VALUES
    (1, 2, '2025-01-20 09:00:00', 'Da Dat'),
    (3, 1, '2025-01-21 10:30:00', 'Da Dat'),
    (5, 3, '2025-01-22 08:00:00', 'Da Dat'),
    (2, 4, '2025-01-23 14:00:00', 'Da Dat'),
    (4, 5, '2025-01-24 11:00:00', 'Da Dat'),
    (6, 6, '2025-01-25 15:00:00', 'Da Dat'),
    (7, 7, '2025-01-26 16:30:00', 'Da Dat'),
    (8, 8, '2025-01-27 09:00:00', 'Da Dat'),
    (9, 9, '2025-01-28 10:00:00', 'Da Dat');

INSERT INTO medical_records (patient_id, doctor_id, diagnosis, treatment_plan)
VALUES
    (1, 2, 'Cam Cum', 'Nghi ngoi, uong nhieu nuoc, su dung paracetamol 500mg khi sot.'),
    (3, 1, 'Dau Dau Man Tinh', 'Kiem tra huyet ap dinh ky, giam cang thang, su dung thuoc giam dau khi can.'),
    (5, 3, 'Roi Loan Nhip Tim', 'Theo doi tim mach 1 tuan/lan, dung thuoc dieu hoa nhip tim.'),
    (2, 4, 'Dau Cot Song', 'Vat ly tri lieu, giam van dong manh.'),
    (4, 5, 'Viêm Da Tiep Xuc', 'Su dung kem boi da, tranh tiep xuc voi chat gay di ung.'),
    (6, 6, 'Thieu Mau', 'Tang cuong thuc pham giau sat, bo sung vitamin.'),
    (7, 7, 'Tieu Duong Type 2', 'Duy tri che do an lanh manh, kiem tra duong huyet thuong xuyen.'),
    (8, 8, 'Hen Suyen', 'Su dung thuoc xit hen hang ngay, tranh tiep xuc bui ban.'),
    (9, 9, 'Gay Xuong', 'Bo bot, kiem tra xuong dinh ky, vat ly tri lieu sau khi thao bot.');


SELECT p.full_name AS patient_name, d.full_name AS doctor_name, 
       a.appointment_date, d.specialization, a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date BETWEEN '2025-01-20' AND '2025-01-25'
ORDER BY a.appointment_date ASC
LIMIT 3;


SELECT p.full_name AS patient_name, p.date_of_birth, 
       d.full_name AS doctor_name, d.specialization, m.diagnosis
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN medical_records m ON a.patient_id = m.patient_id 
                      AND a.doctor_id = m.doctor_id
WHERE a.appointment_date BETWEEN '2025-01-20' AND '2025-01-25'
ORDER BY a.appointment_date ASC
LIMIT 5;


SELECT 
    p.full_name AS patient_name,
    p.date_of_birth,
    TIMESTAMPDIFF(YEAR, p.date_of_birth, a.appointment_date) AS age_at_appointment,
    a.appointment_date,
    m.record_id,
    DATEDIFF(a.appointment_date, CURDATE()) AS days_difference
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN medical_records m ON a.patient_id = m.patient_id 
                      AND a.doctor_id = m.doctor_id
WHERE a.appointment_date BETWEEN '2025-01-20' AND '2025-01-25'
ORDER BY a.appointment_date ASC;
