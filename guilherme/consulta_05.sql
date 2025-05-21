# Ano em que Salvador obteve o melhor índice de Instrução
SELECT 
  indice.Ano AS "Ano",
  indice.IDH_Educacao AS "Índice de Desenvolvimento Humano de Educação"
FROM indice
JOIN municipio ON indice.CodMunicipio = municipio.CodMunicipio
WHERE municipio.NomeMunicipio = 'Salvador'
ORDER BY indice.IDH_Educacao DESC
LIMIT 1;

