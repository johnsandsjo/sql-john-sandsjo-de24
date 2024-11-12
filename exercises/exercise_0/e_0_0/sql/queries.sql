SELECT * FROM main.data_course;

SELECT * FROM main.data_course WHERE content_type = 'exercise';

SELECT * FROM main.data_course WHERE content_type = 'lecture';

--  Select all records for week 48
SELECT * FROM main.data_course WHERE week = 48;

--Select all records for week 47-49
SELECT * FROM main.data_course WHERE week > 46 AND week < 50;

--How many lectures are in the table?
SELECT count(content) FROM main.data_course WHERE content_type = 'lecture';

--How many other content are there?
SELECT count(content) FROM main.data_course WHERE content_type != 'lecture';

--Which are the unique content types in this table?
SELECT DISTINCT content_type FROM main.data_course
