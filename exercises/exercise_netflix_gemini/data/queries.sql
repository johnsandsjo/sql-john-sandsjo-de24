SELECT * FROM main.netflix_gemini;
--Intermediate:
--What are the top 5 most common movie genres in the dataset?
SELECT
	age_certification,
	count(*) AS count
from
	main.netflix_gemini
GROUP BY
	age_certification
ORDER BY
	count DESC;

--How many movies and shows were released each year between 2010 and 2020?
SELECT
	release_year ,
	count(*) AS count
from
	main.netflix_gemini
GROUP BY
	release_year 
HAVING release_year BETWEEN 2010 AND 2020
ORDER BY
	release_year;

--What is the average runtime of movies and the average runtime of shows?
SELECT
	type,
	round(AVG(runtime)) AS avg_runtime
from
	main.netflix_gemini
GROUP BY
	type;

--List the titles of movies released after 2015 that have an IMDB score greater than 8.0 and are longer than 2 hours.
SELECT
	title,
	release_year,
	imdb_score,
	runtime
FROM
	main.netflix_gemini
WHERE
	release_year > 2015
	AND (imdb_score > 8
		OR runtime > 120)
		
--Which age certification is most common for movies with an IMDB score below 6.0?
SELECT
	age_certification,
	count(*) AS count
FROM
	main.netflix_gemini
WHERE imdb_score < 6
GROUP BY
	age_certification
ORDER BY
	count DESC;


--Advanced:
--For each age certification rating, what's the average IMDB score of movies released after 2000?
SELECT
	age_certification,
	AVG(imdb_score) AS avg_imdb_score
from
	main.netflix_gemini
WHERE release_year > 2000
GROUP BY
	age_certification;

--Identify the years with the highest total combined IMDB votes for both movies and shows, order descending.
SELECT
	release_year,
	sum(imdb_votes) as sum
FROM
	main.netflix_gemini
GROUP BY
	release_year 
ORDER BY sum DESC;

--For movies released after 2010, calculate the percentile ranking of 'Taxi Driver' based on its IMDB score.
--Find the top 3 directors with the highest average IMDB score for their movies, considering only movies released after 1990 and having at least 10,000 IMDB votes. 
--Identify movies and shows with descriptions that contain more than two mentions of a specific word (e.g., "love"). 