SELECT * FROM main.film_list fl;
SELECT * FROM main.rental r;
SELECT * FROM main.payment p ;

SELECT * FROM main.customer;
SELECT * FROM main.address;
SELECT * FROM main.country c ;
SELECT * FROM main.city ;

SELECT
	hour(rental_date) AS hour,
	COUNT(*)
FROM 
	main.rental
GROUP BY hour
ORDER BY hour DESC;


SELECT 'actor', first_name, last_name 
FROM main.actor
WHERE last_name LIKE 'G%'
UNION
SELECT 'customer', first_name, last_name
FROM main.customer
WHERE customer.last_name LIKE 'G%';

WITH allAnns AS (SELECT 'actor' as role, first_name, last_name 
FROM main.actor
WHERE first_name LIKE 'ANN%'
UNION
SELECT 'customer' as role, first_name, last_name
FROM main.customer
WHERE customer.first_name LIKE 'ANN%')
SELECT role, count(*) FROM allAnns GROUP BY role;

SELECT customer_id, first_name, last_name, c2.city, c3.country 
FROM main.customer c
LEFT JOIN main.address a 
ON c.address_id = a.address_id
LEFT JOIN main.city c2 
ON a.city_id = c2.city_id 
LEFT JOIN main.country c3
ON c2.country_id = c3.country_id
WHERE first_name LIKE 'J%' AND last_name LIKE 'D%';


--Intermediate Exercises:
--Complex Joins and Aggregations:
--Find the top 5 customers who have rented the most expensive films.
With top_exp_cust AS (SELECT 
	customer_id, SUM(amount) as sum
FROM main.payment p
GROUP BY customer_id
ORDER BY sum DESC
LIMIT 5)
SELECT c.first_name, c.last_name, sum
FROM top_exp_cust
LEFT JOIN main.customer c 
ON top_exp_cust.customer_id = c.customer_id
ORDER BY sum DESC;
 
--Determine the average rental duration for films in each category.
SELECT * FROM main.category c ;

SELECT
	fl.category,
	SUM(day(return_date - rental_date)+ROUND(hour(return_date - rental_date)/24)) || ' days' as rental_time
FROM main.rental r
LEFT JOIN main.inventory i
USING(inventory_id)
LEFT JOIN main.film_list fl
ON i.film_id  = fl.FID
GROUP BY category
ORDER BY rental_time DESC;

--Identify the most profitable film category based on total rental revenue.
SELECT 
	fl.category,
	ROUND(SUM(amount)) AS total_revenu
FROM main.payment p
LEFT JOIN main.rental r 
ON p.rental_id = r.rental_id
LEFT JOIN main.film_list fl 
ON r.inventory_id = fl.FID
GROUP BY category
ORDER BY total_revenu DESC;

--Date and Time Manipulation:
--Find the number of rentals per month for the year 2005.
SELECT 
	month(rental_date) as month,
	COUNT(*) as rental_month
FROM 
	main.rental r
WHERE year(rental_date) = 2005
GROUP BY MONTH;

--Calculate the average rental duration for films rented on weekends.
SELECT 
	AVG(day(return_date-rental_date) + round(hour(return_date-rental_date)/24)) as avg_rental_time
FROM 
	main.rental r
WHERE weekday(rental_date) = 6 OR weekday(rental_date) = 0

--Determine the busiest rental day of the week.
SELECT 
	weekday(rental_date) AS day_of_week,
	COUNT(rental_id) as rental_day
FROM 
	main.rental r
GROUP BY day_of_week
ORDER BY rental_day DESC;

--Conditional Aggregations:
--Calculate the total revenue generated by rentals that lasted longer than the average rental duration.
SELECT
	sum(amount)
FROM main.rental r
LEFT JOIN main.payment p 
ON r.rental_id = p.rental_id
WHERE day(return_date-rental_date) + round(hour(return_date-rental_date)/24) > (
SELECT 
	AVG(day(return_date-rental_date) + round(hour(return_date-rental_date)/24)) as avg_rental_time
FROM 
	main.rental r
	);

--Find the number of customers who have rented more than 10 films and spent more than $100.
WITH quant_cust AS (SELECT
	customer_id,
	count(rental_id) as num_rentals
FROM main.rental r
GROUP BY customer_id
HAVING num_rentals > 20
ORDER BY num_rentals DESC),
spend_cust AS (SELECT 
	customer_id, SUM(amount) as sum
FROM main.payment p
GROUP BY customer_id
HAVING sum > 100
ORDER BY sum DESC)
SELECT 
	COUNT(DISTINCT quant_cust.customer_id) big_spenders
FROM quant_cust
LEFT JOIN spend_cust
ON quant_cust.customer_id = spend_cust.customer_id;


--Advanced Exercises:
--Recursive Queries:
--Create a hierarchical query to find all child categories of a given category.
--Calculate the total rental revenue for each film category, including subcategories.

--Window Functions:
--Rank films by their total rental revenue, partitioning by category.
--FEEEEL
with dataSet AS (
SELECT title, SUM(amount) as total_revenue
FROM main.film_list fl
LEFT JOIN main.rental r 
ON fl.FID = r.inventory_id
LEFT JOIN main.payment p
ON p.rental_id = r.rental_id
GROUP BY title)
SELECT 
	fl.title,
	category,
	total_revenue,
	RANK() OVER (PARTITION BY category ORDER BY total_revenue DESC) AS category_rank
FROM dataSet
LEFT JOIN main.film_list fl
ON dataSet.title = fl.title
ORDER BY category_rank;


--Calculate the running total of rental revenue over time.

--Common Table Expressions (CTEs):
--Use CTEs to find the top 5 customers who have rented the most expensive films in a single query.
--Calculate the average rental duration for each film category, using CTEs to break down the calculations into smaller steps.
--Complex Joins:
--
--Join multiple tables to find the most rented film in each category.
--Determine the customer who has spent the most money on rentals.
--Conditional Aggregation with Multiple Conditions:
--
--Find the number of rentals for each film category, categorized by whether the rental was late or on time.
--Calculate the average rental duration for films that were rented more than 5 times.
--Self-Joins:
--
--Find all pairs of customers who have rented the same film.
--Identify films that have been rented by more than one customer on the same day.
--Performance Optimization:
--
--Write efficient SQL queries to retrieve large datasets.
--Use indexes to improve query performance.
--Analyze query execution plans to identify bottlenecks and optimize queries.