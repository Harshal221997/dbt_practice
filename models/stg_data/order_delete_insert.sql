{{ config(
    materialized="incremental",
    incremental_strategy="delete+insert",
    unique_key="id"
)}}
SELECT * FROM {{source("datafeed_shared_schema","STG_ORDERS")}}