--id --> food
--remove googleTopic
--create a year column
--week_id -> week
--value -> number_of-searches

CREATE TABLE IF NOT EXISTS main.food_cleaned AS(
SELECT
	id AS food,
	SUBSTRING(week_id, 1, 4) AS year, --funkar även detta i duckdb week_id[:4]
	SUBSTRING(week_id, 6) AS week,
	value AS number_searches
FROM
	main.food);
	
DESC;

SELECT * FROM main.food_cleaned;