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
