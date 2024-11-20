--INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
--VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

SELECT 42;

VALUES (1), (2), (3);

CREATE TABLE IF NOT EXISTS encore_people_records AS (
SELECT 
	* 
FROM 
	(
VALUES 	(1, 'John'),
		(2, 'Johanna'),
		(3, 'Lottie')) AS t(id, name));
		
desc;

SELECT * FROM encore_people_records;