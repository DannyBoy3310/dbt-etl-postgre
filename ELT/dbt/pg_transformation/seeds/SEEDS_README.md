
# DBT Seeds

DBT seeds are basically static CSV files which contain data to be loaded into the target database as tables.

Scenario 1:

You have a CSV file named HISTORICAL_DATA.csv which contains historical data to be loaded before the batch ETL starts. In such a case, this HISTORICAL_DATA.csv file will be placed in the seeds/ folder and triggered.

How to run dbt seed:
1. Place the csv file in seeds/ folder.
2. Run `dbt seed` to load all CSV data into target (or) run `dbt seed --select filename_w/o_fileformat`.
  
  