{{ config(materialized='view') }}

select
  cast(category_id AS INT64) AS category_id,
  category_name
from {{ source('local_bike', 'categories') }}
