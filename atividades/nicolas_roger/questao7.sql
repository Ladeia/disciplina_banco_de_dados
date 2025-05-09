USE analises;

SELECT DISTINCT 
    e.NomeEstado
FROM 
    estado e
JOIN 
    municipio m ON e.CodEstado = m.CodEstado
JOIN 
    indice i ON m.CodMunicipio = i.CodMunicipio
WHERE 
    i.IDH_Geral > 0.8;