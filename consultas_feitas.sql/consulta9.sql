#CONSULTA 9

use analises;
 
 SELECT 
    NomeEstado,
    NomeMunicipio,
    IDH_Geral,
    IDH_Educacao,
    IDH_Longevidade,
    IDH_Renda,
    TRUNCATE((SELECT 
                IDH_Geral
            FROM
                indice i
            WHERE
                Ano = '2000'
                    AND i.CodMunicipio = m.CodMunicipio) - (SELECT 
                IDH_Geral
            FROM
                indice i
            WHERE
                Ano = '1991'
                    AND i.CodMunicipio = m.CodMunicipio),
        3) AS Diferença_Idh_Geral,
    TRUNCATE((SELECT 
                IDH_Educacao
            FROM
                indice i
            WHERE
                Ano = '2000'
                    AND i.CodMunicipio = m.CodMunicipio) - (SELECT 
                IDH_Educacao
            FROM
                indice i
            WHERE
                Ano = '1991'
                    AND i.CodMunicipio = m.CodMunicipio),
        3) AS Diferença_Idh_Educacao,
    TRUNCATE((SELECT 
                IDH_Longevidade
            FROM
                indice i
            WHERE
                Ano = '2000'
                    AND i.CodMunicipio = m.CodMunicipio) - (SELECT 
                IDH_Longevidade
            FROM
                indice i
            WHERE
                Ano = '1991'
                    AND i.CodMunicipio = m.CodMunicipio),
        3) AS Diferença_Idh_Longevidade,
    TRUNCATE((SELECT 
                IDH_Renda
            FROM
                indice i
            WHERE
                Ano = '2000'
                    AND i.CodMunicipio = m.CodMunicipio) - (SELECT 
                IDH_Renda
            FROM
                indice i 
            WHERE
                Ano = '1991'
                    AND i.CodMunicipio = m.CodMunicipio),
        3) AS Diferença_Idh_Renda,
        Ano
FROM
    estado e
        JOIN
    municipio m ON m.CodEstado = e.CodEstado
        JOIN
    indice i ON i.CodMunicipio = m.CodMunicipio
WHERE
    (Ano BETWEEN 1991 AND 2000)
        AND (NomeEstado = 'Bahia')
GROUP BY NomeEstado , NomeMunicipio , IDH_Geral , IDH_Educacao , IDH_Longevidade , IDH_Renda , Diferença_Idh_Geral , Diferença_Idh_Educacao , Diferença_Idh_Longevidade , Diferença_Idh_Renda, Ano;
