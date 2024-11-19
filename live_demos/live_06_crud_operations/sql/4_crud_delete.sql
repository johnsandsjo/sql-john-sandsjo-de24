--DML Data Manipulation Language
SELECT * FROM database.duckdb;

SELECT * FROM database.duckdb WHERE id IN (5,8);

SELECT * FROM database.duckdb WHERE word IN ('TIMESTAMPZ','DROP SCHEMA');

DELETE FROM database.duckdb
WHERE word IN ('TIMESTAMPTZ','DROP SCHEMA');


CREATE TABLE IF NOT EXISTS database.sql(
		word STRING,
		description STRING);
	
CREATE SCHEMA IF NOT EXISTS programming; 

CREATE TABLE IF NOT EXISTS programming.python (
word STRING,
	description STRING);

CREATE TABLE IF NOT EXISTS programming.c_sharp (
word STRING,
description STRING);