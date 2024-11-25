--kasta tärning med random function
SELECT *
FROM generate_series(10); --spec for DuckDB

SELECT 
	RANDOM()
FROM 
	generate_series(10);


SELECT
	FLOOR(RANDOM()*6)+1 as dices
FROM 
	generate_series(10);
	
--date (temporal betyder tid. Så datum och tid)
SELECT *
FROM generate_series(DATE '2024-11-01', DATE '2024-11-30', INTERVAL 1 DAY)