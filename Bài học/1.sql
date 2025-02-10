select version();
/*
	Lưu ý: 
    1. Không phân biệt hoa thường.
    2. Để kết thúc câu lệnh bắt buộc sử dụng ;
    3. Comment 1 dòng --  , nhiều dòng
    4. Conversion đặt tên trong db là snake
*/
-- 1. Tạo CSDL có tên là KS23B_Database
create database KS23B_database;
-- 2. Xóa CSDL có tên là KS23B_Database
drop database ks23b_database;
-- 3. Lựa chọn CSDL có tên KS23B_Database để làm việc
use ks23b_database;
/*
	ER--> Table
    1 attribute --> 1 colum
	Syntax:
    CREATE TABLE [table_name](
		-- Khai báo các cột trong bảng 
        [colum_name] datatype constraints,
    )
*/
/*
	4. Tạo bảng danh mục sản phẩm gồm các trường: 
    - Mã danh mục: PK, tăng tự động
    - Tên danh mục: varchar(100) duy nhất, bắt bu
    - Mô tả danh mục: text
    - Độ ưu tiên danh mục: int
    - Trạng thái danh mục: bit hoặc mặc định là 1
*/
create table Categories(
	cat_id int primary key auto_increment,
    cat_name varchar(100) unique not null,
    cat_description text,
    cat_priority int,
    cat_status bit default(1)
);

/*
	Tạo bảng sản phẩm gồm các trường: 
    - Mã sản phẩm 
    - Tên sản phẩm: duy nhất
    - Giá SP: float và có giá trị > 0
    - Mã danh mục: FK
    - Trạng thái
*/

create table product(
	pro_id char(5) primary key,
    pro_name varchar(100) not null unique,
    pro_price float check(pro_price > 0),
    pro_create date,
    cat_id int,
    foreign key (cat_id) references categories(cat_id),
    pro_status bit
);

-- 6. Xóa bảng Categories
drop table categories;
-- 7. Xóa bảng product
drop table product;
-- 8. Thêm cột ngày tạo vào trong bảng categories
alter table categories 
	add column cat_created date; 
-- 9. Sửa tên cột cat_created thành tên catalog_created
alter table categories 	
	rename column cat_created to catalog_created;
-- 10. Thay đổi kiểu dữ liệu của cột catalog_created thành varchar(100)
alter table categories 
	modify column catalog_created varchar(100);

-- 11. Xóa cột catalog_created trong bảng categories
alter table categories
	drop column catalog_created;