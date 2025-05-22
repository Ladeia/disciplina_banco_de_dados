-- 6 questao -- 
SELECT   m.NomeMunicipio Municipio, i.Ano, i.IDH_Renda IndiceRenda
FROM municipio  m
JOIN indice  i ON m.CodMunicipio = i.CodMunicipio
ORDER BY i.IDH_Renda DESC
LIMIT 1;