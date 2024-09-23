{{ 
config(
    materialized='incremental',
    incremental_strategy='insert_overwrite'
)

}}
SELECT * FROM {{ source("datafeed_shared_schema",'STG_ORDERS') }}