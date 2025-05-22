-- 5 questao -- 
SELECT m.NomeMunicipio  Municipio, i.Ano, MAX(i.IDH_Educacao)  IndiceEducacao
FROM municipio m
JOIN indice i ON m.CodMunicipio = i.CodMunicipio
WHERE m.NomeMunicipio = 'Salvador' 
AND i.IDH_Educacao > 0.900
GROUP BY m.NomeMunicipio, i.Ano
ORDER BY i.Ano;
