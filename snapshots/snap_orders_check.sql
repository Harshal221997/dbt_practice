{% snapshot snap_orders_check %}

{{
    config(
        strategy='check',
        unique_key='id',
        check_cols= ['user_id', 'order_date', 'status' ]
        )
}}
SELECT * FROM {{ source("datafeed_shared_schema", 'STG_ORDERS')}} limit 10

{% endsnapshot %}