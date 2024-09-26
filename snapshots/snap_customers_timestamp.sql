{% snapshot snap_customers_timestamp %}

{{
    config(
        strategy = 'timestamp',
        unique_key='id',
        updated_at= 'updated_at'
    )

}}
SELECT * FROM {{ source("datafeed_shared_schema",'CUSTOMERS') }}

{% endsnapshot %}