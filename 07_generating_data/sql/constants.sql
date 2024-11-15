SELECT 42 AS meaning_of_life;

VALUES (1), (2), (3);

--combine select with values. Could use INSERT as well

CREATE TABLE IF NOT EXISTS people_records AS(
SELECT * FROM (
	VALUES 
	(1, 'John'),
	(2, 'Johanna'),
	(3, 'Lottie')) AS t(id, name));
	
desc;

SELECT * FROM people_records;