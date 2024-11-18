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
	experience_level = 'Entry Level';

SELECT
	experience_level , MEDIAN(salary_in_usd) AS median_salary_usd
FROM
	main.DATA_JOBS dj
GROUP BY
	experience_level;


SELECT
	job_title , MEDIAN(salary_in_usd) as median_salary, ROUND(MEDIAN(salary_in_usd) /12*11,-1) as median_salary_monthly_sek
FROM
	main.DATA_JOBS dj
	WHERE job_title in('Data Product Manager','Product Manager', 'Data Engineer')
	GROUP BY job_title
	ORDER BY median_salary_monthly_sek DESC;