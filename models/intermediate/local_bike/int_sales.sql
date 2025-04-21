with orders as (
  select * from {{ ref('stg_orders') }}
),
order_items as (
  select * from {{ ref('stg_order_items') }}
)

select
  oi.order_id,
  oi.product_id,
  o.store_id,
  o.order_date,
  oi.quantity,
  oi.list_price,
  oi.discount,
  (oi.quantity * oi.list_price) * (1 - oi.discount) as revenue
from order_items oi
left join orders o on oi.order_id = o.order_id
