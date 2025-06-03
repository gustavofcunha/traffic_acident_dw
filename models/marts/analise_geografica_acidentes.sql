SELECT
coordenada_x AS longitude,
coordenada_y AS latitude
FROM descricao_acidentes
WHERE coordenada_x IS NOT NULL
AND coordenada_y IS NOT NULL