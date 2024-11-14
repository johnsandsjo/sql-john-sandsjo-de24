SELECT * FROM main.DATA_JOBS;

SELECT
	COUNT(*) AS jobs_lower_than_50k
FROM
	main.DATA_JOBS dj
WHERE
	salary_in_usd < 50000;
	
SELECT
	*
FROM
	main.DATA_JOBS dj
WHERE
	experience_level = 'EN';

SELECT
	MEDIAN(salary_in_usd) AS median_salary_usd
FROM
	main.DATA_JOBS dj
WHERE
	experience_level = 'EN';

SELECT
	experience_level , MEDIAN(salary_in_usd) AS median_salary_usd
FROM
	main.DATA_JOBS dj
GROUP BY
	experience_level;
