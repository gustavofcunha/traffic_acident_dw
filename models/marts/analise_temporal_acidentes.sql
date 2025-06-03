SELECT
  YEAR(des_data_boletim) AS ano,
  MONTH(des_data_boletim) AS mes,
  COUNT(*) AS total_acidentes
FROM descricao_acidentes
GROUP BY ano, mes
ORDER BY ano, mes