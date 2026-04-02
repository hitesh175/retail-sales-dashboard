CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name TEXT,
    segment TEXT
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name TEXT,
    category TEXT
);

CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name TEXT,
    country TEXT
);

CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_id INT,
    region_id INT,
    quantity INT,
    sales_amount FLOAT,
    profit FLOAT
);


SELECT SUM(sales_amount) AS total_revenue
FROM sales;

SELECT COUNT(order_id) AS total_orders
FROM sales;


SELECT 
    p.category,
    SUM(s.sales_amount) AS revenue
FROM sales s
JOIN products p 
ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;


SELECT 
    p.product_name,
    SUM(s.sales_amount) AS revenue
FROM sales s
JOIN products p 
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;



SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales_amount) AS revenue
FROM sales
GROUP BY month
ORDER BY month;
