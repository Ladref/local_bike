{{ config(materialized='view') }}

select
    cast(brand_id AS INT64) AS brand_id,
    brand_name
from {{ source('local_bike', 'brands') }}
