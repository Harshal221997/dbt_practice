{{ config(materialized='table') }}

WITH tb1 AS(
SELECT 
    id,
    order_id
    from {{source("datafeed_shared_schema","STG_PAYMENTS")}})
    SELECT * FROM tb1