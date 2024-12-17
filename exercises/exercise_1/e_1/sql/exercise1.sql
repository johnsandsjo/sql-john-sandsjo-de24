--1. Explore your transformed table
SELECT * FROM main.cleaned_salaries;

--a) Count number of Data engineers jobs. For simplicity just go for job_title Data Engineer.
SELECT job_title, COUNT(job_title) as num_jobs
FROM main.cleaned_salaries
WHERE job_title = 'Data Engineer'
GROUP BY job_title;

SELECT job_title, COUNT(job_title) as num_jobs
FROM main.cleaned_salaries
GROUP BY job_title 
ORDER BY num_jobs DESC;

--b) Count number of unique job titles in total.
SELECT COUNT(DISTINCT job_title)
FROM main.cleaned_salaries

--c) Find out how many jobs that goes into each salary level.
SELECT salary_level, count(*)
FROM main.cleaned_salaries
GROUP BY salary_level

--d) Find out the median and mean salaries for each seniority levels.
SELECT experience_level , MEDIAN(salary_in_sek_month), ROUND(AVG(salary_in_sek_month))
FROM main.cleaned_salaries
GROUP BY experience_level ;

--f) How many percentage of the jobs are fully remote, 50 percent remote and fully not remote.
SELECT DISTINCT remote_ratio
FROM main.cleaned_salaries;

--my solution
SELECT remote_ratio, COUNT(*) AS job_count, round(job_count/(SELECT COUNT(*) FROM main.cleaned_salaries)*100,2) as per_cent_remote
FROM main.cleaned_salaries
GROUP BY remote_ratio;

--solution using Common Table Expressions (CTEs)
WITH JobCounts AS (
  SELECT remote_ratio, COUNT(*) AS job_count
  FROM main.cleaned_salaries
  GROUP BY remote_ratio
)
SELECT 
  remote_ratio, 
  job_count, 
  (job_count / (SELECT COUNT(*) FROM main.cleaned_salaries)) * 100 AS percentage
FROM 
  JobCounts;
 
--g) Pick out a job title of interest and figure out if company size affects the salary. 
--Make a simple analysis as a comprehensive one requires causality investigations which are much harder to find.
 SELECT company_size, MEDIAN(salary_in_sek_month) 
 FROM main.cleaned_salaries cs 
 WHERE job_title = 'Data Engineer'
 GROUP BY company_size 


 
 
 
 --f) How many percentage of the jobs are fully remote, 50 percent remote and fully not remote.
SELECT
	remote_ratio,
	count(*) as num_jobs,
	round(count(*) / (SELECT COUNT(*) FROM main.cleaned_salaries cs)*100,2) as percent_of_jobs
FROM main.cleaned_salaries
GROUP BY remote_ratio




CREATE TABLE IF NOT EXISTS main.cleaned_salaries3 AS (
SELECT 
	experience_level,
	CASE 
	WHEN employment_type = 'FT' THEN 'Full Time'
	WHEN employment_type = 'CT' THEN 'Contract'
	WHEN employment_type = 'PT' THEN 'Part Time'
	WHEN employment_type = 'FL' THEN 'Freelance'
	ELSE employment_type 
	END as employment_type,
	job_title,
	salary_in_usd* 10.92 as salary_annual_sek,
	(salary_in_usd* 10.92/12) as salary_monthly_se,
	remote_ratio,
	CASE 
	WHEN company_size = 'M' THEN 'Medium'
	WHEN company_size = 'S' THEN 'Small'
	WHEN company_size = 'PT' THEN 'Large'
	ELSE company_size 
	END as company_size,
	CASE 
		WHEN salary_monthly_se < 60000 THEN 'low'
		WHEN salary_monthly_se < 80000 THEN 'medium'
		WHEN salary_monthly_se < 110000 THEN 'high'
		WHEN salary_monthly_se > 110000 THEN 'insanely_high'
	END AS salary_level
FROM cleaned_salaries_2);
 

SELECT * FROM cleaned_salaries3;

SELECT 
	remote_ratio,
	COUNT(*) as num_jobs,
	ROUND(num_jobs/(SELECT COUNT(*) FROM main.cleaned_salaries3)*100,2) AS num_jobs_percent
FROM main.cleaned_salaries3
GROUP BY remote_ratio;
