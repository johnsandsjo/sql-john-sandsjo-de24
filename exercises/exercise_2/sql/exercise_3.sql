--a) Retrieve a list of all customers and actors which last name starts with G.
SELECT 
	'Customer' as role,
	first_name, 
	last_name
FROM 
	main.customer
WHERE 
	last_name LIKE 'G%'
UNION
SELECT  
	'Actor' as role,
	first_name,
	last_name
FROM 
	main.actor a
WHERE 
	last_name LIKE 'G%'
ORDER BY last_name;

--b) How many customers and actors starts have the the letters 'ann' in there first names?
WITH ANNs as (SELECT 
	'Customer' as role,
	first_name, 
	last_name
FROM 
	main.customer
WHERE 
	first_name LIKE 'ANN%'
UNION
SELECT  
	'Actor' as role,
	first_name,
	last_name
FROM 
	main.actor a
WHERE 
	first_name LIKE 'ANN%'
ORDER BY last_name)
SELECT COUNT(*) as num_of_Anns FROM Anns;

--c) In which cities and countries do the customers live in?
SELECT 
	country,
	city,
	COUNT(*) AS num_of_customer
FROM 
	main.customer_list cl
GROUP BY country, city 
ORDER BY num_of_customer DESC;

SELECT 
	count(DISTINCT city)
FROM 
	main.customer_list cl;

--d) In which cities and countries do the customers with initials JD live in?
SELECT 
	c.first_name,
	c.last_name,
	country,
	city,
FROM 
	main.customer_list cl
LEFT JOIN main.customer c 
ON cl.ID = c.customer_id
WHERE first_name LIKE 'J%' AND last_name LIKE 'D%';


--f) What else cool information can you find out with this database using what you know about SQL.


--Highest revenue in one day per store
--max_daily_revenue
SELECT
	DATE_TRUNC('day', payment_date) AS date,
	i.store_id,
    SUM(amount) AS sum
FROM 
    main.payment p 
LEFT JOIN main.rental r 
ON p.rental_id = r.rental_id
LEFT JOIN main.inventory i
ON r.inventory_id = i.inventory_id
GROUP BY 
	date, i.store_id
ORDER BY
	sum DESC;