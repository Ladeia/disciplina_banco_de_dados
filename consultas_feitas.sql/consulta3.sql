#CONSULTA 3 ---- IDH DE ESTADO
use analises;

SELECT 
   NomeEstado, truncate (AVG(i.IDH_Geral), 3) as Media_Estado
FROM
    regiao r
        JOIN
    estado e ON e.CodRegiao = r.CodRegiao
        JOIN
    municipio m ON m.CodEstado = e.CodEstado
        JOIN
    indice i ON i.CodMunicipio = m.CodMunicipio
GROUP BY NomeEstado
ORDER BY NomeEstado;

################################################################################################

#CONSULTA 3 --------- IDH DAS REGIÕES
use analises;

SELECT 
   NomeRegiao, truncate (AVG(i.IDH_Geral), 3) as Media_Região
FROM
    regiao r
        JOIN
    estado e ON e.CodRegiao = r.CodRegiao
        JOIN
    municipio m ON m.CodEstado = e.CodEstado
        JOIN
    indice i ON i.CodMunicipio = m.CodMunicipio
GROUP BY NomeRegiao
ORDER BY NomeRegiao;





