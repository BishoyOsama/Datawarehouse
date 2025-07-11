# 🧊 Sample Sales Analytics Project (Medallion Architecture + Power BI)

This repository contains a complete data analytics pipeline for analyzing sales data using the **Medallion Architecture** (Bronze → Silver → Gold) and visualizing insights using **Power BI**.

---

## 🗺️ Project Overview

This project demonstrates:
- Ingesting raw sales CSV data (Bronze layer)
- Cleaning and transforming data (Silver layer)
- Aggregating for business use cases (Gold layer)
- Delivering actionable insights via **Power BI** reports

---

## 🏛️ Architecture: Medallion Layers

### 🟤 Bronze Layer
- **Purpose**: Store raw ingested data with minimal processing.
- **Source**: Sales data CSV files (e.g., `kaggle_sample_sales.csv`)
- **Tables**: `bronze.raw_sales`

### ⚪ Silver Layer
- **Purpose**: Cleaned and transformed data for modeling and exploration.
- **Transformations**:
  - Standardized date formats
  - Casted data types
  - Removed invalid/missing records
  - Added surrogate keys for dimensions

- **Tables**:
  - `silver.kaggle_sample_sales`

### 🟡 Gold Layer
- **Purpose**: Business-ready data marts for reporting.
  
- **Tables**:
  - `gold.Fact_Sales`
  - `gold.Dim_Customer`
  - `gold.Dim_Product`

---

## 🧱 Tech Stack

| Layer        | Tools Used                        |
|-------------|-----------------------------------|
| Ingestion    | Python / SQL COPY  |
| Storage      | PostgreSQL  |
| Processing   | SQL (CTEs, Views, Procedures)     |
| Reporting    | Power BI                          |

---
