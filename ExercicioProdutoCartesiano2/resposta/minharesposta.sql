use empresa;
select * from funcionario;
select * from dependente;
select * from departamento;
select * from projeto;

-- a) Selecione o pnome e nome de todos os funcionários que tem filho como dependente.

SELECT 
    f.pnome, f.nome, d.nome_dependente
FROM
    funcionario f,
    dependente d
WHERE
    d.fcpf = f.cpf;

-- b) Selecione o nome do funcionário e o nome do departamento ao qual ele está alocado.

SELECT 
    f.pnome, f.nome, dep.nome
FROM
    funcionario f,
    departamento dep
WHERE
    f.dnr = dep.dnumero;
    
-- d) Selecione o pnome, nome e projnome de todos os funcionários que trabalham no projeto de Informatização.

SELECT 
    f.pnome, f.nome, proj.projnome
FROM
    funcionario f,
    projeto proj,
    trabalha_em t
WHERE
    t.fcpf = f.cpf
        AND t.pnr = proj.projnumero
        AND proj.projnome = 'Informatização';

-- e) Selecione o pnome, nome e projnome dos funcionários que trabalham mais de 20 horas.

SELECT 
    f.pnome, f.nome, proj.projnome, t.horas
FROM
    funcionario f,
    projeto proj,
    trabalha_em t
WHERE
    t.horas > 20 AND t.fcpf = f.cpf
        AND t.pnr = proj.projnumero;
        
-- f) Selecione o pnome, nome e cpf do funcionário gerente do departamento Matriz.

SELECT 
    f.pnome, f.nome, f.cpf
FROM
    funcionario f,
    departamento dep
WHERE
    f.cpf = dep.cpf_gerente
        AND dep.nome = 'Matriz';