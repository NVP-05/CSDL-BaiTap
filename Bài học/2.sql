-- 1. Thêm 1 bản ghi cho bảng categories
insert into categories 
values (1, 'Danh mục quần áo', 'Mô tả quần áo', 1, 1);

select * from categories;

-- 2. Thêm nhiều bản ghi cho categories
insert into categories
values (2, 'Danh mục trang sức', 'Mô tả trang sức', 1, 1),
(3, 'Danh mục giầy dép', 'Mô tả giầy dép', 2, 0),
(4, 'Danh mục nước hoa', 'Mô tả nước hoa', 3, 1);

-- 3. Thêm bản ghi gồm tên danh mục, mô tả, độ ưu tiên vào bảng categories
insert into categories(cat_name, cat_priority, cat_description)
values ('Danh mục đồ chơi', 4, 'Mô tả đồ chơi');

-- 4. Cập nhật tên danh mục thành DM quần áo và độ ưu tiên là 2 cho DM có mã là 1
update categories 
	set cat_name = 'DM quần áo',
		cat_priority = 2
	where cat_id = 1;

-- 5. Cập nhật tất cả các danh mục có trạng thái là 0
update categories
	set cat_status = 0;
    
-- 6. Xóa danh mục có mã là 4
delete from categories
	where cat_id = 4;

-- 7. Xóa tất cả các danh mục
delete from categories;

-- 8. Lấy tất cả các danh mục trong bảng categories
-- Trong tối ưu hóa câu truy vấn, không được sử dụng * trong câu truy vấn 
select * from categories;
select c.cat_id, c.cat_name, c.cat_description, c.cat_priority, c.cat_status
from categories c;

-- 9. Lấy thông tin danh mục gồm: mã, tên, trạng thái
select c.cat_id as 'Mã DM', c.cat_name as 'Tên DM', c.cat_status
from categories c;

-- 10. Lấy ra độ ưu tiên lớn nhất, nhỏ nhất, tổng độ ưu tiên, trung bình độ ưu tiên
select max(c.cat_priority), min(c.cat_priority), sum(c.cat_priority), avg(c.cat_priority)
from categories c;

-- 11. Lấy ra tất cả các danh mục có sản phẩm 

create table product(
	pro_id char(5) primary key,
    pro_name varchar(100) not null unique,
    pro_price float check(pro_price > 0),
    pro_create date,
    cat_id int,
    foreign key (cat_id) references categories(cat_id),
    pro_status bit
);

insert into product
values ('P0001', 'Áo sơ mi nam', 10, '2025-01-16', 1, 1),
('P0002', 'Áo sơ mi nữ', 10, '2025-01-16', 1, 1),
('P0003', 'Váy nữ', 10, '2025-01-16', 1, 1),
('P0004', 'Xếp hình', 2, '2025-01-16', 6, 1),
('P0005', 'Nước hoa', 30, '2025-01-16', 4, 1),
('P0006', 'Vòng cổ', 10, '2025-01-16', 2, 0);

select * from product;

select distinct p.cat_id
from product p;

-- 12. Lấy thông tin sản phẩm gồm mã sp, tên sp, giá, tên dm
select p.pro_id, p.pro_name, p.pro_price, c.cat_name
from product p join categories c on p.cat_id = c.cat_id;

-- 13. Lấy thông tin sản phẩm gồm mã sp, tên sp, giá, thuộc danh mục 
select p.pro_id, p.pro_name, p.pro_price, c.cat_name
from product p left join categories c on p.cat_id = c.cat_id;

-- 14. Lấy thông tin sản phẩm gồm mã sp, tên sp, giá, tên dm chưa có sp nào cả
select p.pro_id, p.pro_name, p.pro_price, c.cat_name
from product p right join categories c on p.cat_id = c.cat_id;


