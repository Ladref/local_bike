{{ config(materialized='view') }}

select
  cast(staff_id AS INT64) AS staff_id,
  first_name,
  last_name,
  email,
  phone,
  cast(active AS INT64) AS active,
  cast(store_id AS INT64) AS store_id,
  manager_id
from {{ source('local_bike', 'staffs') }}
