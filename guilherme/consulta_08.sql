# Qual o maior IDH de educação por estado
SELECT 
  estado.NomeEstado AS "Estado",
  MAX(indice.IDH_Educacao) AS "Maior Índice de Desenvolvimento Humano de Educação"
FROM indice
JOIN municipio ON indice.CodMunicipio = municipio.CodMunicipio
JOIN estado ON municipio.CodEstado = estado.CodEstado
GROUP BY estado.NomeEstado;