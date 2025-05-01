/*10 - Relatório comparativo entre as médias dos IDHs de MG e BA, de 2000 e 91*/

USE analises;

SELECT e.NomeEstado Estado,
m.NomeMunicipio Municipio,

i91.IDH_Geral IndiceGeral_91,
i00.IDH_Geral IndiceGeral_00

FROM municipio m
JOIN estado e
ON m.CodEstado = e.CodEstado
JOIN indice i91 
ON i91.CodMunicipio = m.CodMunicipio 
AND i91.Ano = 1991
JOIN indice i00
ON i00.CodMunicipio = m.CodMunicipio 
AND i00.Ano = 2000
WHERE e.SiglaEstado IN ('BA', 'MG');