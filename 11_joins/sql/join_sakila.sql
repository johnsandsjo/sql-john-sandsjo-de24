SELECT * FROM main.film f;
SELECT * FROM main.film_actor fa ;
SELECT * FROM main.actor a;


--which actor played in which film_id?
SELECT 
	a.first_name,
	a.last_name,
	fa.film_id
FROM
	main.actor a
LEFT JOIN
	main.film_actor fa 
ON a.actor_id = fa.actor_id;


--which actor played in which film? 3 WAY JOIN
SELECT 
	a.first_name,
	a.last_name,
	f.title
FROM
	main.actor a
LEFT JOIN
	main.film_actor fa 
ON a.actor_id = fa.actor_id
LEFT JOIN main.film f 
ON fa.film_id = f.film_id;


--film and category
SELECT * FROM main.film_category fc;
SELECT * FROM main.category c;

SELECT
	f.title,
	c.name AS genre
FROM
	main.category c
LEFT JOIN main.film_category fc 
ON c.category_id = fc.category_id
LEFT JOIN main.film f 
ON fc.film_id = f.film_id;


DESC;
--staff, address, city, country
SELECT * FROM main.staff s;
SELECT * FROM main.address a;
SELECT * FROM main.city c;
SELECT * FROM main.country co;

-- ONLY TYPING JOIN IS EQUAL TO LEFT JOINS

SELECT
	s.first_name,
	s.last_name,
	a.address,
	c.city,
	co.country 
FROM 
	main.staff s
LEFT JOIN
	main.address a
ON s.address_id = a.address_id
LEFT JOIN main.city c 
ON a.city_id = c.city_id
LEFT JOIN main.country co
ON c.country_id = co.country_id;


--All actors starring in a film starting with an A
WITH ft AS(
SELECT 
	f.film_id,
	f.title,
	fa.actor_id as actor_id
FROM
	main.film f
LEFT JOIN main.film_actor fa 
ON
	f.film_id = fa.film_id
WHERE
	f.title LIKE 'A%'
)
SELECT
	ft.film_id as film_id,
	ft.title,
	a.first_name,
	a.last_name
FROM
	ft
LEFT JOIN main.actor a 
ON
	ft.actor_id = a.actor_id
ORDER BY
	title;
