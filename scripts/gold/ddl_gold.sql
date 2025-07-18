/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- ============================================================================
-- Create Dimension table: Dim_Customer
-- ============================================================================
CREATE OR REPLACE VIEW gold.Dim_Customer AS
SELECT 
	ROW_NUMBER() OVER(ORDER BY CONCAT(CONTACTFIRSTNAME,' ',CONTACTLASTNAME), PHONE, ADDRESSLINE1) AS customerid,
	CUSTOMERNAME AS company,
	CONCAT(CONTACTFIRSTNAME, ' ', CONTACTLASTNAME) AS contactfullname,
	PHONE AS phone,
	ADDRESSLINE1 AS addressline1,
	ADDRESSLINE2 AS addressline2,
	CITY AS city,
	STATE AS state,
	COUNTRY AS country,
	TERRITORY AS territory,
	POSTALCODE AS postalcode
FROM silver.kaggle_sample_sales
GROUP BY company, contactfullname, phone, addressline1, addressline2, city, state, country, territory, postalcode

-- ============================================================================
-- Create Dimension table: Dim_Product
-- ============================================================================
CREATE OR REPLACE VIEW gold.Dim_Product AS
SELECT 
	PRODUCTCODE AS productcode,
	PRODUCTLINE AS productline,
	MSRP AS msrp
FROM silver.kaggle_sample_sales
GROUP BY productcode, productline, msrp

-- ============================================================================
-- Create Fact table: Fact_Sales
-- ============================================================================
CREATE OR REPLACE VIEW gold.Fact_Sales AS
SELECT
	ORDERNUMBER AS ordernumber,
	QUANTITYORDERED AS quantity,
	PRICEEACH AS priceperitem,
	SALES AS sales,
	ORDERLINENUMBER AS orderlinenumber,
	ORDERDATE AS orderdate,
	DEALSIZE AS dealsize,
	STATUS AS status,
	QTR_ID AS quarter,
	MONTH_ID AS month,
	YEAR_ID AS year,
	PRODUCTCODE AS productcode,
	cs.customerid
FROM silver.kaggle_sample_sales kg
LEFT JOIN gold.Dim_Customer cs
ON  cs.contactfullname = CONCAT(kg.CONTACTFIRSTNAME,' ', kg.CONTACTLASTNAME)
AND cs.phone = kg.PHONE
AND cs.addressline1 = kg.ADDRESSLINE1

