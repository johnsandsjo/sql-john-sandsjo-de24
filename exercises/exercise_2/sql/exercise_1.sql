--1. Cleaning malformed text data

--Continue working on the data from lecture 09_strings. 
--In this lecture you created a schema called staging and 
--ingested the raw data into the staging schema.

--a) Create a schema called refined. This is the schema where you'll put the transformed data.
--I am creating refined_2
CREATE SCHEMA IF NOT EXISTS refined_2;
SELECT * FROM information_schema.schemata;
SELECT * FROM information_schema.tables;



--b) Now transform and clean the data and place the cleaned table inside the refined schema.
SELECT * FROM strings.staging.sql_glossary;

SELECT regexp_replace(example,' '(?=';'), ';', 'g') FROM strings.staging.sql_glossary;

CREATE TABLE IF NOT EXISTS refined_2.cleaned_sql_glossary AS (
SELECT 	UPPER(trim(sql_word)) as sql_word ,
		regexp_replace(trim(description), 
					' +', 
					' ', 
					'g') AS description,
					regexp_replace(lower(trim(example)),' +',' ','g') as example,
FROM 
	strings.staging.sql_glossary);


--New take on this to polish the example column even more. 
--Using CTEs
WITH cleaned_sql_words AS(
SELECT 	UPPER(trim(sql_word)) as sql_word ,
		regexp_replace(trim(description), 
					' +', 
					' ', 
					'g') AS description,
					regexp_replace(lower(trim(example)),' +',' ','g') as example,
FROM 
	strings.staging.sql_glossary)
SELECT sql_word, description, regexp_replace(lower(trim(example)),' ;',';','g') as example,
FROM cleaned_sql_words;



--c) Practice filtering and searching for different keywords in different columns.
-- Discuss with a friend why this could be useful in this case.
SELECT * FROM refined_2.cleaned_sql_glossary WHERE description LIKE '%Combines%';

