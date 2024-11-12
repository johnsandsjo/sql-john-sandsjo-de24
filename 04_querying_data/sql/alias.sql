SELECT
	DISTINCT salary_currency as unique_currencies
FROM
	main.data_jobs;
	

SELECT
	count(DISTINCT salary_currency) as number_currencies
FROM
	main.data_jobs;
	
SELECT
	count(DISTINCT salary_currency) number_currencies
FROM
	main.data_jobs;