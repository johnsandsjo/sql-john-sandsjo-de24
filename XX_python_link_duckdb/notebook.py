# %%
import pandas as pd
import glob
import time
import duckdb
# %%
# connection to my db. 
# connect() creates an in-memory database
# if want to persist the name. pass the name of the db
conn = duckdb.connect("my_new_db.duckdb")
# for read only if I already have a db:
# conn = duckdb.connect("mydb.db", read_only=True)
# %%
# in order to query my db, I need to use method execute from connection
# takes a sql statement as an argument
df = conn.execute("""
        SELECT * 
        FROM 'data/*.csv'
             """).df()
print(df)
# %%
conn.register("df_view", df)
conn.execute("DESCRIBE df_view").df()
# %%
conn.execute("SELECT COUNT(*) FROM df").df()
# %%
df.isnull().sum()
# %%
conn.execute("""SELECT * FROM information_schema.tables""").df()
# %%
conn.execute("""SELECT 'Leverantör', 'Belopp exkl moms' FROM main.df_view""").df()
# %%
df1 = conn.execute("""
        SELECT * 
        FROM read_csv_auto('data/*.csv', header=True)
             """).df()
print(df1)
# %%
conn.register("df_view1", df)
conn.execute("DESCRIBE df_view").df()
# %%
conn.execute('SELECT "Belopp exkl moms" FROM df').df()
# %%
df2 = conn.execute("""
        SELECT * 
        FROM read_csv_auto('data/*.csv', header = True, union_by_name=true)
             """).df()
print(df2)
# %%
conn.register("df_view2", df)
conn.execute("DESCRIBE df_view2").df()
# %%
conn.execute('SELECT "Belopp exkl moms" FROM df_view2').df()
# %%
conn.execute("DROP VIEW main.df_view1")
# %%
conn.execute("DROP VIEW main.df_view2")
# %%
conn.execute("""FROM supplier_invoice""").df()
# %%
conn.execute('''CREATE TABLE IF NOT EXISTS supplier_invoice AS (
             SELECT 
                Leverantör,
                Organisationsnummer,
                Konto, 
                "Belopp exkl moms" FROM df)''').df()
# %%
conn.close()
# %%
