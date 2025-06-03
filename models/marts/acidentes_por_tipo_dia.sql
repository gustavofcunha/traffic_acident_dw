SELECT
des_tipo_acidente,
dia_semana_boletim,
COUNT(*) AS total_acidentes
FROM descricao_acidentes
GROUP BY des_tipo_acidente, dia_semana_boletim
ORDER BY total_acidentes DESC