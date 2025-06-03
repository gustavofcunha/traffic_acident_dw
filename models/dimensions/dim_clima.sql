SELECT DISTINCT
cod_tempo as cod_clima,
desc_tempo as des_clima
FROM {{ ref('stg_base_bruta_acidentes') }}
ORDER BY cod_tempo