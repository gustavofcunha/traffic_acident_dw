SELECT 
A.numero_boletim,
A.data_boletim,
G.data_bruta as des_data_boletim,
G.dia_semana as dia_semana_boletim,
A.hora_boletim,
I.hora_bruta as des_hora_boletim,
A.data_inclusao,
H.data_bruta as des_data_inclusao,
H.dia_semana as dia_semana_inclusao,
A.hora_inclusao,
J.hora_bruta as des_hora_inclusao,
B.des_tipo_acidente,
C.des_clima,
D.des_pavimento,
E.des_regional,
F.des_origem_boletim,
A.velocidade_permitida,
A.coordenada_x,
A.coordenada_y,
A.idc_local_sinalizado,
A.idc_hora_informada,
A.idc_fatalidade
FROM {{ ref('fct_acidente') }} A
INNER JOIN {{ ref('dim_tipo_acidente') }} B
ON A.cod_tipo_acidente = B.cod_tipo_acidente
INNER JOIN {{ ref('dim_clima') }} C
ON A.cod_clima = C.cod_clima
INNER JOIN {{ ref('dim_pavimento') }} D
ON A.cod_pavimento = D.cod_pavimento
INNER JOIN {{ ref('dim_regional') }} E
ON A.cod_regional = E.cod_regional
INNER JOIN {{ ref('dim_origem_boletim') }} F
ON A.cod_origem_boletim = F.cod_origem_boletim
INNER JOIN {{ ref('dim_data') }} G
ON A.data_boletim = G.chave_data
INNER JOIN {{ ref('dim_data') }} H
ON A.data_inclusao= H.chave_data
INNER JOIN {{ ref('dim_tempo') }} I
ON A.hora_boletim = I.chave_tempo
INNER JOIN {{ ref('dim_tempo') }} J
ON A.hora_inclusao = J.chave_tempo