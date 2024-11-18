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


 
