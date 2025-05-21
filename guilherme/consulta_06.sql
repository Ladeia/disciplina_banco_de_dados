# Qual o município com a melhor distribuição de renda
SELECT 
  municipio.NomeMunicipio AS "Município",
  indice.Ano AS "Ano",
  indice.IDH_Renda AS "Índice de Desenvolvimento Humano de Renda"
FROM indice
JOIN municipio ON indice.CodMunicipio = municipio.CodMunicipio
ORDER BY indice.IDH_Renda DESC
LIMIT 1;