{% snapshot snap_orders_checks %}

    {{
        config(
        strategy='check',
        unique_key='id',
        check_cols = ['user_id', 'order_date', 'status' ],
        invalidate_hard_deletes= True
        )

    }}

SELECT * FROM {{ source("datafeed_shared_schema", 'STG_ORDERS') }} LIMIT 10

{%  endsnapshot %}