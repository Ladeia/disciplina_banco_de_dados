	#CONSULTA 10

	use analises;

	 SELECT 
		NomeEstado,
		NomeMunicipio,
		IDH_Geral,
		IDH_Educacao,
		IDH_Longevidade,
		IDH_Renda,
		Ano
	FROM
		estado e
			JOIN
		municipio m ON m.CodEstado = e.CodEstado
			JOIN
		indice i ON i.CodMunicipio = m.CodMunicipio
	WHERE
		(Ano BETWEEN 1991 AND 2000)
			AND (NomeEstado IN ('Bahia' , 'Minas Gerais'))
	GROUP BY NomeEstado , NomeMunicipio , IDH_Geral , IDH_Educacao , IDH_Longevidade , IDH_Renda , Ano;



