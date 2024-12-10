SELECT *
FROM information_schema.schemata;

SELECT *
FROM information_schema.tables;

SELECT * FROM staging.sql_glossary;

CREATE SCHEMA IF NOT EXISTS refined_3;


CREATE TABLE IF NOT EXISTS refined_3.sql_words_now_cleaned AS (
SELECT
	TRIM(UPPER(regexp_replace(sql_word, ' +', ' ', 'g'))) as sql_word_cleaned,
	TRIM(LOWER(regexp_replace(description, ' +', ' ', 'g'))) as desc_cleaned,
	TRIM(LOWER(regexp_replace(example, ' +', ' ', 'g'))) as example_cleaned
FROM 
	staging.sql_glossary);

SELECT * FROM refined_3.sql_words_now_cleaned;


--lite joins å set
CREATE TABLE IF NOT EXISTS refined_3.dummy1 AS (
SELECT * 
FROM (VALUES
	(1, 'Liz', 'Hurley'),
	(2, 'Leo', 'Vegas'), 
	(3, 'Bo', 'Yeltzin'), 
	(4, 'Mona', 'Lisa')) AS t(id, first_name, last_name)
);

CREATE TABLE IF NOT EXISTS refined_3.dummy2 AS (
SELECT * 
FROM (VALUES
	(3, 'Liz', 'Hurley'),
	(4, 'Leo', 'Vegas'), 
	(5, 'Kat', 'Svenson'), 
	(6, 'Dora', 'Neson')) AS dum_dum(id, first_name, last_name)
);

SELECT first_name, last_name FROM refined_3.dummy1
EXCEPT
SELECT first_name, last_name FROM refined_3.dummy2 d;

SELECT 
FROM refined_3.dummy1 d 
INNER JOIN refined_3.dummy2 d2 
ON d.first_name = d2.first_name 