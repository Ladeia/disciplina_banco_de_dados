#CONSULTA 1
SELECT 
    NomeRegiao, NomeEstado, SiglaEstado, NomeMunicipio
FROM
    regiao r
        JOIN
    estado e ON e.CodRegiao = r.CodRegiao
        JOIN
    municipio m ON m.CodEstado = e.CodEstado
WHERE
    NomeRegiao != 'Norte'
ORDER BY NomeMunicipio , NomeEstado;