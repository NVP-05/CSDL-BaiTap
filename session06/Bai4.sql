USE session06;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,  
    product_name VARCHAR(100) NOT NULL,         
    category VARCHAR(50) NOT NULL,             
    price DECIMAL(10, 2) NOT NULL,             
    stock INT NOT NULL                         
);

INSERT INTO products (product_name, category, price, stock)
VALUES
    ('iPhone 14', 'Electronics', 1000.00, 50),
    ('MacBook Air', 'Electronics', 1200.00, 30),
    ('T-Shirt', 'Fashion', 20.00, 200),
    ('Sneakers', 'Fashion', 100.00, 100),
    ('Refrigerator', 'Appliances', 800.00, 10),
    ('Air Conditioner', 'Appliances', 600.00, 15),
    ('Laptop', 'Electronics', 1500.00, 25),
    ('Headphones', 'Electronics', 200.00, 75),
    ('Jacket', 'Fashion', 150.00, 50),
    ('Washing Machine', 'Appliances', 700.00, 8);

SELECT product_name, category, price 
FROM products
WHERE price > (SELECT price FROM products WHERE product_name = 'MacBook Air');

SELECT product_name, category, price 
FROM products
WHERE category = 'Electronics' AND price < (SELECT price FROM products WHERE product_name = 'Laptop');

SELECT product_name, price, stock 
FROM products
WHERE stock < (SELECT stock FROM products WHERE product_name = 'T-Shirt');
