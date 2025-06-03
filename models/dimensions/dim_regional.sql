SELECT DISTINCT cod_regional, 
CASE WHEN TRIM(desc_regional) = '' THEN 'NAO INFORMADO' 
     ELSE desc_regional END as des_regional
FROM {{ ref('stg_base_bruta_acidentes') }}
ORDER BY cod_regional