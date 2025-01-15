use ks23b_database; 
-- a)
INSERT INTO staff (sta_id, sta_name, sta_date, sta_wage)
VALUES 
    (1, 'Nguyen Van A', '2023-01-15', 6000),
    (2, 'Le Thi B', '2023-02-20', 5500),
    (3, 'Tran Van C', '2023-03-05', 5000);

-- b)
UPDATE staff
SET sta_wage = 7000
WHERE sta_id = 1;

-- c)
DELETE FROM staff
WHERE sta_id = 3;
