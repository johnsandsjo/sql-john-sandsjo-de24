SELECT * FROM main.food;

CREATE TABLE IF NOT EXISTS cleaned_food AS (
SELECT
	id as food,
	week_id as week,
	SUBSTRING(week, 1, 4) as year,
	value as number_searches
FROM
	main.food
	); 
	
SELECT * FROM main.cleaned_food;

ALTER TABLE main.cleaned_food 
RENAME COLUMN yearoooo TO year; 