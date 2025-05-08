1)

SELECT m.NomeMunicipio, e.NomeEstado, r.NomeRegiao
FROM municipio m
JOIN estado e ON m.CodEstado = e.CodEstado
JOIN regiao r ON e.CodRegiao = r.CodRegiao
WHERE r.NomeRegiao != 'Norte';

2)

SELECT NomeMunicipio, COUNT(*) AS qtd
FROM municipio
GROUP BY NomeMunicipio
HAVING COUNT(*) > 1;

3)

SELECT r.NomeRegiao, COUNT(m.CodMunicipio) AS QtdMunicipios
FROM regiao r
JOIN estado e ON r.CodRegiao = e.CodRegiao
JOIN municipio m ON e.CodEstado = m.CodEstado
GROUP BY r.CodRegiao;

SELECT e.NomeEstado, COUNT(m.CodMunicipio) AS QtdMunicipios
FROM estado e
JOIN municipio m ON e.CodEstado = m.CodEstado
GROUP BY e.CodEstado;


4)

SELECT m.NomeMunicipio, MAX(i.IDH_Longevidade) AS MaiorLongevidade
FROM municipio m
JOIN indice i ON m.CodMunicipio = i.CodMunicipio
GROUP BY m.CodMunicipio
ORDER BY MaiorLongevidade DESC
LIMIT 1;

5)

SELECT i.Ano, MAX(i.IDH_Educacao) AS MelhorIDH_Instrucao
FROM municipio m
JOIN indice i ON m.CodMunicipio = i.CodMunicipio
WHERE m.NomeMunicipio = 'Salvador'
GROUP BY i.Ano
ORDER BY MelhorIDH_Instrucao DESC
LIMIT 1;

6)

SELECT m.NomeMunicipio, MAX(i.IDH_Renda) AS MelhorDistribuicaoRenda
FROM municipio m
JOIN indice i ON m.CodMunicipio = i.CodMunicipio
GROUP BY m.CodMunicipio
ORDER BY MelhorDistribuicaoRenda DESC
LIMIT 1;

7)

SELECT DISTINCT e.NomeEstado
FROM estado e
JOIN municipio m ON e.CodEstado = m.CodEstado
JOIN indice i ON m.CodMunicipio = i.CodMunicipio
WHERE i.IDH_Geral > 0.8;

8)

SELECT e.NomeEstado, MAX(i.IDH_Educacao) AS MelhorIDHEducacao
FROM estado e
JOIN municipio m ON e.CodEstado = m.CodEstado
JOIN indice i ON m.CodMunicipio = i.CodMunicipio
GROUP BY e.CodEstado;

9)

SELECT m.NomeMunicipio, i.Ano, i.IDH_Geral, i.IDH_Educacao, i.IDH_Renda, i.IDH_Longevidade,
       (SELECT i2.IDH_Geral FROM indice i2 WHERE i2.CodMunicipio = m.CodMunicipio AND i2.Ano = 2000) AS IDH_Geral_2000,
       (SELECT i2.IDH_Educacao FROM indice i2 WHERE i2.CodMunicipio = m.CodMunicipio AND i2.Ano = 2000) AS IDH_Educacao_2000,
       (SELECT i2.IDH_Renda FROM indice i2 WHERE i2.CodMunicipio = m.CodMunicipio AND i2.Ano = 2000) AS IDH_Renda_2000,
       (SELECT i2.IDH_Longevidade FROM indice i2 WHERE i2.CodMunicipio = m.CodMunicipio AND i2.Ano = 2000) AS IDH_Longevidade_2000,
       i.IDH_Geral - (SELECT i2.IDH_Geral FROM indice i2 WHERE i2.CodMunicipio = m.CodMunicipio AND i2.Ano = 2000) AS Dif_IDH_Geral,
       i.IDH_Educacao - (SELECT i2.IDH_Educacao FROM indice i2 WHERE i2.CodMunicipio = m.CodMunicipio AND i2.Ano = 2000) AS Dif_IDH_Educacao,
       i.IDH_Renda - (SELECT i2.IDH_Renda FROM indice i2 WHERE i2.CodMunicipio = m.CodMunicipio AND i2.Ano = 2000) AS Dif_IDH_Renda,
       i.IDH_Longevidade - (SELECT i2.IDH_Longevidade FROM indice i2 WHERE i2.CodMunicipio = m.CodMunicipio AND i2.Ano = 2000) AS Dif_IDH_Longevidade
FROM municipio m
JOIN estado e ON m.CodEstado = e.CodEstado
JOIN regiao r ON e.CodRegiao = r.CodRegiao
JOIN indice i ON m.CodMunicipio = i.CodMunicipio
WHERE e.NomeEstado = 'Bahia' AND (i.Ano = 1991 OR i.Ano = 2000);

10)

SELECT e.NomeEstado, i.Ano, AVG(i.IDH_Geral) AS Media_IDH_Geral, AVG(i.IDH_Educacao) AS Media_IDH_Educacao,
       AVG(i.IDH_Renda) AS Media_IDH_Renda, AVG(i.IDH_Longevidade) AS Media_IDH_Longevidade
FROM estado e
JOIN municipio m ON e.CodEstado = m.CodEstado
JOIN indice i ON m.CodMunicipio = i.CodMunicipio
WHERE (e.NomeEstado = 'Minas Gerais' OR e.NomeEstado = 'Bahia') AND (i.Ano = 1991 OR i.Ano = 2000)
GROUP BY e.NomeEstado, i.Ano;
