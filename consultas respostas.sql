-- Gustavo Mirales
use analises;
-- 1 
select m.NomeMunicipio, e.CodRegiao from municipio m
join estado e on m.CodEstado = e.CodEstado
join regiao r on e.CodRegiao = r.CodRegiao  
where r.NomeRegiao <> 'Norte';
-- 2
select NomeMunicipio,COUNT(*) from municipio
group by NomeMunicipio
having count(NomeMunicipio)>1;


-- 3
select count(m.CodEstado)/5 as media_por_região from municipio m;
select count(m.CodEstado)/27 as media_por_estado from municipio m;

-- 4
select m.NomeMunicipio ,IDH_Longevidade from indice i
join municipio m on i.CodMunicipio= m.CodMunicipio
order by IDH_Longevidade desc
limit 1;

-- 5
select m.NomeMunicipio, IDH_Educacao,ano from indice i
join municipio m on i.CodMunicipio= m.CodMunicipio
where m.NomeMunicipio='salvador'
order by ano desc
limit 1;

-- 6
select m.NomeMunicipio, i.IDH_Renda  from indice i
join municipio m on i.CodMunicipio= m.CodMunicipio
order by IDH_Renda desc
limit 1;

-- 7
select e.NomeEstado from indice i
join municipio m on i.CodMunicipio= m.CodMunicipio
join estado e on m.CodEstado = e.CodEstado
where IDH_Geral>0.8
group by e.NomeEstado;

-- 8
select e.NomeEstado,max(IDH_Educacao) from indice i
join municipio m on i.CodMunicipio= m.CodMunicipio
join estado e on m.CodEstado = e.CodEstado
group by e.NomeEstado;

-- 9
select m.NomeMunicipio, i.* from indice i
join municipio m on i.CodMunicipio= m.CodMunicipio
join estado e on m.CodEstado = e.CodEstado
where e.SiglaEstado = "BA" and ano in(1991,2000);

-- 10

select e.NomeEstado,avg(IDH_Geral),avg(IDH_Renda),avg(IDH_Longevidade),avg(IDH_Educacao) from indice i
join municipio m on i.CodMunicipio= m.CodMunicipio
join estado e on m.CodEstado = e.CodEstado
where e.SiglaEstado in ('BA','MG') and ano in(1991,2000)
group by e.NomeEstado;
