--here we are doing some transformations
CREATE SCHEMA IF NOT EXISTS refined;

CREATE TABLE IF NOT EXISTS refined.sql_glossary AS(
SELECT
	upper(trim(sql_word)) AS sql_word,
	regexp_replace(trim(description),' +',' ','g'),
	lower(regexp_replace(trim(example),' +', ' ', 'g'))
FROM
	staging.sql_glossary);

SELECT * FROM refined.sql_glossary;
