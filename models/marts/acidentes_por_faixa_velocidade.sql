SELECT
  FLOOR(velocidade_permitida / 10) * 10 AS faixa_velocidade,
  COUNT(*) AS total_acidentes
FROM descricao_acidentes
GROUP BY faixa_velocidade
ORDER BY total_acidentes desc