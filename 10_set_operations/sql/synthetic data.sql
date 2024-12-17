-- creating synthetic data and populating tables 

CREATE SCHEMA IF NOT EXISTS synthetic;

CREATE TABLE IF NOT EXISTS synthetic.sales_jan (
    id INTEGER,
    product_name TEXT,
    amount DECIMAL(10, 2),
    sale_date DATE
);


CREATE TABLE IF NOT EXISTS synthetic.sales_feb (
    id INTEGER,
    product_name TEXT,
    amount DECIMAL(10, 2),
    sale_date DATE
);


CREATE TABLE IF NOT EXISTS synthetic.products (
    id INTEGER,
    product_name TEXT,
    category TEXT,
    price DECIMAL(10, 2)
);


INSERT INTO synthetic.sales_jan VALUES 
(1, 'Laptop', 1200.50, '2024-01-05'),
(2, 'Headphones', 200.00, '2024-01-12'),
(3, 'Monitor', 300.00, '2024-01-15');


INSERT INTO synthetic.sales_feb VALUES 
(3, 'Monitor', 300.00, '2024-02-10'),
(4, 'Keyboard', 100.00, '2024-02-11'),
(5, 'Mouse', 50.00, '2024-02-18');


INSERT INTO synthetic.products VALUES 
(1, 'Laptop', 'Electronics', 1200.00), -- duplicate row
(2, 'Smartphone', 'Electronics', 800.00),
(3, 'Table', 'Furniture', 150.00),
(4, 'Chair', 'Furniture', 100.00),
(5, 'Laptop', 'Electronics', 1200.00); -- duplicate row



SELECT * FROM synthetic.sales_jan;

SELECT * FROM synthetic.sales_feb; 

SELECT * FROM information_schema.tables;

SELECT * FROM synthetic.products;
DROP TABLE synthetic.products;



CREATE TABLE IF NOT EXISTS synthetic.products AS (
SELECT * FROM
 (VALUES
		('Monitor', 'Electronics', 'TechCorp', 300.00),
		('Keyboard', 'Accessories', 'InpuMasters', 100.00),
		('Mouse', 'Accessories', 'InpuMasters', 50.00),
		('Laptop', 'Electronics', 'GigaTech', 1000.00),
		('Headphones', 'Audio', 'SoundPro', 150.00)) AS t(product_name, category, supplier, price));
	
CREATE TABLE IF NOT EXISTS synthetic.sales AS (
SELECT * FROM
 (VALUES
		(2, 2, '2024-02-11', 5, 500.00),
		(4, 4, '2024-02-20', 1, 1000.00),
		(5, 5, '2024-02-21', 4, 600.00)) AS t(sale_id, product_id, sale_date, quantity, total_amount));

	
CREATE TABLE IF NOT EXISTS synthetic.product_thre AS (
SELECT
	ROW_NUMBER() OVER () AS product_id,
	product_name, 
	category, 
	supplier, 
	price
FROM synthetic.products);

SELECT 
	p.product_name,
	p.category,
	p.supplier,
	s.total_amount
FROM synthetic.product_two p
RIGHT JOIN synthetic.sales s
ON p.product_id = s.product_id

