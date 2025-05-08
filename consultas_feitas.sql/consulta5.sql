#CONSULTA 5

use analises; 

SELECT 
    Ano, max(IDH_Educacao) as Media_Educacao, NomeMunicipio
FROM
    municipio m
        JOIN
    indice i ON i.CodMunicipio = m.CodMunicipio
WHERE
    NomeMunicipio = 'Salvador'
GROUP BY Ano
order by Media_Educacao desc
limit 1;

