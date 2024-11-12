CREATE TABLE IF NOT EXISTS data_course AS (
    SELECT * FROM read_csv_auto('data/course_data_john.csv')
)