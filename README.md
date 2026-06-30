## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
* **Data Sources:** Import data from two source systems (ERP and CRM) provided as CSV files.
* **Data Quality:** Cleanse and resolve data quality issues prior to analysis.
* **Integration:** Combine both sources into a single, user-friendly data model designed for analytical queries.
* **Scope:** Focus on the latest dataset only; historization of data is not required.
* **Documentation:** Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

### BI: Analytics & Reporting (Data Analytics)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:

* **Customer Behavior:** Analyze purchasing patterns, demographics, and geographic distribution to identify key customer segments.
* **Product Performance:** Evaluate sales volume, revenue generation, and profit margins across different product categories and subcategories.
* **Sales Trends:** Track sales performance over time (monthly, quarterly, yearly) to identify seasonal patterns and growth trends.

## 🏗️ Data Architecture

The data architecture for this project follows the **Medallion Architecture**, which organizes data into three distinct layers to ensure quality, reliability, and structured progression:

* **Bronze Layer (Raw Data):** Drops the landing data straight from the source systems (ERP and CRM CSV files) into raw SQL tables without transformations.
* **Silver Layer (Cleaned & Standardized Data):** Performs data cleansing, handles missing values, standardizes data types, and resolves structural inconsistencies.
* **Gold Layer (Business-Ready Data):** Transforms silver data into optimized **dimension tables** and **fact tables** using a star schema, specifically designed to drive BI dashboards and analytics.


