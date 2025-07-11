/*
===============================================================================
DDL Script: Create Silver Table
===============================================================================
Script Purpose:
    This script creates table in the 'silver' schema, dropping existing table 
    if it already exists.
	  Run this script to re-define the DDL structure of 'silver' Table
===============================================================================
*/


DROP TABLE IF EXISTS silver.Kaggle_sample_sales;

	CREATE TABLE silver.kaggle_sample_sales (
	ORDERNUMBER			INT,
	QUANTITYORDERED		INT,
	PRICEEACH			FLOAT,
	ORDERLINENUMBER		INT,
	SALES				FLOAT,
	ORDERDATE			DATE,
	STATUS				VARCHAR(50),
	QTR_ID				INT,
	MONTH_ID			INT,
	YEAR_ID				INT,
	PRODUCTLINE			VARCHAR(50),
	MSRP				FLOAT,
	PRODUCTCODE			VARCHAR(50),
	CUSTOMERNAME		VARCHAR(50),
	PHONE				VARCHAR(50),
	ADDRESSLINE1		VARCHAR(50),
	ADDRESSLINE2	    VARCHAR(50),
	CITY				VARCHAR(50),
	STATE				VARCHAR(50),
	POSTALCODE			VARCHAR(50),
	COUNTRY				VARCHAR(50),
	TERRITORY			VARCHAR(50),
	CONTACTLASTNAME		VARCHAR(50),
	CONTACTFIRSTNAME	VARCHAR(50),
	DEALSIZE			VARCHAR(50)
);
