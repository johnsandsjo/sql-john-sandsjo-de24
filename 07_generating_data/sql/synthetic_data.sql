SELECT UNNEST (generate_series(1,100)) as id;

SELECT RANDOM();

SELECT FLOOR(RANDOM()*6+1) as dice FROM generate_series(1,100);
--to store this in a database I need to do create table etc.

SELECT 	UNNEST (generate_series(100)) as id,
		'student_' || id AS student,
		ROUND(RANDOM()*100) AS score;
		
CREATE TABLE IF NOT EXISTS student_scores AS(
	SELECT
		id, 
		'student_' || id AS student, 
		score,
		CASE 
			WHEN score<50 THEN 'F'
			WHEN score<75 THEN 'G'
			ELSE 'VG'
		END AS grade
		FROM
		(
		SELECT
			UNNEST (generate_series(100)) as id,
			ROUND(RANDOM()*100) AS score
			));
			
		
		