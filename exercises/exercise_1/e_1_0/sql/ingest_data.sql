CREATE TABLE 
    IF NOT EXISTS salaries AS (
        SELECT * 
        FROM read_csv_auto('data/salaries.csv')
    );