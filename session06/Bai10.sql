USE session06;

-- 1. Xóa các cuộc hẹn của bác sĩ "Phan Huong" nếu ngày hẹn đã qua
DELETE a FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE d.full_name = 'Phan Huong' 
AND a.appointment_date < CURDATE();

-- 2. Hiển thị danh sách cuộc hẹn còn lại
SELECT 
    a.appointment_id,
    p.full_name AS patient_name,
    d.full_name AS doctor_name,
    a.appointment_date,
    a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 3. Cập nhật trạng thái cuộc hẹn của bệnh nhân "Nguyen Van An" với bác sĩ "Phan Huong" thành "Đang chờ"
UPDATE appointments a
SET a.status = 'Đang chờ'
WHERE a.appointment_date >= CURDATE()
AND a.patient_id = (SELECT patient_id FROM patients WHERE full_name = 'Nguyen Van An')
AND a.doctor_id = (SELECT doctor_id FROM doctors WHERE full_name = 'Phan Huong');

-- 4. Hiển thị danh sách cuộc hẹn sau khi cập nhật trạng thái
SELECT 
    a.appointment_id,
    p.full_name AS patient_name,
    d.full_name AS doctor_name,
    a.appointment_date,
    a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 5. Liệt kê các bệnh nhân có ít nhất 2 cuộc hẹn với cùng một bác sĩ, kèm theo chẩn đoán
SELECT 
    p.full_name AS patient_name,
    d.full_name AS doctor_name,
    a.appointment_date,
    m.diagnosis
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN medicalrecords m ON a.appointment_id = m.record_id
WHERE (
    SELECT COUNT(*) 
    FROM appointments a2 
    WHERE a2.patient_id = a.patient_id 
    AND a2.doctor_id = a.doctor_id
) >= 2
ORDER BY p.full_name, d.full_name, a.appointment_date;

-- 6. Hiển thị danh sách bệnh nhân và bác sĩ kèm thông tin cuộc hẹn, chẩn đoán
select
    UPPER(p.full_name) as PatientNam,
    UPPER(d.full_name) as DoctorName,
    a.appointment_date as AppointmentDate,
    year(a.appointment_date) as AppointmentYear,
    a.status as AppointmentStatus
from appointments a
join patients p on a.patient_id = p.patient_id
join doctors d on a.doctor_id = d.doctor_id
join medical_records m on a.appointment_id = m.record_id
order by a.appointment_date asc;
