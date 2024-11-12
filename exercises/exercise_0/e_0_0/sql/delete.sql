--Delete the row with content 02_setup_duckdb and add it again
--DELETE FROM funny_jokes WHERE rating < 5;
DELETE FROM main.data_course WHERE content = '02_setup_duckdb';
SELECT * FROM main.data_course;
