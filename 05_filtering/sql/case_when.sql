SELECT * FROM main.data_jobs;

SELECT
	CASE
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'EN' THEN 'Entry Level'
		WHEN experience_level = 'MI' THEN 'Mid Level'
		WHEN experience_level = 'EX' THEN 'Expert'
	END AS experience_level, * EXCLUDE(experience_level)
	FROM main.data_jobs;

UPDATE main.data_jobs 
SET experience_level = CASE
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'EN' THEN 'Entry Level'
		WHEN experience_level = 'MI' THEN 'Mid Level'
		WHEN experience_level = 'EX' THEN 'Expert'
		ELSE experience_level --Preserve existing VALUES IF NO match
	END;
	WHERE experience_level IN ('SE', 'MI', 'EN', 'EX');

--make sure to add ELSE and WHERE here so that we do not over write.

	
SELECT DISTINCT experience_level FROM main.DATA_JOBS;