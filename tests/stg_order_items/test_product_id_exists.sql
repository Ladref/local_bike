-- Vérifie que chaque product_id existe dans stg_products
SELECT o.*
FROM {{ ref('stg_order_items') }} o
LEFT JOIN {{ ref('stg_products') }} p ON o.product_id = p.product_id
WHERE p.product_id IS NULL
