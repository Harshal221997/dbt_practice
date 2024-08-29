{{ config(materialized='view') }}

WITH tb1 AS(
SELECT 
    id,
    order_date,
    user_id,
    Status
    from {{source("datafeed_shared_schema","STG_ORDERS")}})
    SELECT * FROM tb1