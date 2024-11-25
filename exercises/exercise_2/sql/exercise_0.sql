--0. Dice rolls simulations

-- a) Generate 10 rows of dice rolls data
SELECT FLOOR(RANDOM()*6)+1 FROM generate_series(9);

--  b) Calculate the average of getting a six
WITH DiceRolls AS(
SELECT FLOOR(RANDOM()*6)+1 AS dice_roll FROM generate_series(9)
)
SELECT 
		AVG(CASE WHEN dice_roll = 6 THEN 1 ELSE 0 END) AS percent_sixes
FROM DiceRolls;

--  c) Generate 100 rows of dice rolls and calculate average of getting a six
WITH DiceRolls AS(
SELECT FLOOR(RANDOM()*6)+1 AS dice_roll FROM generate_series(99)
)
SELECT 
		AVG(CASE WHEN dice_roll = 6 THEN 1 ELSE 0 END)*100 AS percent_sixes
FROM DiceRolls;

--Här är två grejer som är bra att lära sig. 
--1 Först ska jag ta average på 100 kastade tärningar. Då skapar jag först 100 kastade 
--tärningar i en sub query och sen en enkel ny query som querar den skapade sub querien
--2 Sedan är det ett intressant sätt att använda CASE WHEN something THEN 1 ELSE 0


--  d) Repeat the experiment with 1000, 10000, 100000, 1000000 rolls.
WITH DiceRolls AS(
SELECT FLOOR(RANDOM()*6)+1 AS dice_roll FROM generate_series(1000)
)
SELECT 
		AVG(CASE WHEN dice_roll = 6 THEN 1 ELSE 0 END)*100 AS percent_sixes
FROM DiceRolls;

WITH DiceRolls AS(
SELECT FLOOR(RANDOM()*6)+1 AS dice_roll FROM generate_series(10000)
)
SELECT 
		AVG(CASE WHEN dice_roll = 6 THEN 1 ELSE 0 END)*100 AS percent_sixes
FROM DiceRolls;

WITH DiceRolls AS(
SELECT FLOOR(RANDOM()*6)+1 AS dice_roll FROM generate_series(100000)
)
SELECT 
		AVG(CASE WHEN dice_roll = 6 THEN 1 ELSE 0 END)*100 AS percent_sixes
FROM DiceRolls;

WITH DiceRolls AS(
SELECT FLOOR(RANDOM()*6)+1 AS dice_roll FROM generate_series(1000000)
)
SELECT 
		AVG(CASE WHEN dice_roll = 6 THEN 1 ELSE 0 END)*100 AS percent_sixes
FROM DiceRolls;

--  e) What is the theoretical mean?






--ENCOREEE
--a) Generate 10 rows of dice rolls data
SELECT FLOOR(RANDOM()*6+1) AS dices FROM generate_series(10);

--b) Calculate the average of getting a six
WITH RolledDiced AS (
SELECT FLOOR(RANDOM()*6+1) AS dices FROM generate_series(10))
SELECT AVG(CASE WHEN dices = 6 THEN 1 ELSE 0 END)*100 AS percent_rolled_dice
FROM RolledDiced;

--c) Generate 100 rows of dice rolls and calculate average of getting a six
WITH RolledDiced AS (
SELECT FLOOR(RANDOM()*6+1) AS dices FROM generate_series(100))
SELECT AVG(CASE WHEN dices = 6 THEN 1 ELSE 0 END)*100 AS percent_rolled_dice
FROM RolledDiced;