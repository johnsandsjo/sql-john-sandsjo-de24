--Union on sakila
SELECT
	'Customer' as type,
	c.first_name,
	c.last_name
FROM
	main.customer AS c
WHERE c.first_name LIKE 'A%'
UNION
SELECT
	'Actor' as type,
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE a.first_name LIKE 'A%';


--Intersect on sakila
SELECT
	--'Customer' as type, REMOVING this to get some intersection at all.
	c.first_name,
	c.last_name
FROM
	main.customer AS c
--WHERE c.first_name LIKE 'A%'
INTERSECT
SELECT
	--'Actor' as type,
	a.first_name,
	a.last_name
FROM
	main.actor a
--WHERE a.first_name LIKE 'A%';
	
	
--Union all
SELECT
	--'Customer' as type,
	c.first_name,
	c.last_name
FROM
	main.customer AS c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION ALL
SELECT
	--'Actor' as type,
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';


SELECT
	--'Customer' as type,
	c.first_name,
	c.last_name
FROM
	main.customer AS c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION
SELECT
	--'Actor' as type,
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%';