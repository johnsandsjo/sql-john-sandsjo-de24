SELECT
	AVG(CASE 
		WHEN FLOOR(RANDOM()*6+1) = 6 THEN 1
		ELSE 0 END) AS likelyhood
FROM generate_series(1000)