DESC;

SELECT * FROM main.customer c;
SELECT * FROM main.payment p;
SELECT * FROM main.category c;
SELECT * FROM main.film_category fc ;
 
-- top paying customers
WITH customer_payment AS(
	SELECT 
		customer_id, 
		SUM(amount) as tot_amount
	FROM main.payment p
	GROUP BY customer_id
	ORDER BY tot_amount DESC
)
SELECT 
	c.first_name,
	c.last_name,
	cp.tot_amount
FROM 
	customer_payment cp
LEFT JOIN 	
	main.customer c
ON cp.customer_id = c.customer_id;

--list all films and their category
--place joining inside the CTE BLOCK
WITH film_category AS (
	SELECT
		f.film_id,
		f.title,
		c.name
	FROM main.film f 
INNER JOIN 
	main.film_category fc
	ON f.film_id= fc.film_id
INNER JOIN 
	main.category c 
	ON fc.category_id = c.category_id
)
SELECT * FROM film_category;


-- find number films in each category
WITH film_category AS (
	SELECT
		f.film_id,
		f.title,
		c.name
	FROM main.film f 
INNER JOIN 
	main.film_category fc
	ON f.film_id= fc.film_id
INNER JOIN 
	main.category c 
	ON fc.category_id = c.category_id
)
SELECT
	name, count(title) as num_films
FROM
	film_category
GROUP BY name
ORDER BY num_films DESC;
