#  Quais estados possuem municípios com IDH geral maior que 0,8
SELECT DISTINCT 
  estado.NomeEstado AS "Estado"
FROM indice
JOIN municipio ON indice.CodMunicipio = municipio.CodMunicipio
JOIN estado ON municipio.CodEstado = estado.CodEstado
WHERE indice.IDH_Geral > 0.8;