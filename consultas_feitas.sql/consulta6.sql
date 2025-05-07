#CONSULTA 6

use analises;

SELECT 
    NomeMunicipio, MAX(IDH_Renda) AS Media_Renda
FROM
    municipio m
        JOIN
    indice i ON i.CodMunicipio = m.CodMunicipio
GROUP BY NomeMunicipio
order by Media_Renda desc
limit 1;