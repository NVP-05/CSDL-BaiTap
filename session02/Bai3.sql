use ks23b_database; 

CREATE TABLE product (
    pro_id INT PRIMARY KEY,
    pro_name VARCHAR(100),
    pro_price DECIMAL(10, 2),
    pro_quantity INT
);

CREATE TABLE SanPham (
    pro_id INT PRIMARY KEY,
    pro_name VARCHAR(100) NOT NULL,
    pro_price DECIMAL(10, 2) NOT NULL,
    pro_quantity INT
);
