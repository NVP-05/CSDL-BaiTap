CREATE DATABASE session06;
USE session06;

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,              
    customer_name VARCHAR(100) NOT NULL,                 
    product_name VARCHAR(100) NOT NULL,                  
    quantity INT NOT NULL CHECK (quantity > 0),         
    price DECIMAL(10, 2) NOT NULL CHECK (price > 0),    
    order_date DATE NOT NULL                             
);

INSERT INTO orders (customer_name, product_name, quantity, price, order_date)
VALUES
    ('Nguyen Van A', 'Laptop', 1, 15000000, '2025-01-01'),
    ('Tran Thi B', 'Smartphone', 2, 8000000, '2025-01-01'),
    ('Nguyen Van A', 'Headphones', 3, 2000000, '2025-01-03'),
    ('Le Van C', 'Laptop', 1, 15000000, '2025-01-01'),
    ('Nguyen Van A', 'Smartphone', 1, 8000000, '2025-01-05'),
    ('Tran Thi B', 'Headphones', 1, 2000000, '2025-01-05'),
    ('Le Van C', 'Smartphone', 3, 8000000, '2025-01-07'),
    ('Tran Thi B', 'Laptop', 1, 15000000, '2025-01-03');

SELECT customer_name, SUM(quantity) AS total_quantity 
FROM orders
GROUP BY customer_name;

SELECT product_name, MAX(price) AS max_price 
FROM orders
GROUP BY product_name;

SELECT order_date, COUNT(*) AS order_count 
FROM orders 
GROUP BY order_date;

SELECT customer_name, MIN(price) AS min_price 
FROM orders
GROUP BY customer_name;
