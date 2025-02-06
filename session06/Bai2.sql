USE session06;

SELECT customer_name, product_name, SUM(quantity) AS total_quantity 
FROM orders
GROUP BY customer_name, product_name
HAVING SUM(quantity) > 1;

SELECT customer_name, order_date, quantity 
FROM orders
WHERE quantity > 2;

SELECT customer_name, order_date, quantity * price AS total_spent 
FROM orders
WHERE quantity * price > 20000000;
