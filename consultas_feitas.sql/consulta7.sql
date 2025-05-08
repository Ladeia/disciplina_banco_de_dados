#CONSULTA 7 

use analises;

SELECT 
    NomeEstado, NomeMunicipio, IDH_Geral
FROM
    estado e
        JOIN
    municipio m ON m.CodEstado = e.CodEstado
        JOIN
    indice i ON i.CodMunicipio = m.CodMunicipio
    group by NomeEstado, NomeMunicipio, IDH_Geral
    having IDH_Geral > 0.8
    order by IDH_Geral, NomeEstado, NomeMunicipio;