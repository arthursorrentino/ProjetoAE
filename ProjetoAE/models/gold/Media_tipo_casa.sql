{{
    config(
        on_schema_changes="sync_all_columns",
        materialized='table'
    )
}}

------------------------------------------ Média de preço por tipo de casa
SELECT
    room_type,
    AVG(price) AS avg_price
FROM silver_listings
GROUP BY room_type
