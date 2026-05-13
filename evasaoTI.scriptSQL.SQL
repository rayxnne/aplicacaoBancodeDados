-- Projeto Evasão Cursos de TI
CREATE DATABASE ProjetoEvasaoTI;
USE ProjetoEvasaoTI;
show databases;

CREATE TABLE cursos_ti (
    nu_ano_censo INT,
    no_regiao VARCHAR(50),
    sg_uf VARCHAR(2),
    no_curso VARCHAR(255),
    qt_ing_total INT,
    qt_conc_total INT,
    qt_aluno_desistente INT,
    qt_aluno_matriculado INT
);

-- Consultas
-- 1. Visão geral dos registros
select *
from cursos_ti;


-- 2. Totais gerais macro(ingressantes, desistentes, concluintes)
select sum(qt_ing_total) as Ingressantes, sum(qt_aluno_desistente) as Desistentes, sum(qt_conc_total) as Concluíntes
from cursos_ti;


-- 3. Cursos disponíveis
select distinct no_curso as Cursos
from cursos_ti
order by Cursos;


-- 4. Estados e regiões
select distinct no_regiao as Região, sg_uf as UF
from cursos_ti
order by sg_uf;


-- 5. Evasão vs Conclusão por estado
select sum(qt_aluno_desistente) as Desistentes, sum(qt_conc_total) as Concluíntes, sg_uf as UF
from cursos_ti
group by sg_uf
order by sg_uf desc;


-- 6. Soma geral do país
select sum(qt_aluno_matriculado) as "Total Matriculados no Brasil"
from cursos_ti;


-- 7. Desistentes agrupados por curso
select sum(qt_aluno_desistente) as Desistentes, no_curso as Curso
from cursos_ti
group by no_curso;


-- 8. Ranking de desistências por estado
select sum(qt_aluno_desistente) as Desistentes, sg_uf as UF
from cursos_ti
group by sg_uf
order by Desistentes desc;


-- 9. Desistentes agrupados por região
select sum(qt_aluno_desistente) as Desistentes, no_regiao as Região
from cursos_ti
group by no_regiao;


-- 10. Qual curso evade mais em cada estado
select no_curso as Curso, sg_uf as UF, sum(qt_aluno_desistente) as Desistentes
from cursos_ti
group by UF, Curso
order by sg_uf, Desistentes; 


-- 11. Melhor e pior região em numeros de conclusão
select sum(qt_conc_total) as Concluíntes, no_regiao as Região
from cursos_ti
group by Região 
order by Concluíntes asc
limit 1; 

select sum(qt_conc_total) as Concluíntes, no_regiao as Região
from cursos_ti
group by Região
order by Concluíntes desc
limit 1;


-- 13. Estados em que menos se formam alunos
select sg_uf as UF, sum(qt_conc_total) as Concluíntes
from cursos_ti
group by UF 
order by Concluíntes
limit 3;


-- 14. Estados em que mais se formam alunos
select sg_uf as UF, sum(qt_conc_total) as Concluíntes
from cursos_ti
group by UF
order by Concluíntes desc
limit 3;

