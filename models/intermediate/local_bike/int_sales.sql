with orders as (
  select * from {{ ref('stg_orders') }}
),
order_items as (
  select * from {{ ref('stg_order_items') }}
)

select
  oi.order_id,
  oi.product_id,
  oi.quantity,
  oi.list_price,
  oi.discount,
  o.order_date,
  o.store_id,
  o.customer_id,
  -- calcul du revenu
  oi.quantity * oi.list_price * (1 - oi.discount) as revenue
from order_items oi
left join orders o on oi.order_id = o.order_id
