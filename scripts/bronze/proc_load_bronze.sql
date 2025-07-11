/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV file. 
    It performs the following actions:
    - Truncates the bronze table before loading data.
    - Uses the `COPY` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    CALL bronze.load_bronze();
===============================================================================
*/


CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE 
	start_time TIMESTAMP; 
	end_time TIMESTAMP; 
	batch_start_time TIMESTAMP; 
	batch_end_time TIMESTAMP;
BEGIN
	batch_start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Loading the bronze layer';
	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Truncate Table: bronze.kaggle_sample_sales';
	
	TRUNCATE TABLE bronze.kaggle_sample_sales;
	RAISE NOTICE 'Inserting Data Into: bronze.kaggle_sample_sales';
	
	COPY bronze.kaggle_sample_sales
	FROM 'C:\sql\sales_data_sample.csv'
	WITH(
	FORMAT csv,
	HEADER true
	);
	
	end_time := CURRENT_TIMESTAMP;
	batch_end_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Load bronze.kaggle_sample_sales Duration: % seconds', EXTRACT(EPOCH FROM(end_time - start_time));
	RAISE NOTICE 'Overall Duration: % seconds', EXTRACT(EPOCH FROM(batch_end_time - batch_start_time));
END
$$




