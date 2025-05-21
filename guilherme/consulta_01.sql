# 1- Municípios que não pertencem a região norte:
USE analises;
SELECT
    municipio.NomeMunicipio,
    regiao.NomeRegiao
FROM
    municipio
JOIN
    estado ON municipio.CodEstado = estado.CodEstado
JOIN
    regiao ON estado.CodRegiao = regiao.CodRegiao
WHERE
    regiao.NomeRegiao != 'Norte';
    



