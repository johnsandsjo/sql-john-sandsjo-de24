SELECT
	regexp_replace(trim(description),
	' +',
	' ', 
	'g') as description_cleaned,
	lower(regexp_replace(trim(example),
	' +',
	' ', 
	'g')) as example_cleaned
FROM
	staging.sql_glossary;

--here we get selects with an s
SELECT * 
FROM staging.sql_glossary 
WHERE lower(description) LIKE '%select%';

--here we only get select and SELECT (becasue of lower)
SELECT * 
FROM staging.sql_glossary 
WHERE 
	regexp_matches(lower(description),'select\b');