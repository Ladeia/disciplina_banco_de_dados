/*7 - Quais estados possuem municípios com IDH geral maior que 0,8*/

USE analises;

SELECT DISTINCT e.NomeEstado Estado
FROM municipio m
JOIN indice i
ON m.CodMunicipio = i.CodMunicipio
JOIN estado e
ON m.CodEstado = e.CodEstado
WHERE IDH_Geral > 0.8;