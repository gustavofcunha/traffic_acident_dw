SELECT
  des_clima,
  des_tipo_acidente,
  COUNT(*) AS total_acidentes
FROM descricao_acidentes
GROUP BY des_clima, des_tipo_acidente
ORDER BY des_clima, total_acidentes DESC
