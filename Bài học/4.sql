create database QueryDB_Demo;
use QueryDB_Demo;

create table Student(
	student_id char(5) primary key,
    student_name varchar(100) not null,
    student_age int, 
    student_class char(5),
    student_sex bit,
    student_avg_mark float,
    student_status bit
);

insert into Student
values('SV001', 'Nguyen Van A', 18, 'KS23B', 1, 8.2, 1),
('SV002', 'Nguyen Van B', 18, 'KS23B', 1, 8.2, 1),
('SV003', 'Nguyen Van C', 20, 'KS23B', 1, 10, 0),
('SV004', 'Nguyen Van D', 18, 'KS23B', 1, 9, 1),
('SV005', 'Nguyen Van E', 22, 'KS23B', 1, 8.9, 0),
('SV006', 'Nguyen Van F', 25, 'KS23B', 1, 8.2, 1);


insert into Student
values('SV008', 'Nguyen Van H',18, null, 1, 8.2, 1);


select * from Student;

-- 1. Lấy ra tất cả các sv có tuổi trong khoảng 18-20
select *
from student s
where s.student_age >=18 and s.student_age <=20;

-- 2. Lấy ra tất cả các sv có tuổi nhỏ hơn 20 và lớn 23
select *
from student s
where s.student_age < 20 or s.student_age > 23;

-- 3. Lấy ra tất cả các sv có tuổi 18, 22 hoặc 25
select *
from student s
where s.student_age in (18, 22, 25);

-- 4. Lấy ra tất cả các sv có tuổi trong khoảng 22 và 25
select *
from student s
where s.student_age between 22 and 25;

-- 5. Lấy ra các sv có tên là Nguyen Van A
select *
from student s
where s.student_name = 'Nguyen Van A';

-- 6. Lấy ra các sv có tên kết thúc là B
select *
from student s
where s.student_name like '%B';

-- 7. Lấy ra các sv có tên chứa kí tự thứ 3 là u
select *
from student s
where s.student_name like '__u%';

-- 8. Lấy ra các sv có chứa chuỗi van ở trong tên
select *
from student s
where s.student_name like '%van%';

-- 9. Lấy ra tất cả các sv chưa được xếp vào lớp
select *
from student s
where s.student_class is null;

-- 10. Lấy ra tất cả các sv sắp xếp theo tuổi tăng dần
select *
from student s
order by s.student_age;

-- 11. Lấy ra tất cả các sv sắp xếp theo tuổi tăng dần, nhưng nếu bằng nhau thì sắp xếp giảm dần
select *
from student s
order by s.student_age ASC, s.student_name DESC;

-- 12. Lấy ra thông tin 3 sv đầu tiên
select *
from student s
limit 3;

-- 13. Lấy ra thông tin 2 sinh viên từ vị trí thứ 3
select *
from student s
limit 2 offset 3;

-- 14. Lấy sinh viên gồm mã, tên, tuổi và giới tính (nam-nữ)

select s.student_id, s.student_name, s.student_age, s.student_sex ,
case s.student_sex
	when 1 then 'Nam'
    else 'Nu' end as 'Sex'
from student s