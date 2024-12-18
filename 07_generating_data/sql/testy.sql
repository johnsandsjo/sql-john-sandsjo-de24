SELECT * FROM information_schema.schemata;
SELECT * FROM information_schema.tables;

CREATE TABLE IF NOT EXISTS main.enrollment (
		enrollment_id INTEGER,
		student_id INTEGER,
		program_id INTEGER
	);

INSERT INTO
	main.enrollment (enrollment_id, student_id, program_id)
VALUES
		(1, 1, 1),
		(2, 2, 2),
		(3, 3, 3),
		(4, 4, 1),
		(5, 5, 5),
		(6, 6, 3),
		(7, 7, 5);

SELECT * FROM main.enrollment e; 


CREATE TABLE IF NOT EXISTS main.programs (
		program_id INTEGER,
		program_name STRING
	);

DROP TABLE main.programs;

INSERT INTO
	main.programs (program_id, program_name)
VALUES
		(1, 'Data Engineer'),
		(2, 'AI'),
		(3, 'Java'),
		(4, '.NET'),
		(5, 'Frontend');

SELECT * FROM main.programs; 




SELECT 
    p.program_name as program_name, COUNT(e.student_id) as number_students
FROM
    main.programs p
LEFT JOIN 
    main.enrollment e 
ON p.program_id = e.program_id
GROUP BY p.program_name
HAVING number_students >0;