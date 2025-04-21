with geo_sales as (
    select * from {{ ref('int_geo_sales') }}
)

select
    order_date,
    state,
    city,
    sum(quantity) as total_quantity,
    sum(revenue) as total_revenue,
    count(distinct order_id) as total_orders
from geo_sales
group by order_date, state, city
