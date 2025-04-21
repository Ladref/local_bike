with sales as (
  select * from {{ ref('int_sales') }}
),
stores as (
  select * from {{ ref('stg_stores') }}
),
customers as (
  select * from {{ ref('stg_customers') }}
)

select
  s.order_id,
  s.product_id,
  s.quantity,
  s.list_price,
  s.discount,
  s.revenue,
  s.order_date,
  s.store_id,
  s.customer_id,
  c.city,
  c.state,
  st.store_name
from sales s
left join stores st on s.store_id = st.store_id
left join customers c on s.customer_id = c.customer_id
