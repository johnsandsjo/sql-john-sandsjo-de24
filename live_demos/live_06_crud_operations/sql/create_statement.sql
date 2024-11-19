--DDL Data Defintion Language
--skapat schema i denna databas
CREATE SCHEMA IF NOT EXISTS database;

--här kan vi se att den existerar
SELECT * FROM information_schema.schemata;

--OLTP detta är ej det

--skapat en sekvens för att skapa IDn
CREATE SEQUENCE IF NOT EXISTS id_duckdb_sequence START 1;

--kolla vilka sequnces vi har
SELECT * FROM pg_catalog.pg_sequences;

--nu kan vi skapa tabellen i databasen
--denna hamnar inte under schemat main, utan under database
CREATE TABLE IF NOT EXISTS database.duckdb (
	id INTEGER DEFAULT nextval('id_duckdb_sequence'),
	word STRING,
	description STRING
);