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
  ON (
    EXTRACT(YEAR FROM strptime(A.data_hora_boletim, '%d/%m/%Y %H:%M')) * 10000 +
    EXTRACT(MONTH FROM strptime(A.data_hora_boletim, '%d/%m/%Y %H:%M')) * 100 +
    EXTRACT(DAY FROM strptime(A.data_hora_boletim, '%d/%m/%Y %H:%M'))
  ) = B.data_bruta
LEFT JOIN {{ ref('dim_tempo') }} C
  ON C.hora = EXTRACT(HOUR FROM strptime(A.data_hora_boletim, '%d/%m/%Y %H:%M'))
 AND C.minuto = EXTRACT(MINUTE FROM strptime(A.data_hora_boletim, '%d/%m/%Y %H:%M'))
LEFT JOIN {{ ref('dim_data') }} D
  ON (
    EXTRACT(YEAR FROM strptime(A.data_inclusao, '%d/%m/%Y %H:%M')) * 10000 +
    EXTRACT(MONTH FROM strptime(A.data_inclusao, '%d/%m/%Y %H:%M')) * 100 +
    EXTRACT(DAY FROM strptime(A.data_inclusao, '%d/%m/%Y %H:%M'))
  ) = D.data_bruta
LEFT JOIN {{ ref('dim_tempo') }} E
  ON E.hora = EXTRACT(HOUR FROM strptime(A.data_inclusao, '%d/%m/%Y %H:%M'))
 AND E.minuto = EXTRACT(MINUTE FROM strptime(A.data_inclusao, '%d/%m/%Y %H:%M'))
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
