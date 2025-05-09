USE analises;

SELECT 
    AVG(TotalDeMunicipiosPorEstado) as MediaDeMunicipiosPorEstado
FROM (
    SELECT 
        e.CodEstado, 
        COUNT(m.CodMunicipio) as TotalDeMunicipiosPorEstado
    FROM 
        municipio m 
    JOIN 
        estado e ON m.CodEstado = e.CodEstado
    GROUP BY 
        e.CodEstado
) as ConsultaDaMediaPorEstado;

SELECT 
    AVG(TotalDeMunicipiosPorRegiao) as MediaDeMunicipiosPorRegiao
FROM (
    SELECT 
        r.CodRegiao, 
        COUNT(m.CodMunicipio) as TotalDeMunicipiosPorRegiao
    FROM 
        municipio m
    JOIN 
        estado e ON m.CodEstado = e.CodEstado
    JOIN 
        regiao r ON e.CodRegiao = r.CodRegiao
    GROUP BY 
        r.CodRegiao
) as ConsultaDaMediaPorRegiao;