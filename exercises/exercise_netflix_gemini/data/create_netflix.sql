CREATE TABLE IF NOT EXISTS netflix_gemini AS(
    SELECT * FROM read_csv_auto('Netflix_TV_Shows_Movies.csv')
);