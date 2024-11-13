SELECT * FROM main.hemnet;

--Make a wildcard selection to checkout the data
SELECT * FROM main.hemnet
WHERE address LIKE 'He%';

--Find out how many rows there are in the table
SELECT COUNT(*) FROM main.hemnet;

--Describe the table that you have ingested to see the columns and data types.
desc hemnet;
--Find out the 5 most expensive homes sold.
SELECT * 
FROM main.hemnet
ORDER BY final_price DESC
LIMIT 5;
--Find out the 5 cheapest homes sold.
SELECT * 
FROM main.hemnet
ORDER BY final_price
LIMIT 5;
--Find out statistics on minimum, mean, median and maximum prices of homes sold.
SELECT
	MIN(final_price) as minimum_price,
	AVG(final_price) as mean_price,
	MEDIAN(final_price) as median_price,
	MAX(final_price) as maximum_price
FROM main.hemnet;
--Find out statistics on minimum, mean, median and maximum prices of price per area.
SELECT
	MIN(price_per_area) as minimum_price,
	AVG(price_per_area) as mean_price,
	MEDIAN(price_per_area) as median_price,
	MAX(price_per_area) as maximum_price
FROM main.hemnet;
--How many unique communes are represented in the dataset.
SELECT COUNT(DISTINCT commune) FROM main.hemnet;
--How many percentage of homes cost more than 10 million?
SELECT ((SELECT COUNT(*) FROM main.hemnet WHERE final_price > 10000000) / COUNT(*))*100 as share_of_homes FROM main.hemnet;

--Feel free to explore anything else you find interesting in this dataset.
SELECT address, final_price, rooms, ROUND(final_price/rooms) as price_per_room FROM main.hemnet ORDER BY price_per_room DESC;

SELECT
	sale_date,
	asked_price,
	final_price, 
	final_price-asked_price as price_increase_decrease
FROM
	main.hemnet
ORDER BY
	price_increase_decrease DESC
	LIMIT 5;

SELECT
	sale_date,
	asked_price,
	final_price, 
	final_price-asked_price as price_increase_decrease
FROM
	main.hemnet
ORDER BY
	price_increase_decrease
	LIMIT 5;


SELECT commune, round(AVG(price_per_area)) AS avg_price_per_area
FROM main.hemnet
GROUP BY commune
HAVING avg_price_per_area > 100
ORDER BY avg_price_per_area DESC;


SELECT 
    commune, 
    AVG(price_per_area) AS avg_price_per_area
FROM 
    main.hemnet
WHERE 
    area > 100
GROUP BY 
    commune
ORDER BY avg_price_per_area DESC;