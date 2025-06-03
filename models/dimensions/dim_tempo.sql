SELECT chave_tempo,
hora,
minuto
FROM {{ ref('tempo') }}