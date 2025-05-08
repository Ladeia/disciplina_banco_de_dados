#CONSULTA 2
use analises;

SELECT 
    NomeMunicipio, COUNT(NomeMunicipio)
FROM
    regiao r
        JOIN
    estado e ON e.CodRegiao = r.CodRegiao
        JOIN
    municipio m ON m.CodEstado = e.CodEstado
GROUP BY NomeMunicipio
having count(NomeMunicipio) > '1'
ORDER BY NomeMunicipio;