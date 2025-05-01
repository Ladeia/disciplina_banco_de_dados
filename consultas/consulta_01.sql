/*1 - Municípios que não pertencem a região norte*/

USE analises;

SHOW TABLES;
SELECT DISTINCT NomeMunicipio, NomeRegiao FROM municipio m
JOIN estado e
ON m.CodEstado = e.CodRegiao
JOIN regiao r
ON e.CodRegiao = r.CodRegiao
WHERE NomeRegiao <> "Norte"
ORDER BY NomeMunicipio;
