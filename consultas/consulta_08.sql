/*8 - Qual o maior IDH de educação por estado*/

USE analises;

SELECT e.NomeEstado Estado, i.IDH_Educacao IndiceEducacao
FROM municipio m
JOIN indice i
ON i.CodMunicipio = m.CodMunicipio
JOIN estado e
ON m.CodEstado = e.CodEstado
WHERE i.IDH_Educacao = (
	SELECT MAX(IDH_Educacao)
    FROM indice
); 