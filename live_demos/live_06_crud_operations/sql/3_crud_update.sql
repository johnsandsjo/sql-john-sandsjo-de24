--Update

--do select before update to make sure what we update
SELECT word, learnt FROM database.duckdb 
WHERE id IN (1,9,11);

--update
UPDATE database.duckdb SET learnt = TRUE
WHERE ID IN (1,9,11);