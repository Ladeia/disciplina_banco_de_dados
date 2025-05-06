#CONSULTA 4


use analises;

SELECT 
    NomeMunicipio, (AVG(i.IDH_Longevidade)) AS Maior_Longevidade
FROM
    municipio m
        JOIN
    indice i ON i.CodMunicipio = m.CodMunicipio
GROUP BY NomeMunicipio
ORDER BY Maior_Longevidade desc
limit 1;
