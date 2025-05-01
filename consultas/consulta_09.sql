/*9- Relatório de Todos IDHs da Bahia de 91 e 2000, inclusive com a
diferença entre os mesmos*/

USE analises;

SELECT e.NomeEstado Estado,
m.NomeMunicipio Municipio,

-- IDH GERAL

i91.IDH_Geral IndiceGeral_91,
i00.IDH_Geral IndiceGeral_00,
ROUND((i00.IDH_Geral - i91.IDH_Geral), 4) DiferencaIDH_Geral

FROM municipio m
JOIN estado e
ON m.CodEstado = e.CodEstado
JOIN indice i91 
ON i91.CodMunicipio = m.CodMunicipio 
AND i91.Ano = 1991
JOIN indice i00
ON i00.CodMunicipio = m.CodMunicipio 
AND i00.Ano = 2000
WHERE e.NomeEstado = "Bahia" 
ORDER BY m.NomeMunicipio;