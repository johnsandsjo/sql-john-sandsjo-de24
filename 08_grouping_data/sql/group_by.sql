SELECT * FROM main.cleaned_food;

SELECT
	food,
	SUM(number_searches) as total_searches
FROM
	main.cleaned_food
GROUP BY
	food
ORDER BY total_searches DESC
LIMIT 10;

SELECT
	year,
	SUM(number_searches) as total_searches
FROM
	main.cleaned_food
GROUP BY
	year
ORDER BY total_searches DESC

SELECT DISTINCT year from main.cleaned_food
ORDER BY year DESC;

SELECT 
	year,
	SUM(number_searches) as total_searches
FROM main.cleaned_food
GROUP BY year
HAVING total_searches > 300000
ORDER BY total_searches DESC;
