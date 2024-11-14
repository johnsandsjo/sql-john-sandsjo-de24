--IN OPERATOR for list filter
SELECT
	DISTINCT COUNT(*)
FROM
	main.DATA_JOBS dj
WHERE
	company_size IN ('M', 'S');
	
SELECT
	DISTINCT COUNT(*)
FROM
	main.DATA_JOBS dj
WHERE
	company_size NOT IN ('M', 'S');
	
--FILTER clause
SELECT
	count(*) as total_jobs,
	count(*) FILTER( WHERE remote_ratio = 100) AS remote_jobs,
	round(remote_jobs / total_jobs * 100,2) as percent_remote_jobs
FROM
	main.DATA_JOBS dj ;
	
--OFFSET skips the rows
SELECT * FROM main.DATA_JOBS dj OFFSET 6;