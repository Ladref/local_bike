-- Vérifie que le prix est strictement positif
SELECT *
FROM {{ ref('stg_order_items') }}
WHERE list_price <= 0
