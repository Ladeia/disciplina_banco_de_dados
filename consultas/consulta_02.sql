/*2 - Municípios que possuem o mesmo nome*/

USE analises;

SELECT NomeMunicipio Municipio, count(NomeMunicipio) Quantidade FROM municipio m
JOIN estado e
ON m.CodEstado = e.CodRegiao
JOIN regiao r
ON e.CodRegiao = r.CodRegiao
GROUP BY m.NomeMunicipio
HAVING Quantidade > 1;