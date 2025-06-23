-- Create tables

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
id int primary key auto_increment
, first_name varchar(50)
, last_name varchar(50)
, email VARCHAR(50)
);

CREATE TABLE orders (
 id INT PRIMARY KEY,
 customer_id INT NULL,
 order_date DATE,
 total_amount DECIMAL(10, 2),
 FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (id, first_name, last_name) 
VALUES (1, 'John', 'Doe')
	, (2, 'Jane', 'Smith')
	, (3, 'Alice', 'Smith')
	, (4, 'Bob', 'Brown');

INSERT INTO orders (id, customer_id, order_date, total_amount) 
VALUES (1, 1, '2023-01-01', 100.00)
	, (2, 1, '2023-02-01', 150.00)
	, (3, 2, '2023-01-01', 200.00)
	, (4, 3, '2023-04-01', 250.00)
	, (5, 3, '2023-04-01', 300.00)
	, (6, NULL, '2023-04-01', 100.00);
    
-- See the total amount spent by each customer
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;

-- Include order_data
SELECT customer_id, order_date, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id, order_date;

-- Total spent only by customers who have spent more than $200 on an idividual purchase
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
WHERE total_amount > 200
GROUP BY customer_id;

-- Customers who have spent more than $200 total
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 200;

-- See orders table
SELECT * FROM orders;

-- Customer data with orders
SELECT orders.id
, customers.first_name
, customers.last_name
, orders.order_date
, orders.total_amount
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;

-- All orders regardless of null customer id.
SELECT orders.id, customers.first_name, customers.last_name, orders.order_date, orders.total_amount
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.id;

-- Scalar Subquery returns only a single row with a single column
SELECT id, order_date, total_amount
FROM orders
WHERE total_amount >= (SELECT AVG(total_amount) FROM orders); 

-- Column Subquery returns multiple rows from a single column
SELECT id, order_date, total_amount, customer_id
FROM orders
WHERE customer_id IN (SELECT id FROM customers WHERE last_name = 'Smith');

-- Table Subquery multiple rows and multiple columns
SELECT order_date
FROM (SELECT id, order_date, total_amount FROM orders) AS order_summary;
