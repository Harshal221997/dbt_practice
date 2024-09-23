{{ config(
    materialized="incremental",
    incremental_strategy="append"
    ) }}

SELECT * FROM {{source('datafeed_shared_schema','STG_ORDERS')}}

