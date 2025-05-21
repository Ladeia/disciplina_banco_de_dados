 # 3-Média de municípios por Região e por Estado:
 
 use analises;
 
 # Por Regiões:
SELECT regiao.NomeRegiao, COUNT(municipio.CodMunicipio) / COUNT(DISTINCT estado.CodEstado) AS MediaPorEstado
FROM municipio
JOIN estado ON municipio.CodEstado = estado.CodEstado
JOIN regiao ON estado.CodRegiao = regiao.CodRegiao
GROUP BY regiao.NomeRegiao;

# Por Estados:
SELECT estado.NomeEstado, COUNT(municipio.CodMunicipio) AS TotalMunicipios
FROM municipio
JOIN estado ON municipio.CodEstado = estado.CodEstado
GROUP BY estado.NomeEstado;