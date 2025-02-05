CREATE DATABASE bai2;
USE bai2;

CREATE TABLE supplier (
    supplier_id INT PRIMARY KEY,
    name_supplier VARCHAR(50)
);

CREATE TABLE material (
    material_id INT PRIMARY KEY,
    name_material VARCHAR(50)
);

CREATE TABLE address (
    address_id INT PRIMARY KEY,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id)
);

CREATE TABLE purchase (
    supplier_id INT,
    material_id INT,
    price DECIMAL(20, 5),
    quantity INT,
    FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id),
    FOREIGN KEY (material_id) REFERENCES material (material_id)
);