USE analises;

SELECT 
    m.NomeMunicipio,
    i.IDH_Renda
FROM 
    municipio m
JOIN 
    indice i ON m.CodMunicipio = i.CodMunicipio
WHERE 
    i.IDH_Renda = (
        SELECT MAX(IDH_Renda)
        FROM indice
    );