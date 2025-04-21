{{ config(materialized='view') }}

select
    cast(order_id AS INT64) AS order_id,
    cast(item_id AS INT64) AS item_id,
    cast(product_id AS INT64) AS product_id,
    cast(quantity AS INT64) AS quantity,
    cast(list_price AS FLOAT64) AS list_price,
    cast(discount AS FLOAT64) AS discount,
from {{ source('local_bike', 'order_items') }}