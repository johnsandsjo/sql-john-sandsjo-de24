desc;


--film tabel
SELECT * FROM main.film;
DESC TABLE main.film;


--Actors
SELECT * FROM main.actor;
SELECT * FROM main.film_actor;

SELECT * FROM main.actor WHERE last_name LIKE 'BER%';

--Category
SELECT * FROM main.category;
SELECT * FROM main.film_category;

--customer
SELECT
	'customer' as type,
	c.first_name,
	last_name
FROM
	main.customer c
WHERE
	first_name LIKE 'D%';
