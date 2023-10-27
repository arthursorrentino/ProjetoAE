{{
    config(
        unique_key='id',
        on_schema_changes="sync_all_columns",
        materialized='table'
    )
}}

SELECT
    tb.id AS id,
    tb.host_id AS host_id,
    tb.host_name AS host_name,
    tb.neighbourhood AS neighbourhood,
    tb.room_type AS room_type,
    tb.price AS price,
    tb.minimum_nights AS minimum_nights,
    tb.number_of_reviews AS number_of_reviews,
    tb.reviews_per_month AS reviews_per_month,
    tb.availability_365 AS availability_365,
    tb.number_of_reviews_ltm AS number_of_reviews_ltm,
    REPLACE(tb.nome, ' in Antwerp', '') AS tipo,
    tb.nota AS nota,
    CAST(SUBSTRING(tb.qtd_quartos FROM '^[0-9]+') AS INT) AS qtd_quartos,
    CAST(SUBSTRING(tb.qtd_camas FROM '^[0-9]+') AS INT) AS qtd_camas,
    tb.banheiro AS banheiro
FROM public.listings_bronze as tb