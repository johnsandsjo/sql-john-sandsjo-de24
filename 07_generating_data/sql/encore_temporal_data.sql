CREATE TABLE IF NOT EXISTS date_generation_2 AS (
SELECT
	*
FROM
	generate_series(
			DATE '2024-11-01',
			DATE '2024-11-30',
			INTERVAL '1 day'
			) AS t(november));
			
		
SELECT * FROM information_schema.tables;
SELECT * FROM main.date_generation_2;

DROP TABLE main.date_generation;

--date dimention
--strftime 	-> Converts a date to a string according to the format string.
SELECT
	STRFTIME(date_series, '%Y-%m-%d') as date,
	month(date_series) as month,
	week(date_series) as week_nr,
	weekday(date_series) as day_of_week
FROM
	generate_series(
			DATE '2025-1-1',
			DATE '2025-12-31',
			INTERVAL '1 day'
			) AS t(date_series);
			
-- synthetic sales data		
SELECT
	'customer_' || order_id AS customer_name,
	DATE '2024-01-01' + (order_id-1) * INTERVAL '1 day' AS order_date,
	ROUND(RANDOM() * 1000,
	2) AS order_amount,
	CASE
		WHEN RANDOM() < 0.7 THEN 'completed'
		WHEN RANDOM() < 0.9 THEN 'pending'
		ELSE 'cancelled'
	END AS order_status
FROM
	(
	SELECT
		UNNEST (generate_series(1,
		100)) AS order_id
);