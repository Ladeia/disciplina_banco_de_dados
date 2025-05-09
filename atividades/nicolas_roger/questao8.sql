USE analises;

SELECT 
  e.NomeEstado,
  MAX(i.IDH_Educacao) as Maior_IDH_Educacao
FROM estado e
JOIN municipio m ON e.CodEstado = m.CodEstado
JOIN indice i ON m.CodMunicipio = i.CodMunicipio
GROUP BY e.NomeEstado;