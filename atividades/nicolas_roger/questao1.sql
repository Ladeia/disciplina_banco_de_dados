USE analises;

SELECT m.NomeMunicipio
FROM municipio m
JOIN estado e ON m.CodEstado = e.CodEstado
JOIN regiao r ON e.CodRegiao = r.CodRegiao
WHERE r.NomeRegiao != 'Norte' ORDER BY NomeMunicipio