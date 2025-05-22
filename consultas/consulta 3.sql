-- 3 questao -- 
-- por regiao --
SELECT 
  r.NomeRegiao,
  count(m.CodMunicipio) * 1.0 / count(DISTINCT e.CodEstado)  MediaMunicipiosPorEstado
FROM municipio m
JOIN estado e ON m.CodEstado = e.CodEstado
JOIN regiao r ON e.CodRegiao = r.CodRegiao
GROUP BY r.NomeRegiao
ORDER BY r.NomeRegiao;

-- por estado -- 
SELECT 
  e.NomeEstado,
  e.SiglaEstado,
  count(m.CodMunicipio)  TotalMunicipios
FROM municipio m
JOIN estado e ON m.CodEstado = e.CodEstado
GROUP BY e.CodEstado
ORDER BY TotalMunicipios DESC;
