{{ config(materialized='view') }}

select
  cast(store_id AS INT64) AS store_id,
  store_name,
  phone,
  email,
  street,
  city,
  state,
  cast(zip_code AS INT64) AS zip_code,
from {{ source('local_bike', 'stores') }}
