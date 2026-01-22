# E-Commerce Data Pipeline: API to Snowflake BI
A full-stack Data Engineering project that extracts retail product data from an external API, loads it into a Snowflake Data Warehouse, transforms it using SQL (Medallion Architecture), and visualizes insights in Looker Studio.

## Tech Stack
Language: Python (Requests, Pandas)<br>
Data Warehouse: Snowflake<br>
Transformation: SQL (Views & Tables)<br>
BI Tool: Looker Studio<br>
Infrastructure: Medallion Architecture (Raw > Staging > Mart)<br>

## The Data Pipeline
1. Extraction & Ingestion (Python)<br>
Data is fetched from a REST API containing product and category information.Using Python,<br>
 the JSON response is normalized and loaded into the RAW_DATA schema in Snowflake.<br>
3. Transformation (Snowflake SQL)<br>
I implemented a Medallion Architecture to ensure data quality:<br>
Bronze (RAW_DATA): The source data in its original state.<br>
Silver (STAGING): Views created to handle type casting (Price to Decimal, Timestamps)<br>
and standardizing case-sensitive API column names (e.g., updatedAt → updated_at).<br>
Gold (MART): A finalized FCT_PRODUCT_DETAILS table that joins products and categories
for analytics readiness.<br>

SQL<br>
-- Example of the final join logic used<br>
CREATE OR REPLACE TABLE MART.FCT_PRODUCT_DETAILS AS<br>
SELECT<br>
    p.product_id,<br>
    p.product_name,<br>
    p.price,<br>
    c.category_name,<br>
    p.updated_at<br>
FROM STAGING.STG_PRODUCTS p<br>
LEFT JOIN STAGING.STG_CATEGORIES c <br>
    ON p.category_id = c.category_id;<br>
3. Visualization (Looker Studio)<br>
The final "Gold" table is connected to Looker<br>
Studio to provide business insights, including:<br>

Inventory Distribution: Count of products per category.<br>

Pricing Strategy: Average price points across different product lines.<br>

Top Performers: Identification of high-value inventory items.<br>

## Key Challenges Solved<br>
Case Sensitivity: Handled Snowflake's double-quoting requirements for<br> 
lowercase API identifiers to ensure seamless SQL joins.<br>

Data Typing: Converted string-based API prices into DECIMAL formats for <br>
accurate mathematical aggregation in the dashboard.<br>

## How to Run
Run the ingestion.py script to load the latest API data into Snowflake.<br>

Execute the transformation scripts in the /sql folder to rebuild the Staging and Mart layers.<br>

Refresh the Looker Studio data source to view updated dashboard metrics.<br>

## Suggested Folder Structure for your GitHub:<br>
/scripts: Put your Python ingestion code here.<br>

/sql: Put the CREATE VIEW and CREATE TABLE scripts we wrote.<br>

/images: Put a screenshot of your Looker Studio dashboard.<br>

