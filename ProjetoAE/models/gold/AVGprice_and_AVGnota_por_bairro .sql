{{
    config(
        on_schema_changes="sync_all_columns",
        materialized='table'
    )
}}
-------------------------------------- Média de nota e média de preço por bairro
SELECT
    neighbourhood,
    AVG(nota) AS avg_nota,
    CAST(AVG(price) AS INT) AS avg_price,
    CAST(AVG(qtd_quartos) AS INT)AS avg_qtd_quartos,
    CAST(AVG(qtd_camas) AS INT)AS avg_qtd_camas
FROM silver_listings
GROUP BY neighbourhood