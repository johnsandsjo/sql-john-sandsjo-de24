SELECT * FROM main.DATA_JOBS dj ;

SELECT
	CASE 
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'MI' THEN 'Mid Level'
		WHEN experience_level = 'EN' THEN 'Entry Level'
		WHEN experience_level = 'EX' THEN 'Expert'
	END AS expereince_level, * EXCLUDE(experience_level)
FROM
	main.DATA_JOBS dj ;
	
UPDATE main.DATA_JOBS 
SET 
	experience_level = CASE 
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'MI' THEN 'Mid Level'
		WHEN experience_level = 'EN' THEN 'Entry Level'
		WHEN experience_level = 'EX' THEN 'Expert'
	END;
	
SELECT DISTINCT experience_level FROM main.DATA_JOBS dj ;
