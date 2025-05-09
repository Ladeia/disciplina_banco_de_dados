USE analises;

SELECT 
    m.NomeMunicipio,
    i.IDH_Educacao,
    i.Ano
FROM 
    municipio m
JOIN 
    indice i ON m.CodMunicipio = i.CodMunicipio
WHERE 
    m.NomeMunicipio = 'Salvador'
    AND i.IDH_Educacao = (
        SELECT MAX(IDH_Educacao)
        FROM indice
        WHERE CodMunicipio = m.CodMunicipio
    );