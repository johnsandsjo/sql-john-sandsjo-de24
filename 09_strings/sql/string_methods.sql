SELECT * FROM staging.sql_glossary;


--string slicing
SELECT
	sql_word,
	sql_word[:2],
	sql_word[2:5]
FROM
	staging.sql_glossary;
	
--getitem (similar to Python string index)
SELECT
	sql_word,
	sql_word[0],
	sql_word[1],
	sql_word[-1]
FROM
	staging.sql_glossary;
	
--concatination
SELECT 'fun' || ' joke'

SELECT
	'SQL commmand' || sql_word,
FROM
	staging.sql_glossary;
	

--remove spaces
SELECT
	trim(sql_word) as trimmed_word,
	trimmed_word[1],
	trimmed_word[-1],
FROM
	staging.sql_glossary;
	
--upper (can also be done with LOWER)
SELECT
	UPPER(trim(sql_word)) as trimmed_word,
	trimmed_word[1],
	trimmed_word[-1],
FROM
	staging.sql_glossary;
	
--this works ok but it falls short since it might be 
--more than 2 spaces. So then we need to use REGEX
SELECT
	description,
	replace(trim(description), '  ', ' ')
FROM
	staging.sql_glossary;