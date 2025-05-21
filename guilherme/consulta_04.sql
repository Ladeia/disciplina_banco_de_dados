SELECT 
  municipio.NomeMunicipio AS "Município",
  indice.Ano AS "Ano",
  indice.IDH_Longevidade AS "Índice de Desenvolvimento Humano de Longevidade"
FROM indice
JOIN municipio ON indice.CodMunicipio = municipio.CodMunicipio
ORDER BY indice.IDH_Longevidade DESC
LIMIT 1;
