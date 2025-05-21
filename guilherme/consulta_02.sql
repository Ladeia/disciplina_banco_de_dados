# 2-Municípios que possuem o mesmo nome:
use analises;
SELECT municipio.NomeMunicipio, estado.NomeEstado
FROM municipio
JOIN estado ON municipio.CodEstado = estado.CodEstado
WHERE municipio.NomeMunicipio IN (
    SELECT NomeMunicipio
    FROM municipio
    GROUP BY NomeMunicipio
    HAVING COUNT(*) > 1
)
ORDER BY municipio.NomeMunicipio;



