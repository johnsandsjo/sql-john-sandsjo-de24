SELECT * FROM information_schema.tables;
SELECT * FROM main.encore_salaries_cleaned;
--a) Count number of Data engineers jobs. For simplicity just go for job_title Data Engineer.
SELECT COUNT(job_title) FROM main.encore_salaries_cleaned
WHERE job_title  = 'Data Engineer';

--b) Count number of unique job titles in total.
SELECT COUNT(DISTINCT job_title) FROM main.encore_salaries_cleaned;

--c) Find out how many jobs that goes into each salary level.
SELECT
	salary_level,
	COUNT(job_title)
FROM
	main.encore_salaries_cleaned
GROUP BY
	salary_level;

--d) Find out the median and mean salaries for each seniority levels.
SELECT
	experience_level,
	MEDIAN(salary_monthly_sek) AS median_salary,
	ROUND(AVG(salary_monthly_sek)) AS mean_salary
FROM
	main.encore_salaries_cleaned
GROUP BY
	experience_level;

--e) Find out the top earning job titles based on their median salaries and how much they earn.
SELECT
	job_title,
	MEDIAN(salary_monthly_sek) AS median_salary,
	MAX(salary_monthly_sek) AS max_salary 
FROM
	main.encore_salaries_cleaned
GROUP BY
	job_title
ORDER BY median_salary DESC;

-- now using HAVING in order to remove the job title with few occurances to not mess up the median
SELECT
	job_title,
	MEDIAN(salary_monthly_sek) AS median_salary,
	MAX(salary_monthly_sek) AS max_salary 
FROM
	main.encore_salaries_cleaned
GROUP BY
	job_title
HAVING COUNT(*) > 100
ORDER BY median_salary DESC;


--f) How many percentage of the jobs are fully remote, 50 percent remote and fully not remote.
WITH TotalJobs AS (
	SELECT
		COUNT(*) as total_jobs
	FROM
		main.encore_salaries_cleaned
)
SELECT
	remote_ratio,
	ROUND(COUNT(*) / (SELECT total_jobs FROM TotalJobs)*100) AS per_cent_remote,
	COUNT(*) AS num_remote_ratio,
FROM
	main.encore_salaries_cleaned
GROUP BY
	remote_ratio;

--g) Pick out a job title of interest and figure out if company size affects the salary. 
--Make a simple analysis as a comprehensive one requires causality investigations which are much harder to find.
SELECT company_size, ROUND(AVG(salary_monthly_sek)) AS mean_salary
FROM main.encore_salaries_cleaned
WHERE job_title = 'Data Engineer'
GROUP BY company_size;

--h) Feel free to explore other things
--how many jobs per title
SELECT job_title, COUNT(job_title) as num_jobs
FROM main.encore_salaries_cleaned
GROUP BY job_title
ORDER BY num_jobs DESC;