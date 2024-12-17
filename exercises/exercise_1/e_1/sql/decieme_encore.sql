CREATE TABLE IF NOT EXISTS cleaned_salaries_2 AS (
    SELECT * FROM read_csv_auto('../data/salaries.csv')
)