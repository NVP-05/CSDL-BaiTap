USE session06;

-- 2. Thống kê số lượng bệnh nhân và số cuộc hẹn của bác sĩ
SELECT 
    d.full_name AS doctor_name,
    d.specialization,
    COUNT(DISTINCT a.patient_id) AS total_patients,
    COUNT(a.appointment_id) AS total_appointments,
    d.email
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id
HAVING COUNT(a.appointment_id) > 1
ORDER BY total_patients DESC, total_appointments DESC
LIMIT 5;

-- 3. Tính tổng thu nhập của bác sĩ dựa trên số cuộc hẹn (giả sử mỗi cuộc hẹn là 500,000 VND)
SELECT 
    d.full_name AS doctor_name,
    d.specialization,
    COUNT(DISTINCT a.patient_id) AS total_patients,
    COUNT(a.appointment_id) * 500000 AS total_earnings,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id
HAVING COUNT(a.appointment_id) * 500000 > 600000
ORDER BY total_earnings DESC;

-- 4. Phân loại nhóm tuổi của bệnh nhân khi đặt lịch hẹn
SELECT 
    p.patient_id AS patient_id,
    p.full_name AS patient_name,
    d.full_name AS doctor_name,
    a.appointment_date,
    DATEDIFF(CURDATE(), p.date_of_birth) DIV 365 AS age,
    CASE
        WHEN DATEDIFF(CURDATE(), p.date_of_birth) DIV 365 < 18 THEN 'Trẻ em'
        WHEN DATEDIFF(CURDATE(), p.date_of_birth) DIV 365 BETWEEN 18 AND 30 THEN 'Trung niên'
        WHEN DATEDIFF(CURDATE(), p.date_of_birth) DIV 365 BETWEEN 31 AND 40 THEN 'Qua thời'
        WHEN DATEDIFF(CURDATE(), p.date_of_birth) DIV 365 BETWEEN 41 AND 50 THEN 'Lớn tuổi'
        WHEN DATEDIFF(CURDATE(), p.date_of_birth) DIV 365 BETWEEN 51 AND 60 THEN 'Già'
        ELSE 'Người cao tuổi'
    END AS age_group
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;
