USE analises;

SELECT
  e.NomeEstado,
  AVG(CASE WHEN i.Ano = 1991 THEN i.IDH_Geral ELSE NULL END) AS Media_IDH_91,
  AVG(CASE WHEN i.Ano = 2000 THEN i.IDH_Geral ELSE NULL END) AS Media_IDH_2000
FROM municipio m
JOIN estado e ON m.CodEstado = e.CodEstado
JOIN indice i ON m.CodMunicipio = i.CodMunicipio
WHERE e.NomeEstado IN ('Minas Gerais', 'Bahia') 
AND i.Ano IN (1991, 2000)
GROUP BY e.NomeEstado;