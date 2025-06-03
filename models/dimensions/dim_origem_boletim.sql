WITH
    DESCRICAO_DISTINTA AS (
        SELECT DISTINCT 
        origem_boletim as des_origem_boletim
        FROM {{ ref('stg_base_bruta_acidentes') }}
    )


SELECT 
ROW_NUMBER() OVER (ORDER BY des_origem_boletim) as cod_origem_boletim,
des_origem_boletim
FROM DESCRICAO_DISTINTA
ORDER BY cod_origem_boletim