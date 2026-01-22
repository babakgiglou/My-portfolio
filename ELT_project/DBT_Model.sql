-- Updated staging for Products
CREATE OR REPLACE VIEW ELT_DB.STAGING.STG_PRODUCTS AS
SELECT
    "id" AS product_id,
    "title" AS product_name,
    "price"::DECIMAL(10,2) AS price,
    "categoryId" AS category_id,   -- Changed to CamelCase
    "updatedAt"::TIMESTAMP AS updated_at -- Changed to CamelCase
FROM ELT_DB.RAW_DATA.PRODUCTS;

-- Updated staging for Categories
CREATE OR REPLACE VIEW ELT_DB.STAGING.STG_CATEGORIES AS
SELECT
    "id" AS category_id,
    "name" AS category_name,
    "updatedAt"::TIMESTAMP AS updated_at -- Changed to CamelCase
FROM ELT_DB.RAW_DATA.CATEGORIES;


USE ROLE ACCOUNTADMIN;
USE DATABASE ELT_DB;

-- Give the STAGING schema permissions (just in case)
GRANT USAGE ON SCHEMA ELT_DB.STAGING TO ROLE ACCOUNTADMIN;
GRANT ALL PRIVILEGES ON SCHEMA ELT_DB.STAGING TO ROLE ACCOUNTADMIN;


-- Create Staging Products (Simple version)
CREATE OR REPLACE VIEW ELT_DB.STAGING.STG_PRODUCTS AS
SELECT * FROM ELT_DB.RAW_DATA.PRODUCTS;

-- Create Staging Categories (Simple version)
CREATE OR REPLACE VIEW ELT_DB.STAGING.STG_CATEGORIES AS
SELECT * FROM ELT_DB.RAW_DATA.CATEGORIES;


SELECT * FROM ELT_DB.STAGING.STG_PRODUCTS LIMIT 5;
SELECT * FROM ELT_DB.STAGING.STG_CATEGORIES LIMIT 5;

SELECT column_name 
FROM ELT_DB.INFORMATION_SCHEMA.COLUMNS 
WHERE table_name = 'PRODUCTS' 
AND table_schema = 'RAW_DATA';

CREATE OR REPLACE VIEW ELT_DB.STAGING.STG_PRODUCTS AS
SELECT
    "id" AS product_id,
    "title" AS product_name,
    "price"::DECIMAL(10,2) AS price,
    "category_id" AS category_id,
    "updatedAt"::TIMESTAMP AS updated_at
FROM ELT_DB.RAW_DATA.PRODUCTS;

CREATE OR REPLACE VIEW ELT_DB.STAGING.STG_CATEGORIES AS
SELECT
    "id" AS category_id,
    "name" AS category_name
FROM ELT_DB.RAW_DATA.CATEGORIES;

CREATE OR REPLACE TABLE ELT_DB.MART.FCT_PRODUCT_DETAILS AS
SELECT
    p.product_id,
    p.product_name,
    p.price,
    c.category_name,
    p.updated_at
FROM ELT_DB.STAGING.STG_PRODUCTS p
LEFT JOIN ELT_DB.STAGING.STG_CATEGORIES c 
    ON p.category_id = c.category_id;

    SELECT * FROM ELT_DB.MART.FCT_PRODUCT_DETAILS;