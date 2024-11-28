--a) Describe all tables.

desc;

DESC TABLE main.film;
DESC TABLE main.film_list;
DESC TABLE main.film_text;
DESC TABLE main.rental;
DESC TABLE main.category;
DESC TABLE main.film_list;
DESC TABLE main.customer;
DESC TABLE main.customer_list;
DESC TABLE main.inventory;
DESC TABLE main.store;
SELECT * FROM main.film f;
SELECT * FROM main.film_list fl;
SELECT * FROM main.rental r;
SELECT * FROM main.customer c ;
SELECT * FROM main.customer_list cl;
SELECT * FROM main.inventory;
SELECT * FROM main.payment p;
SELECT * FROM main.sales_by_store sbs;
SELECT * FROM main.store s ;



--b) Select all data on all tables.

--c) Find out how many rows there are in each table.
SELECT COUNT(*) FROM main.film;
SELECT COUNT(DISTINCT title) FROM main.film;

SELECT COUNT(*) FROM main.actor;
SELECT COUNT(DISTINCT actor_id) FROM main.actor;

--d) Calculate descriptive statistics on film length.
WITH FilmLenghts as (
SELECT 
	title,
	CASE 
		WHEN length > 0 AND LENGTH < 120 THEN 'Up to 2 hours'
		WHEN length > 120 AND LENGTH < 160 THEN '3 hours' ELSE 'More than 3 hours'
	END AS length_classifier,
	rating
FROM main.film)
SELECT 
	length_classifier,
	COUNT(*) as num_films
FROM FilmLenghts
GROUP BY length_classifier;

--e) What are the peak rental times?
--which hour has most rentals?
SELECT 
	EXTRACT(HOUR FROM rental_date) AS HOUR,
	count(*) AS num_hour
FROM main.rental r
GROUP BY HOUR
ORDER BY num_hour DESC;

SELECT 
	hour(rental_date) AS hour,
	count(*) AS num_rentals
FROM main.rental
GROUP BY hour
ORDER BY num_rentals DESC;


--which weekday has most rentals?
WITH week_rental AS (
SELECT 
	DAYOFWEEK(rental_date) AS day_of_week,
	HOUR(rental_date) AS hour
FROM main.rental)
SELECT 
	CASE
		WHEN week_rental.day_of_week = 0 THEN 'Sunday'
		WHEN week_rental.day_of_week = 1 THEN 'Monday'
		WHEN week_rental.day_of_week = 2 THEN 'Tuesday'
		WHEN week_rental.day_of_week = 3 THEN 'Wednesday'
		WHEN week_rental.day_of_week = 4 THEN 'Thursday'
		WHEN week_rental.day_of_week = 5 THEN 'Friday'
		WHEN week_rental.day_of_week = 6 THEN 'Saturday'
	END AS weekday,
	COUNT(*) AS quant_day,
FROM week_rental
GROUP BY day_of_week
ORDER BY quant_day DESC;


--which weekday and hour has most rentals?
WITH week_rental AS (
SELECT 
	DAYOFWEEK(rental_date) AS day_of_week,
	HOUR(rental_date) AS hour
FROM main.rental)
SELECT 
	CASE
		WHEN week_rental.day_of_week = 0 THEN 'Sunday'
		WHEN week_rental.day_of_week = 1 THEN 'Monday'
		WHEN week_rental.day_of_week = 2 THEN 'Tuesday'
		WHEN week_rental.day_of_week = 3 THEN 'Wednasday'
		WHEN week_rental.day_of_week = 4 THEN 'Thursday'
		WHEN week_rental.day_of_week = 5 THEN 'Friday'
		WHEN week_rental.day_of_week = 6 THEN 'Saturday'
	END AS weekday,
	week_rental.HOUR,
	COUNT(*) AS num_of_rentals
FROM week_rental
GROUP BY day_of_week, HOUR
ORDER BY num_of_rentals DESC;
 

--f) What is the distribution of film ratings?
SELECT 
	rating, 
	COUNT(*) AS num_of_films
FROM main.film
GROUP BY rating
ORDER BY num_of_films;


--g) Who are the top 10 customers by number of rentals?
SELECT 
	cl.name, 
	COUNT(*) AS num_of_rentals
FROM main.rental r 
LEFT JOIN main.customer_list cl 
ON r.customer_id = cl.ID 
GROUP BY cl.name
ORDER BY num_of_rentals DESC
LIMIT 10;

--h) Retrieve a list of all customers and what films they have rented.
SELECT 
	r.customer_id,
	cl.name,
	f.title 
FROM main.rental r
LEFT JOIN main.customer_list cl
ON r.customer_id = cl.id
LEFT JOIN main.inventory i 
ON r.inventory_id = i.inventory_id
LEFT JOIN main.film f 
ON f.film_id = i.film_id
ORDER BY customer_id;

--i) Make a more extensive EDA of your choice on the Sakila database.