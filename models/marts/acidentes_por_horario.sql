SELECT
  CASE
    WHEN CAST(SUBSTR(des_hora_boletim, 1, 2) AS INTEGER) BETWEEN 6 AND 11 THEN 'Manha'
    WHEN CAST(SUBSTR(des_hora_boletim, 1, 2) AS INTEGER) BETWEEN 12 AND 17 THEN 'Tarde'
    WHEN CAST(SUBSTR(des_hora_boletim, 1, 2) AS INTEGER) BETWEEN 18 AND 23 THEN 'Noite'
    ELSE 'Madrugada'
  END AS turno,
  COUNT(*) AS total_acidentes
FROM descricao_acidentes
GROUP BY turno
ORDER BY total_acidentes DESC