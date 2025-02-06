USE session05;


SELECT 
    CONCAT(p.full_name, ' (', YEAR(a.appointment_date) - YEAR(p.date_of_birth), ') - ', d.full_name) AS patient_doctor_info,
    a.appointment_date, 
    m.diagnosis
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN medical_records m ON a.patient_id = m.patient_id AND a.doctor_id = m.doctor_id
WHERE a.appointment_date BETWEEN '2025-01-20' AND '2025-01-25'
ORDER BY a.appointment_date;


SELECT 
    p.full_name AS patient_name,
    YEAR(a.appointment_date) - YEAR(p.date_of_birth) AS age_at_appointment,
    a.appointment_date AS appointment_date,
    CASE
        WHEN YEAR(a.appointment_date) - YEAR(p.date_of_birth) > 50 THEN 'Nguy cơ cao'
        WHEN YEAR(a.appointment_date) - YEAR(p.date_of_birth) BETWEEN 30 AND 50 THEN 'Nguy cơ trung bình'
        ELSE 'Nguy cơ thấp'
    END AS risk_level
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
WHERE a.appointment_date BETWEEN '2025-01-20' AND '2025-01-25'
ORDER BY a.appointment_date;


DELETE a
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE 
    (YEAR(a.appointment_date) - YEAR(p.date_of_birth)) > 30
    AND (d.specialization = 'noi tong quat' OR d.specialization = 'chan thuong chinh hinh');


SELECT 
    p.full_name AS patient_name,
    d.specialization AS specialization,
    YEAR(a.appointment_date) - YEAR(p.date_of_birth) AS age_at_appointment
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_date;
