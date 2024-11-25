--10 most searched food
SELECT * FROM main.food_cleaned;

SELECT
	food,
	sum(number_searches) as searches
FROM
	main.food_cleaned
GROUP BY
	food
ORDER BY searches DESC;
	

--total searches by year
SELECT
	year,
	sum(number_searches) as searches
FROM
	main.food_cleaned
GROUP BY
	year
ORDER BY searches DESC;


SELECT
	year,
	sum(number_searches) as searches
FROM
	main.food_cleaned
GROUP BY
	year
HAVING searches > 300000
ORDER BY searches DESC;


SELECT
	year, 
	food,
	sum(number_searches) as searches
FROM
	main.food_cleaned
GROUP BY
	food, year
ORDER BY searches DESC;

--most popular food in summer
SELECT
	food,
	sum(number_searches) as searches
FROM
	main.food_cleaned
WHERE week BETWEEN '25' AND '35'
GROUP BY
	food
ORDER BY searches DESC;

--most popular food in winter