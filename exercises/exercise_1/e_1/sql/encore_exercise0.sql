SELECT * FROM main.encore_salaries;
SELECT * FROM information_schema.tables;


--a) Transform employment type column based on this table
--b) Do similar for company size, but you have to figure out what the abbreviations could stand for.
SELECT DISTINCT company_size FROM main.encore_salaries;

CREATE TABLE IF NOT EXISTS encore_salaries_cleaned AS(
SELECT
	CASE 
		WHEN employment_type = 'CT' THEN 'Contract'
		WHEN employment_type = 'FL' THEN 'Freelance'
		WHEN employment_type = 'PT' THEN 'Part time'
		WHEN employment_type = 'FT' THEN 'Full time'
	END as employment_type,
	CASE 
		WHEN company_size = 'S' THEN 'Small'
		WHEN company_size= 'M' THEN 'Mid'
		WHEN company_size = 'L' THEN 'Large'
	END as company_size, * EXCLUDE(employment_type, company_size)
FROM main.encore_salaries);

SELECT * FROM main.encore_salaries_cleaned;

--c) Make a salary column with Swedish currency for yearly salary.
ALTER TABLE main.encore_salaries_cleaned
ADD COLUMN salary_in_sek FLOAT;

UPDATE main.encore_salaries_cleaned
	SET salary_in_sek = salary_in_usd*11


--d) Make a salary column with Swedish currency for monthly salary.
ALTER TABLE main.encore_salaries_cleaned
ADD COLUMN salary_in_sek_monthly FLOAT;

UPDATE main.encore_salaries_cleaned
	SET salary_in_sek_monthly = ROUND(salary_in_sek/12)
	
--HERE I realised I should create the tabel when I'm ready. Above I started with it
	-- so I will drop the tabel and do it again.
	
DROP TABLE main.encore_salaries_cleaned;
	
--Starting over -->
--a) Transform employment type column based on this table
--b) Do similar for company size, but you have to figure out what the abbreviations could stand for.
SELECT
	CASE 
		WHEN employment_type = 'CT' THEN 'Contract'
		WHEN employment_type = 'FL' THEN 'Freelance'
		WHEN employment_type = 'PT' THEN 'Part time'
		WHEN employment_type = 'FT' THEN 'Full time'
	END as employment_type,
	CASE 
		WHEN company_size = 'S' THEN 'Small'
		WHEN company_size= 'M' THEN 'Mid'
		WHEN company_size = 'L' THEN 'Large'
	END as company_size, * EXCLUDE(employment_type, company_size)
FROM main.encore_salaries;

--c) Make a salary column with Swedish currency for yearly salary.
SELECT salary_in_usd*11 as salary_annual_sek
FROM main.encore_salaries;


--d) Make a salary column with Swedish currency for monthly salary.
SELECT ROUND(salary_in_usd*11/12) as salary_monthly_sek , *
FROM main.encore_salaries;
	
-- e) Make a salary_level column with the following categories: 
--low, medium, high, insanely_high. Decide your thresholds for each category. 
--Make it base on the monthly salary in SEK.
SELECT 
	ROUND(salary_in_usd*11/12) as salary_monthly_sek,
	CASE
		WHEN salary_monthly_sek < 45000 THEN 'low'
		WHEN salary_monthly_sek >= 45000 AND salary_monthly_sek < 77000 THEN 'medium'
		WHEN salary_monthly_sek >= 77000 AND salary_monthly_sek< 95000 THEN 'high'
		WHEN salary_monthly_sek > 95000 THEN 'insanely_high'
	END AS salary_level, *
FROM main.encore_salaries;
	

 --f) Choose the following columns to include in your table: 
 --experience_level, employment_type, job_title, salary_annual_sek, salary_monthly_sek, 
 --remote_ratio, company_size, salary_level
CREATE TABLE IF NOT EXISTS encore_salaries_cleaned AS(
SELECT
	CASE 
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'MI' THEN 'Mid Level'
		WHEN experience_level = 'EX' THEN 'Expert'
		WHEN experience_level = 'EN' THEN 'Entry Level'
	END AS experience_level,	
	CASE 
		WHEN employment_type = 'CT' THEN 'Contract'
		WHEN employment_type = 'FL' THEN 'Freelance'
		WHEN employment_type = 'PT' THEN 'Part time'
		WHEN employment_type = 'FT' THEN 'Full time'
	END as employment_type,
	job_title,
	salary_in_usd*11 as salary_annual_sek,
	ROUND(salary_in_usd*11/12) as salary_monthly_sek, 
	remote_ratio,
		CASE 
		WHEN company_size = 'S' THEN 'Small'
		WHEN company_size= 'M' THEN 'Mid'
		WHEN company_size = 'L' THEN 'Large'
	END as company_size,
	CASE
		WHEN salary_monthly_sek < 45000 THEN 'low'
		WHEN salary_monthly_sek >= 45000 AND salary_monthly_sek < 77000 THEN 'medium'
		WHEN salary_monthly_sek >= 77000 AND salary_monthly_sek< 95000 THEN 'high'
		WHEN salary_monthly_sek > 95000 THEN 'insanely_high'
	END AS salary_level
FROM main.encore_salaries);

SELECT * FROM main.encore_salaries_cleaned;

SUMMARIZE main.encore_salaries_cleaned;