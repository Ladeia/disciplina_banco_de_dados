-- 7 questao -- 
SELECT DISTINCT e.NomeEstado Estado
FROM municipio m
JOIN  indice  i ON m.CodMunicipio = i.CodMunicipio
JOIN estado e ON m.CodEstado = e.CodEstado
WHERE i.IDH_Geral > 0.8;