/*5 - Ano em que Salvador obteve o melhor índice de Instrução*/

USE analises;

SELECT m.NomeMunicipio Municipio, i.Ano, MAX(IDH_Educacao) IndiceEducacao
FROM municipio m
JOIN indice i
ON m.CodMunicipio = i.CodMunicipio
WHERE m.NomeMunicipio = "Salvador" AND IDH_Educacao > .900
GROUP BY NomeMunicipio, i.Ano;