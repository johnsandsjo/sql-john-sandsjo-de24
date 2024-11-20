CREATE TABLE 
    IF NOT EXISTS food as (
        SELECT
            * 
        FROM 
        read_csv_auto('data/seasonality-values-d2b9a3.csv')
    );