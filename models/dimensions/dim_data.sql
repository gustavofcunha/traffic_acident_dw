SELECT chave_data,
dia,
mes,
ano,
dia_semana,
mes_descricao,
  CAST(
    CAST(ano AS VARCHAR) || '-' ||
    LPAD(CAST(mes AS VARCHAR), 2, '0') || '-' ||
    LPAD(CAST(dia AS VARCHAR), 2, '0')
  AS DATE) AS data_bruta
FROM {{ ref('data') }}