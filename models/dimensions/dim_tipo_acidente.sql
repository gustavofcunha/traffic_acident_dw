SELECT DISTINCT tipo_acidente as cod_tipo_acidente, 
desc_tipo_acidente as des_tipo_acidente
FROM {{ ref('stg_base_bruta_acidentes') }}
ORDER BY tipo_acidente