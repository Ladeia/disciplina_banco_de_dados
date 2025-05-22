-- 2 questao --
SELECT NomeMunicipio, count(NomeMunicipio) Quantidade
FROM municipio m
JOIN estado e ON m.CodEstado = e.CodEstado
JOIN regiao r ON e.CodRegiao = r.CodRegiao
GROUP BY NomeMunicipio
HAVING count(*) > 1;