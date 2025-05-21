# Relatório de Todos IDHs da Bahia de 91 e 2000, inclusive com a diferença entre os mesmos
SELECT 
  municipio.NomeMunicipio AS "Município",
  MAX(CASE WHEN indice.Ano = 1991 THEN indice.IDH_Geral END) AS "Índice de Desenvolvimento Humano Geral em 1991",
  MAX(CASE WHEN indice.Ano = 2000 THEN indice.IDH_Geral END) AS "Índice de Desenvolvimento Humano Geral em 2000",
  (MAX(CASE WHEN indice.Ano = 2000 THEN indice.IDH_Geral END) -
   MAX(CASE WHEN indice.Ano = 1991 THEN indice.IDH_Geral END)) AS "Diferença entre 2000 e 1991"
FROM indice
JOIN municipio ON indice.CodMunicipio = municipio.CodMunicipio
JOIN estado ON municipio.CodEstado = estado.CodEstado
WHERE estado.NomeEstado = 'Bahia'
  AND indice.Ano IN (1991, 2000)
GROUP BY municipio.NomeMunicipio;
