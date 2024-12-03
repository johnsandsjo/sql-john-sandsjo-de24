DESC;

SELECT * FROM main.film;

--Q: Which actors played in which movies?
SELECT 
	a.first_name, 
	a.last_name,
	f.title 
FROM 
	main.film f 
LEFT JOIN
	main.film_actor fa 
ON f.film_id = fa.film_id
LEFT JOIN
	main.actor a
ON fa.actor_id = a.actor_id 
ORDER BY title;

SELECT 
	a.first_name, 
	a.last_name,
	COUNT(*)
FROM 
	main.film f 
LEFT JOIN
	main.film_actor fa 
ON f.film_id = fa.film_id
LEFT JOIN
	main.actor a
ON fa.actor_id = a.actor_id 
GROUP BY last_name, first_name ;