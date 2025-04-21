with sales as (
    select * from {{ ref('int_sales') }}
),
products as (
    select * from {{ ref('int_products_enriched') }}
)

select
    s.order_date,
    p.product_id,
    p.product_name,
    p.brand_name,
    p.category_name,
    sum(s.quantity) as total_quantity_sold,
    sum(s.revenue) as total_revenue
from sales s
join products p on s.product_id = p.product_id
group by p.product_id, p.product_name, p.brand_name, p.category_name
