USE analises;

SELECT 
    m.NomeMunicipio, 
    e.NomeEstado, 
    i.IDH_Longevidade
FROM 
    indice i
JOIN 
    municipio m ON i.CodMunicipio = m.CodMunicipio
JOIN 
    estado e ON m.CodEstado = e.CodEstado
JOIN 
    regiao r ON e.CodRegiao = r.CodRegiao
WHERE 
    i.IDH_Longevidade = (
        SELECT MAX(IDH_Longevidade)
        FROM indice
    );