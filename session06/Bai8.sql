USE session06;

SELECT 
    s.student_id,
    s.full_name AS student_name,
    s.email,
    c.course_name,
    e.enrollment_date 
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.student_id IN (
    SELECT student_id 
    FROM enrollments 
    GROUP BY student_id 
    HAVING COUNT(course_id) > 1
)
ORDER BY s.student_id, e.enrollment_date;

SELECT 
    s.full_name AS student_name,
    s.email,
    e.enrollment_date,
    c.course_name,
    c.fee 
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.course_id IN (
    SELECT e2.course_id 
    FROM enrollments e2 
    JOIN students s2 ON e2.student_id = s2.student_id 
    WHERE s2.full_name = 'Nguyen Van An'
) 
AND s.full_name <> 'Nguyen Van An'
ORDER BY c.course_name, e.enrollment_date;

SELECT 
    c.course_name,
    c.duration,
    c.fee,
    COUNT(e.student_id) AS total_students 
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name, c.duration, c.fee
HAVING total_students > 2;

SELECT 
    s.full_name AS student_name,
    s.email,
    SUM(c.fee) AS total_fee_paid,
    COUNT(e.course_id) AS courses_count 
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY s.student_id, s.full_name, s.email
HAVING courses_count >= 2 
AND MIN(c.duration) > 30;
