-- 1 questao -- 
SELECT r.NomeRegiao, e.NomeEstado, count(m.CodMunicipio)  TotalMunicipios
FROM municipio m
JOIN estado e ON m.CodEstado = e.CodEstado
JOIN regiao r ON e.CodRegiao = r.CodRegiao
WHERE r.NomeRegiao <> 'Norte'
GROUP BY r.NomeRegiao, e.NomeEstado
ORDER BY r.NomeRegiao, e.NomeEstado;