-- 8 questao -- 
SELECT e.NomeEstado Estado, MAX(i.IDH_Educacao)  MaiorIDHEducacao
FROM municipio m
JOIN indice i ON m.CodMunicipio = i.CodMunicipio
JOIN estado e ON m.CodEstado = e.CodEstado
GROUP BY e.NomeEstado
ORDER BY MaiorIDHEducacao DESC;