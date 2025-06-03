SELECT 
A.numero_boletim,
B.chave_data AS data_boletim,
C.chave_tempo AS hora_boletim,
D.chave_data AS data_inclusao,
E.chave_tempo AS hora_inclusao,
F.cod_tipo_acidente,
G.cod_clima,
H.cod_pavimento,
I.cod_regional,
J.cod_origem_boletim,
A.velocidade_permitida,
A.coordenada_x,
A.coordenada_y,
A.local_sinalizado AS idc_local_sinalizado,
A.hora_informada AS idc_hora_informada,
A.indicador_fatalidade AS idc_fatalidade
FROM {{ ref('stg_base_bruta_acidentes') }} A
LEFT JOIN {{ ref('dim_data') }} B
ON STRPTIME(A.data_hora_boletim, '%d/%m/%Y %H:%M')::DATE = B.data_bruta
LEFT JOIN {{ ref('dim_tempo') }} C
ON CAST(STRFTIME('%H', STRPTIME(A.data_hora_boletim, '%d/%m/%Y %H:%M')) AS INT) = C.hora
AND CAST(STRFTIME('%M', STRPTIME(A.data_hora_boletim, '%d/%m/%Y %H:%M')) AS INT) = C.minuto
LEFT JOIN {{ ref('dim_data') }} D
ON STRPTIME(A.data_hora_boletim, '%d/%m/%Y %H:%M')::DATE = D.data_bruta
LEFT JOIN {{ ref('dim_tempo') }} E
ON CAST(STRFTIME('%H', STRPTIME(A.data_inclusao, '%d/%m/%Y %H:%M')) AS INT) = E.hora
AND CAST(STRFTIME('%M', STRPTIME(A.data_inclusao, '%d/%m/%Y %H:%M')) AS INT) = E.minuto
LEFT JOIN {{ ref('dim_tipo_acidente') }} F
ON A.desc_tipo_acidente = F.des_tipo_acidente
LEFT JOIN {{ ref('dim_clima') }} G
ON A.desc_tempo = G.des_clima
LEFT JOIN {{ ref('dim_pavimento') }} H
ON A.pavimento = H.des_pavimento
LEFT JOIN {{ ref('dim_regional') }} I
ON CASE WHEN TRIM(A.desc_regional) = '' THEN 'NAO INFORMADO' ELSE desc_regional END = I.des_regional
LEFT JOIN {{ ref('dim_origem_boletim') }} J
ON A.origem_boletim = J.des_origem_boletim