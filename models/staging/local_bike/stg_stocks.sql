{{ config(materialized='view') }}

select
  cast(store_id AS INT64) AS store_id,
  product_id,
  quantity
from {{ source('local_bike', 'stocks') }}
