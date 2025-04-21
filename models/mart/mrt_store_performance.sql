with store_sales as (
    select * from {{ ref('int_store_sales') }}
)

select
    order_date,
    store_id,
    store_name,
    count(distinct customer_id) as total_customers,
    sum(quantity) as total_quantity,
    sum(revenue) as total_revenue,
    round(sum(revenue) / count(distinct order_id), 2) as average_basket
from store_sales
group by store_id, store_name
