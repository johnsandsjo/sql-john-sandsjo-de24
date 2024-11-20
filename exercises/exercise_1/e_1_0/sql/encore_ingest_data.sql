CREATE TABLE 
    IF NOT EXISTS encore_salaries AS (
    SELECT * FROM read_csv_auto('data/salaries.csv')
);