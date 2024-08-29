with
    customer_data as (
        select id as customer_id, first_name, last_name from {{ ref("customer") }}
    ),

    orders_data as (
        select id as order_id, user_id as customer_id, order_date, status
        from {{ ref("orders") }}
    ),

    customer_orders as (
        select
            customer_id,
            min(order_date) as first_order_date,
            max(order_date) as most_recent_order_date,
            count(order_id) as number_of_orders
        from orders_data
        group by 1
    ),

    final as (
        select
            x.customer_id,
            x.first_name,
            x.last_name,
            y.first_order_date,
            y.most_recent_order_date,
            coalesce(y.number_of_orders, 0) as number_of_orders
        from customer_data x
        left join customer_orders y on x.customer_id = y.customer_id
    )
select *
from final
