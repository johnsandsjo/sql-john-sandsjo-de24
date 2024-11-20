--EDA = exploratory data analysis
SELECT * from main.food;

SELECT DISTINCT id FROM main.food food;

SELECT
	COUNT(DISTINCT id)
FROM
	main.food food;
	
SELECT COUNT(*) AS number_rows FROM main.food;

DESC main.food;

SELECT * FROM main.food WHERE week_id BETWEEN '2005%' AND '2006%';