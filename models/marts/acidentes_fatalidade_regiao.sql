SELECT
  des_regional,
  SUM(CASE WHEN idc_fatalidade = 'SIM' THEN 1 ELSE 0 END) AS total_fatais,
  COUNT(*) AS total_acidentes,
  ROUND((SUM(CASE WHEN idc_fatalidade = 'SIM' THEN 1 ELSE 0 END) /  COUNT(*)), 2) AS pct_fatalidade
FROM descricao_acidentes
GROUP BY des_regional
ORDER BY total_fatais DESC