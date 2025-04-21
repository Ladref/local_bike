-- Vérifie que discount est entre 0 et 1
SELECT *
FROM {{ ref('stg_order_items') }}
WHERE discount < 0 OR discount > 1
