--  h) Delete the row with content 02_setup_duckdb and add it again.
--INSERT
--	INTO
--	funny_jokes (id, 
--	joke_text, 
--	rating) 
--VALUES (0, 
--'supah fun joke',
--1);
INSERT INTO main.data_course (content, week, content_type )
	VALUES ('02_setup_duckdb', 46, 'lecture');

--You see that 02_setup_duckdb comes in the end of your table, even though the week is 46. Now make a query where you sort the weeks in ascending order.
SELECT * FROM main.data_course dc ORDER BY week;