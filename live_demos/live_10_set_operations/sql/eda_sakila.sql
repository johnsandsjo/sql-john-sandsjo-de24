DESC;

SELECT * FROM main.film;

DESC TABLE main.film;

--update ratings to Swedish ratings
SELECT DISTINCT rating FROM main.film;

ALTER TABLE main.film ADD COLUMN swe_rating STRING;

CREATE TABLE main.film_swe AS (
	SELECT * FROM main.film
);

SELECT * FROM main.film_swe;

ALTER TABLE main.film_swe ADD COLUMN swe_rating STRING;


---
SELECT 'CUSTOMER' AS type, c.first_name, c.last_name FROM main.customer c WHERE c.first_name LIKE 'A%'
UNION ALL
SELECT 'ACTOR' AS type, a.first_name, a.last_name FROM main.actor a WHERE a.first_name LIKE 'A%';

SELECT c.first_name, c.last_name FROM main.customer c
INTERSECT
SELECT a.first_name, a.last_name FROM main.actor a;


SELECT da(payment_date) FROM main.payment p 

SELECT timestamp(payment_date) FROM main.payment p;

EXTRACT(MINUTE, FROM );


