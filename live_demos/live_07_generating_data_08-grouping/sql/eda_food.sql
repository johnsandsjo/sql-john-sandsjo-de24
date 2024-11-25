--exploratory data analysis
SELECT * FROM main.food;

SELECT DISTINCT id as food FROM main.food;

--135,025 id:s
SELECT COUNT(*) FROM main.food;

DESC main.food;


SELECT 
	*
FROM 
	main.food
WHERE 
	week_id BETWEEN '2004-01' AND '2004-10';