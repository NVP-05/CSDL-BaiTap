USE session06;

SELECT MIN(price) AS min_price, MAX(price) AS max_price 
FROM orders;

SELECT customer_name, COUNT(*) AS order_count 
FROM orders
GROUP BY customer_name;

SELECT MIN(order_date) AS earliest_date, MAX(order_date) AS latest_date 
FROM orders;
