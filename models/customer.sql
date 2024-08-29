{{ config(materialized='table') }}

WITH tb1 AS(
SELECT 
    id,
    first_name,
    last_name
    from {{source("datafeed_shared_schema","STG_CUSTOMERS")}})
    SELECT * FROM tb1