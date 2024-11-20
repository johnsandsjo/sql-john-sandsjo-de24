SELECT UNNEST(generate_series(1,100)) as id;


SELECT FLOOR(RANDOM()*6+1) as dice
FROM UNNEST(generate_series(1,10));


SELECT 
	UNNEST(generate_series(1,100)) as id, 
	'student_' || id as tudent_id,
	ROUND(RANDOM()*100) as score;
	

--From Gemini: By using a subquery, the query efficiently generates a temporary dataset 
--and then processes it to assign grades, providing a clear and concise solution.
SELECT
	id, 'student_' || id as student_id, score,
	CASE
		WHEN score <50 THEN 'F'
		WHEN score < 75 THEN 'P'
		WHEN score < 90 THEN 'B'
		ELSE 'A' 
	END AS grade, 
FROM (
--This subquery below effectively creates a temporary dataset of 100 students with random scores.
SELECT 	UNNEST(generate_series(1,100)) as id, ROUND(RANDOM()*100) as score);