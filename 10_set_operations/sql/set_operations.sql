--Union
SELECT * FROM synthetic.sales_jan
UNION
SELECT * FROM synthetic.sales_feb;

-- Now one row is removed because it is not unique.
SELECT * EXCLUDE(sale_date) FROM synthetic.sales_jan
UNION
SELECT * EXCLUDE(sale_date) FROM synthetic.sales_feb;

-- Keeping all 
SELECT id, product_name, amount FROM synthetic.sales_jan
UNION ALL
SELECT id, product_name, amount  FROM synthetic.sales_feb;

--intersection what is common?
SELECT * FROM synthetic.sales_jan
INTERSECT
SELECT * FROM synthetic.sales_feb;

--now this returns what is not unique
SELECT * EXCLUDE(sale_date) FROM synthetic.sales_jan
INTERSECT
SELECT * EXCLUDE(sale_date) FROM synthetic.sales_feb;

--Except Everithing that is in A, but remove everything that also is in B
SELECT product_name, amount FROM synthetic.sales_jan
EXCEPT
SELECT product_name, amount FROM synthetic.sales_feb;


CREATE TABLE IF NOT EXISTS sales AS(
VALUES()
)

CREATE TABLE IF NOT EXISTS database.sql (
		id INTEGER DEFAULT nextval('id_sql_sequence'),
		word STRING,
		description STRING
	);