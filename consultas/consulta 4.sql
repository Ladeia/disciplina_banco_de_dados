-- 4 questao --
SELECT   m.NomeMunicipio Municipio, i.IDH_Longevidade  IndiceLongevidade
FROM municipio m
JOIN indice i ON m.CodMunicipio = i.CodMunicipio
JOIN (SELECT MAX(IDH_Longevidade)  MaxLongevidade FROM indice)  
max_i ON i.IDH_Longevidade = max_i.MaxLongevidade;