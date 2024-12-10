SELECT 
	FLOOR(RANDOM()*6+1) AS dice
FROM
	generate_series(9);


WITH DiceRolls AS (
SELECT
CASE 
	WHEN FLOOR(RANDOM()*6+1) = 6 THEN 1
	ELSE 0
END	AS sixes,
FROM generate_series(9))
SELECT AVG(sixes)* 100 AS percent
FROM DiceRolls;

WITH DiceRolls AS (
SELECT
CASE 
	WHEN FLOOR(RANDOM()*6+1) = 6 THEN 1
	ELSE 0
END	AS sixes,
FROM generate_series(99))
SELECT AVG(sixes)* 100 AS percent
FROM DiceRolls;

WITH DiceRolls AS (
SELECT
CASE 
	WHEN FLOOR(RANDOM()*6+1) = 6 THEN 1
	ELSE 0
END	AS sixes,
FROM generate_series(99999))
SELECT AVG(sixes)* 100 AS percent
FROM DiceRolls;


SELECT
	id,
	'student_' || id AS student,
	score,
	CASE 
		WHEN score < 50 THEN 'F'
		WHEN score < 75 THEN 'G'
		ELSE 'VG'
	END AS grade
FROM 
	(
	-- subquery
	SELECT
		UNNEST (generate_series(1,
		100)) AS id,
		-- concatenation
		ROUND(RANDOM()* 100) AS score);
	
	
SELECT
	'customer_' || order_id AS customer_name,
	DATE '2024-01-01' + (order_id-1) * INTERVAL '1 day' AS order_date,
	ROUND(RANDOM() * 1000, 2) AS order_amount,
	CASE
		WHEN RANDOM() < 0.7 THEN 'completed'
		WHEN RANDOM() < 0.9 THEN 'pending'
		ELSE 'cancelled'
	END AS order_status
FROM
	(
	SELECT
		UNNEST (generate_series(1,
		100)) AS order_id
);

SELECT 
	FLOOR(RANDOM()*6+1) AS dice
FROM generate_series(9);

WITH DiceRolls AS (
	SELECT 
		CASE 
			WHEN FLOOR(RANDOM()*6+1) = 6 THEN 1
			ELSE 0
		END AS sixes
	FROM generate_series(10)
)
SELECT AVG(sixes)*100 percent_sixes
FROM DiceRolls;