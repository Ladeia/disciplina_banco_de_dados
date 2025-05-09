/*1 - Municípios que não pertencem a região norte*/
	SELECT m.NomeMunicipio
	FROM municipio m
	JOIN estado e ON m.CodEstado = e.CodEstado
	JOIN regiao r ON e.CodRegiao = r.CodRegiao
	WHERE r.NomeRegiao != 'Norte';
    
/*2 - Municípios que possuem o mesmo nome*/
	SELECT * FROM municipio m1
	WHERE EXISTS (
	  SELECT 1
	  FROM municipio m2
	  WHERE m2.NomeMunicipio = m1.NomeMunicipio
		AND m2.CodMunicipio <> m1.CodMunicipio
	)
    GROUP BY NomeMunicipio
    ORDER BY NomeMunicipio;


/*3 - Média de municípios por Região e por Estado*/
	SELECT r.NomeRegiao, 
		   COUNT(m.CodMunicipio) AS TotalMunicipios,
		   COUNT(m.CodMunicipio) / COUNT(DISTINCT e.CodEstado) AS MediaMunicipiosPorEstado
	FROM regiao r
	JOIN estado e ON r.CodRegiao = e.CodRegiao
	JOIN municipio m ON e.CodEstado = m.CodEstado
	GROUP BY r.CodRegiao, r.NomeRegiao;

/*4 - Município com as pessoas mais idosas*/
	SELECT m.NomeMunicipio, e.NomeEstado, i.Ano, i.IDH_Longevidade
	FROM indice i
	JOIN municipio m ON i.CodMunicipio = m.CodMunicipio
	JOIN estado e ON m.CodEstado = e.CodEstado
	WHERE i.IDH_Longevidade = (
	  SELECT MAX(IDH_Longevidade)
	  FROM indice
	);

/*5 - Ano em que Salvador obteve o melhor índice de Instrução*/
	SELECT i.Ano, i.IDH_Educacao
	FROM indice i
	JOIN municipio m ON i.CodMunicipio = m.CodMunicipio
	WHERE m.NomeMunicipio = 'Salvador'
	ORDER BY i.IDH_Educacao DESC
	LIMIT 1;

/*6 - Qual o município com a melhor distribuição de renda*/
	SELECT m.NomeMunicipio, e.NomeEstado, i.Ano, i.IDH_Renda
	FROM indice i
	JOIN municipio m ON i.CodMunicipio = m.CodMunicipio
	JOIN estado e ON m.CodEstado = e.CodEstado
	WHERE i.IDH_Renda = (
	  SELECT MAX(IDH_Renda)
	  FROM indice
	);

/*7 - Quais estados possuem municípios com IDH geral maior que 0,8*/
	SELECT DISTINCT e.NomeEstado, e.SiglaEstado
	FROM estado e
	JOIN municipio m ON e.CodEstado = m.CodEstado
	JOIN indice i ON m.CodMunicipio = i.CodMunicipio
	WHERE i.IDH_Geral > 0.8
	ORDER BY e.NomeEstado;

/*8 - Qual o maior IDH de educação por estado*/
	SELECT 
	  e.NomeEstado, 
	  e.SiglaEstado,
	  MAX(i.IDH_Educacao) AS Maior_IDH_Educacao
	FROM estado e
	JOIN municipio m ON e.CodEstado = m.CodEstado
	JOIN indice i ON m.CodMunicipio = i.CodMunicipio
	GROUP BY e.CodEstado, e.NomeEstado, e.SiglaEstado
	ORDER BY Maior_IDH_Educacao DESC;

/*9- Relatório de Todos IDHs da Bahia de 91 e 2000, inclusive com a diferença entre os mesmos*/
	SELECT 
	  m.NomeMunicipio,
	  i91.IDH_Geral AS IDH_1991,
	  i2000.IDH_Geral AS IDH_2000,
	  ROUND(i2000.IDH_Geral - i91.IDH_Geral, 4) AS Diferenca_IDH
	FROM municipio m
	JOIN estado e ON m.CodEstado = e.CodEstado
	JOIN indice i91 ON m.CodMunicipio = i91.CodMunicipio AND i91.Ano = 1991
	JOIN indice i2000 ON m.CodMunicipio = i2000.CodMunicipio AND i2000.Ano = 2000
	WHERE e.NomeEstado = 'Bahia'
	ORDER BY Diferenca_IDH DESC;
/*Questao 9 pela aula*/
	SELECT * FROM indice i
    JOIN municipio m on m.CodMunicipio = i.CodMunicipio
    JOIN estado e on e.CodEstado = m.CodEstado
    WHERE e.NomeEstado = 'Bahia';

/*10 - Relatório comparativo entre as médias dos IDHs de MG e BA, de 2000 e 91*/
	SELECT 
	  e.SiglaEstado,
	  i.Ano,
	  ROUND(AVG(i.IDH_Geral), 4) AS Media_IDH_Geral,
	  ROUND(AVG(i.IDH_Educacao), 4) AS Media_IDH_Educacao,
	  ROUND(AVG(i.IDH_Renda), 4) AS Media_IDH_Renda,
	  ROUND(AVG(i.IDH_Longevidade), 4) AS Media_IDH_Longevidade
	FROM indice i
	JOIN municipio m ON i.CodMunicipio = m.CodMunicipio
	JOIN estado e ON m.CodEstado = e.CodEstado
	WHERE e.SiglaEstado IN ('MG', 'BA') AND i.Ano IN (1991, 2000)
	GROUP BY e.SiglaEstado, i.Ano
	ORDER BY e.SiglaEstado, i.Ano;
