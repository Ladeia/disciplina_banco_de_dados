-- 10 questao -- 
SELECT e.NomeEstado  Estado,i.Ano,AVG(i.IDH_Geral)  MediaIDH_Geral
FROM municipio m
JOIN estado e ON m.CodEstado = e.CodEstado
JOIN indice i ON i.CodMunicipio = m.CodMunicipio
WHERE e.NomeEstado IN ('Minas Gerais', 'Bahia')AND i.Ano IN (1991, 2000)
GROUP BY e.NomeEstado, i.Ano
ORDER BY e.NomeEstado, i.Ano;