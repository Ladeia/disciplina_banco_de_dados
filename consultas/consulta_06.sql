/*6 - Qual o município com a melhor distribuição de renda*/

USE analises;

SELECT m.NomeMunicipio Municipio, i.IDH_Renda IndiceRenda
FROM municipio m
JOIN indice i
ON m.CodMunicipio = i.CodMunicipio
WHERE i.IDH_Renda = (
	SELECT MAX(IDH_Renda)
    FROM indice
);