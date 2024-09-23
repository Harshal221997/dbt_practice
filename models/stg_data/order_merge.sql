{{ config(
    materialized="incremental",
    unique_key='id',
    incremental_strategy="merge"
)
}}

SELECT * FROM {{source('datafeed_shared_schema','STG_ORDERS')}}

