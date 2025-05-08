#CONSULTA 8 

use analises;

SELECT 
    NomeEstado, IDH_Educacao
FROM
    estado e
        JOIN
    municipio m ON m.CodEstado = e.CodEstado
        JOIN
    indice i ON i.CodMunicipio = m.CodMunicipio
    group by NomeEstado, IDH_Educacao
    order by IDH_Educacao desc
    limit 1;