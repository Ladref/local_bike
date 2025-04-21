{{ config(materialized='view') }}

select
    cast(customer_id AS INT64) AS customer_id,
    cast(first_name AS STRING) AS first_name,
    cast(last_name AS STRING) AS last_name,
    cast(phone AS STRING) AS phone,
    cast(email AS STRING) AS email,
    cast(street AS STRING) AS street,
    cast(city AS STRING) AS city,
    cast(state AS STRING) AS state,
    cast(zip_code AS STRING) AS zip_code
from {{ source('local_bike', 'customers') }}
