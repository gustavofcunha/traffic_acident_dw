SELECT DISTINCT cod_pavimento, pavimento as des_pavimento
FROM {{ ref('stg_base_bruta_acidentes') }}
ORDER BY cod_pavimento