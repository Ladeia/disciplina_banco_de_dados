# Relatório comparativo entre as médias dos IDHs de MG e BA, de 2000 e 91
SELECT 
  estado.NomeEstado AS "Estado",
  indice.Ano AS "Ano",
  ROUND(AVG(indice.IDH_Geral), 4) AS "Média do Índice de Desenvolvimento Humano Geral"
FROM indice
JOIN municipio ON indice.CodMunicipio = municipio.CodMunicipio
JOIN estado ON municipio.CodEstado = estado.CodEstado
WHERE estado.NomeEstado IN ('Minas Gerais', 'Bahia')
  AND indice.Ano IN (1991, 2000)
GROUP BY estado.NomeEstado, indice.Ano
ORDER BY estado.NomeEstado, indice.Ano;