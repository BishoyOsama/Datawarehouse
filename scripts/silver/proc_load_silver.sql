
/* 
	TO EXECUTE THE STORED PROCEDURE FOR bronze layer run:
	CALL silver.load_silver();
*/


CREATE OR REPLACE PROCEDURE silver.load_silver()
LANGUAGE plpgsql
AS $$
DECLARE 
	start_time TIMESTAMP; 
	end_time TIMESTAMP; 
	batch_start_time TIMESTAMP; 
	batch_end_time TIMESTAMP;
BEGIN
	batch_start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Loading the silver layer';
	start_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Truncate Table: silver.kaggle_sample_sales';
	
	TRUNCATE TABLE silver.kaggle_sample_sales;
	RAISE NOTICE 'Inserting Data Into: silver.kaggle_sample_sales';
	
	INSERT INTO silver.kaggle_sample_sales (
		ORDERNUMBER,
		QUANTITYORDERED,
		PRICEEACH,
		ORDERLINENUMBER,
		SALES,
		ORDERDATE,
		STATUS,
		QTR_ID,
		MONTH_ID,
		YEAR_ID,
		PRODUCTLINE,
		MSRP,
		PRODUCTCODE,
		CUSTOMERNAME,
		PHONE,
		ADDRESSLINE1,
		ADDRESSLINE2,
		CITY,
		STATE,
		POSTALCODE,
		COUNTRY,
		TERRITORY,
		CONTACTLASTNAME,
		CONTACTFIRSTNAME,
		DEALSIZE
	)
	SELECT 
		ORDERNUMBER,
		QUANTITYORDERED,
		PRICEEACH,
		ORDERLINENUMBER,
		(QUANTITYORDERED * PRICEEACH) AS SALES,
		ORDERDATE,
		STATUS,
		QTR_ID,
		MONTH_ID,
		YEAR_ID,
		PRODUCTLINE,
		MSRP,
		PRODUCTCODE,
		CUSTOMERNAME,
		PHONE,
		ADDRESSLINE1,
		ADDRESSLINE2,
		CITY,
		CASE 
			WHEN UPPER(STATE) = 'PA' THEN 'Pennsylvania'
			WHEN UPPER(STATE) = 'CA' THEN 'California'
			WHEN UPPER(STATE) = 'NH' THEN 'New Hampshire'
			WHEN UPPER(STATE) = 'NV' THEN 'Nevada'
			WHEN UPPER(STATE) = 'NJ' THEN 'New Jersey'
			WHEN UPPER(STATE) = 'NY' THEN 'New York'
			WHEN UPPER(STATE) = 'MA' THEN 'Massachusetts'
			WHEN UPPER(STATE) = 'CT' THEN 'Connecticut'
			WHEN UPPER(STATE) = 'BC' THEN 'British Columbia'
			WHEN UPPER(STATE) = 'BC' THEN 'British Columbia'
			WHEN UPPER(STATE) = 'NSW' THEN 'New South Wales'
			WHEN STATE IS NULL THEN NULL
			ELSE STATE
		END AS STATE,
		POSTALCODE,
		CASE 
			WHEN UPPER(COUNTRY) = 'UK' THEN 'United Kingdom'
			WHEN UPPER(COUNTRY) = 'USA' THEN 'United States of America'
			ELSE COUNTRY
	    END AS COUNTRY,
		TERRITORY,
		CONTACTLASTNAME,
		CONTACTFIRSTNAME,
		DEALSIZE
	FROM bronze.kaggle_sample_sales;
	
	end_time := CURRENT_TIMESTAMP;
	batch_end_time := CURRENT_TIMESTAMP;
	RAISE NOTICE 'Load silver.kaggle_sample_sales Duration: % seconds', EXTRACT(EPOCH FROM(end_time - start_time));
	RAISE NOTICE 'Overall Duration: % seconds', EXTRACT(EPOCH FROM(batch_end_time - batch_start_time));
END
$$





