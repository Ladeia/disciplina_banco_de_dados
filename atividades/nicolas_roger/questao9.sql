USE analises;

SELECT 
  m.NomeMunicipio,
  i91.IDH_Geral AS IDH_91,
  i00.IDH_Geral AS IDH_00,
  (i00.IDH_Geral - i91.IDH_Geral) AS Diferenca_IDH
FROM municipio m
JOIN indice i91 ON m.CodMunicipio = i91.CodMunicipio AND i91.Ano = 1991
JOIN indice i00 ON m.CodMunicipio = i00.CodMunicipio AND i00.Ano = 2000
JOIN estado e ON m.CodEstado = e.CodEstado
WHERE e.NomeEstado = 'Bahia'
ORDER BY m.NomeMunicipio;