with sales as (
  select * from {{ ref('int_sales') }}
),
stores as (
  select * from {{ ref('stg_stores') }}
)

select
  s.order_id,
  s.product_id,
  s.quantity,
  s.list_price,
  s.discount,
  s.revenue,
  s.order_date,
  s.customer_id,
  s.store_id,
  st.store_name
from sales s
left join stores st on s.store_id = st.store_id
