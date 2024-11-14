--AND
SELECT 
	job_title, 
	experience_level,
	(10.68*salary_in_usd)/12 as salary_sek_month
FROM
	main.DATA_JOBS dj
WHERE 
	(salary_sek_month > 200000) 
	AND (salary_sek_month < 500000)
ORDER BY salary_sek_month DESC;

--BETWEEN .. AND STATEMENTS
SELECT 
	job_title, 
	experience_level,
	(10.68*salary_in_usd)/12 as salary_sek_month
FROM
	main.DATA_JOBS dj
WHERE 
	salary_sek_month BETWEEN 200000 AND 500000
ORDER BY salary_sek_month DESC;

--OR
SELECT
	count(*)
FROM
	main.DATA_JOBS dj
WHERE
	experience_level = 'Senior'
	or experience_level = 'Expert';

--NOT
SELECT
	count(*)
FROM
	main.DATA_JOBS dj
WHERE
	NOT (experience_level = 'Senior'
	or experience_level = 'Expert');