{{ config(materialized='view') }}

SELECT
    CAST(order_id AS INT64) AS customer_id,
    CAST(item_id AS INT64) AS first_name,
    CAST(product_id AS INT64) AS last_name,
    CAST(quantity AS INT64) AS phone,
    CAST(list_price AS FLOAT64) AS email,
    CAST(discount AS FLOAT64) AS street,

FROM {{ source('local_bike', 'order_items') }}