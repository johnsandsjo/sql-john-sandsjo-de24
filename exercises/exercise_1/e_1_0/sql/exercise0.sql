SELECT * from cleaned_salaries;

SELECT 
	CASE 
		WHEN employment_type = 'CT' THEN 'Contract'
		WHEN employment_type = 'FL' THEN 'Freelance'
		WHEN employment_type = 'PT' THEN 'Part time'
		WHEN employment_type = 'FT' THEN 'Full time'
	END AS employment_type, * EXCLUDE(employment_type)
FROM cleaned_salaries;

--  a) Transform employment type column based on this table
UPDATE cleaned_salaries
	SET employment_type = CASE
		WHEN employment_type = 'CT' THEN 'Contract'
		WHEN employment_type = 'FL' THEN 'Freelance'
		WHEN employment_type = 'PT' THEN 'Part time'
		WHEN employment_type = 'FT' THEN 'Full time'
		ELSE employment_type 
	END
	WHERE employment_type IN ('CT', 'FL', 'PT', 'FT');

SELECT distinct employment_type from cleaned_salaries;

--  b) Do similar for company size, but you have to figure out what the abbreviations could stand for.
UPDATE cleaned_salaries
	SET company_size = CASE
		WHEN company_size = 'S' THEN 'Small'
		WHEN company_size = 'M' THEN 'Medium'
		WHEN company_size = 'L' THEN 'Large'
		ELSE company_size 
	END
	WHERE company_size IN ('S', 'M', 'L');

--do the same for experience level
UPDATE cleaned_salaries
	SET experience_level = CASE
		WHEN experience_level = 'SE' THEN 'Senior'
		WHEN experience_level = 'MI' THEN 'Mid Level'
		WHEN experience_level = 'EX' THEN 'Expert'
		WHEN experience_level = 'EN' THEN 'Entry level'
		ELSE experience_level 
	END
	WHERE experience_level IN ('SE', 'MI', 'EX', 'EN');

SELECT distinct experience_level from cleaned_salaries;

--  c) Make a salary column with Swedish currency for yearly salary.
SELECT salary_in_usd, salary_in_usd*11.01 as salary_in_sek
FROM main.cleaned_salaries;

--d) Make a salary column with Swedish currency for monthly salary.
SELECT ROUND(salary_in_usd*11.01/12) as salary_in_sek
FROM main.cleaned_salaries;
--update
ALTER TABLE main.cleaned_salaries 
ADD COLUMN salary_in_sek DECIMAL(10,2);
UPDATE main.cleaned_salaries 
	SET salary_in_sek = ROUND(salary_in_usd *11/12);

ALTER TABLE main.cleaned_salaries
RENAME COLUMN salary_in_sek TO salary_in_sek_month;

SELECT * FROM main.cleaned_salaries;

--e) Make a salary_level column with the following categories: low, medium, high, insanely_high. Decide your thresholds for each category. Make it base on the monthly salary in SEK.
SELECT median(salary_in_sek_month) employment_type FROM main.cleaned_salaries;

ALTER TABLE main.cleaned_salaries
ADD COLUMN salary_level VARCHAR(255);

SELECT 
	CASE 
		WHEN salary_in_sek_month < 50000 THEN 'low'
		WHEN salary_in_sek_month < 75000 THEN 'medium'
		WHEN salary_in_sek_month < 98000 THEN 'high'
		WHEN salary_in_sek_month >= 98000 THEN 'insanely_high'
	END AS salary_level, salary_in_sek_month
FROM main.cleaned_salaries;


UPDATE main.cleaned_salaries
SET salary_level = 
	CASE
		WHEN salary_in_sek_month <= 50000 THEN 'low'
		WHEN salary_in_sek_month > 50000 AND salary_in_sek_month < 75000 THEN 'medium'
		WHEN salary_in_sek_month >= 75000 AND salary_in_sek_month < 98000 THEN 'high'
		ELSE 'insanely_high' 
	END;

-- f) Choose the following columns to include in your table: 
--experience_level, employment_type, job_title, salary_annual_sek, 
--salary_monthly_sek, remote_ratio, company_size, salary_level

SELECT experience_level, employment_type, job_title, salary_in_sek_month, remote_ratio, company_size, salary_level
FROM main.cleaned_salaries;


