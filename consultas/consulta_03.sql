/*3 - Média de municípios por Região e por Estado*/

USE analises;

-- Por Estados:

SELECT 
	avg(TotalMunicipiosEstado) MediaDeMunicipiosEstado 
FROM (
	SELECT e.CodEstado, count(m.NomeMunicipio) TotalMunicipiosEstado
	FROM municipio m 
	JOIN estado e
	ON m.CodEstado = e.CodEstado
    GROUP BY e.CodEstado
) AS ConsultaMediaEstado;

-- Por Regiões:

SELECT 
	avg(TotalMunicipiosRegiao) MediaRegiao
FROM (
	SELECT r.CodRegiao, count(r.NomeRegiao) TotalMunicipiosRegiao
    FROM municipio m
    JOIN estado e
    ON m.CodEstado = e.CodEstado
    JOIN regiao r
    ON e.CodRegiao = r.CodRegiao
    GROUP BY r.CodRegiao
) AS ConsultaMediaPorRegiao;