/*4 - Município com as pessoas mais idosas*/

USE analises;

SELECT m.NomeMunicipio Municipio, i.IDH_Longevidade IndiceLongevidade
FROM municipio m
JOIN indice i
ON m.CodMunicipio = i.CodMunicipio
WHERE i.IDH_Longevidade = (
	SELECT MAX(IDH_Longevidade) 
    FROM indice
);