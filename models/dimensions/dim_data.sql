SELECT chave_data,
dia,
mes,
ano,
dia_semana,
mes_descricao
FROM {{ ref('data') }}