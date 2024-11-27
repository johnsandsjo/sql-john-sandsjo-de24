--a) Describe all tables.

desc;

DESC TABLE main.film;
DESC TABLE main.film_list;
DESC TABLE main.film_text;
DESC TABLE main.rental;
DESC TABLE main.category;
DESC TABLE main.film_list;
SELECT * FROM main.film f;
SELECT * FROM main.film_list fl;
SELECT * FROM main.rental r;
SELECT * FROM main.customer c ;
SELECT * FROM main.customer_list cl ;


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

--which weekday has most rentals?
WITH week_rental AS (
SELECT 
	EXTRACT(DAYOFWEEK FROM rental_date) AS day_of_week,
	EXTRACT(HOUR FROM rental_date) AS hour
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

--which weekday and hour has most rentals? THIS IS MOST LIKELY WRONG!
WITH week_rental AS (
SELECT 
	EXTRACT(DAYOFWEEK FROM rental_date) AS day_of_week,
	EXTRACT(HOUR FROM rental_date) AS hour
FROM main.rental)
SELECT 
	CASE
		WHEN week_rental.day_of_week = 0 THEN 'SUNDAY'
		WHEN week_rental.day_of_week = 1 THEN 'MONDAY'
		WHEN week_rental.day_of_week = 2 THEN 'TUESDAY'
		WHEN week_rental.day_of_week = 3 THEN 'WEDNESDAY'
		WHEN week_rental.day_of_week = 4 THEN 'THURSDAY'
		WHEN week_rental.day_of_week = 5 THEN 'FRIDAY'
		WHEN week_rental.day_of_week = 6 THEN 'SATURDAY'
	END AS weekday,
	HOUR
	COUNT(*) AS quant_day,
	COUNT(*) AS num_hour
FROM week_rental
GROUP BY day_of_week, hour
ORDER BY quant_day DESC;
 

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
ORDER BY num_of_rentals DESC;

--h) Retrieve a list of all customers and what films they have rented.

--i) Make a more extensive EDA of your choice on the Sakila database.