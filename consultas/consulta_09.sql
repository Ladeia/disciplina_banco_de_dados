/*9- Relatório de Todos IDHs da Bahia de 91 e 2000, inclusive com a
diferença entre os mesmos*/

USE analises;

SELECT e.NomeEstado Estado,
m.NomeMunicipio Municipio,

-- IDH GERAL

i91.IDH_Geral IndiceGeral_91,
i00.IDH_Geral IndiceGeral_00,
ROUND((i00.IDH_Geral - i91.IDH_Geral), 4) DiferencaIDH_Geral,

-- IDH RENDA
  
i91.IDH_Renda IndiceRenda_91,
i00.IDH_Renda IndiceRenda_00,
ROUND((i00.IDH_Renda - i91.IDH_Renda), 4) DiferencaIDH_Renda,

-- IDH LONGEVIDADE
  
i91.IDH_Longevidade IndiceLongevidade_91,
i00.IDH_Longevidade IndiceLongevidade_00,
ROUND((i00.IDH_Longevidade - i91.IDH_Longevidade), 4) DiferencaIDH_Longevidade,
  
-- IDH EDUCACAO
  
i91.IDH_Educacao IndiceEducacao_91,
i00.IDH_Educacao IndiceEducacao_00,
ROUND((i00.IDH_Educacao - i91.IDH_Educacao), 4) DiferencaIDH_Educacao

FROM municipio m
JOIN estado e
ON m.CodEstado = e.CodEstado
JOIN indice i91 
ON i91.CodMunicipio = m.CodMunicipio 
AND i91.Ano = 1991
JOIN indice i00
ON i00.CodMunicipio = m.CodMunicipio 
AND i00.Ano = 2000
WHERE e.NomeEstado = "Bahia" 
ORDER BY m.NomeMunicipio;
