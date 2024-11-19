--DDL Data Defintion Language
ALTER TABLE database.duckdb 
ADD COLUMN learnt BOOLEAN DEFAULT FALSE;

--Rename
ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;

--change column name
ALTER TABLE table_name DROP COLUMN column_name;