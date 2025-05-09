USE analises;

SELECT NomeMunicipio
FROM municipio
GROUP BY NomeMunicipio
HAVING COUNT(*) > 1 ORDER BY NomeMunicipio;