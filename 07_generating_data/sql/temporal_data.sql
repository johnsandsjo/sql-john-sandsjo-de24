--time and date
SELECT
	*
FROM
	generate_series(DATE '2024-11-01',
	DATE '2024-11-30',
	INTERVAL '1 day') as t(november);
	
--date dimension
SELECT 
	strftime(date_series,'%Y-%m-%d') as date,
	month(date_series) as month,
	week(date_series) as week_number,
	weekday(date_series) as day_of_week
FROM
	generate_series(DATE '2024-01-01',
	DATE '2024-12-31',
	INTERVAL '1 day') as t(date_series);
