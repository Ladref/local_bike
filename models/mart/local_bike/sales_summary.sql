with sales as (select * from {{ ref("int_sales") }})

select
    order_date,
    store_id,
    sum(revenue) as total_revenue,
    sum(quantity) as total_quantity,
    count(distinct order_id) as total_orders
from sales
group by order_date, store_id
