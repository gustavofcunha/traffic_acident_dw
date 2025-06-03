SELECT chave_tempo,
hora,
minuto,
LPAD(CAST(hora AS VARCHAR), 2, '0') || ':' || LPAD(CAST(minuto AS VARCHAR), 2, '0') AS hora_bruta
FROM {{ ref('tempo') }}