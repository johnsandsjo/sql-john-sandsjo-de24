CREATE TABLE IF NOT EXISTS DATA_JOBS AS(
    SELECT * FROM read_csv_auto('data/salaries.csv')
)