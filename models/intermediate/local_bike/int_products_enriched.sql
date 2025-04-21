with products as (
  select * from {{ ref('stg_products') }}
),
brands as (
  select * from {{ ref('stg_brands') }}
),
categories as (
  select * from {{ ref('stg_categories') }}
)

select
  p.product_id,
  p.product_name,
  p.model_year,
  p.list_price,
  b.brand_name,
  c.category_name
from products p
left join brands b on p.brand_id = b.brand_id
left join categories c on p.category_id = c.category_id
