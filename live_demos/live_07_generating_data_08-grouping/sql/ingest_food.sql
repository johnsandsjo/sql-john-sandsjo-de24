CREATE TABLE IF NOT EXISTS food AS(
    SELECT * FROM read_csv_auto('data/seasonality-values-d2b9a3.csv')
)