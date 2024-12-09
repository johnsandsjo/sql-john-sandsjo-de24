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