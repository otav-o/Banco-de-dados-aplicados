-- recupere o nome dos funcionários que trabalham no departamento de pesquisa
use empresa;
select * from funcionario;
select * from departamento;
select * from dependente;

SELECT 
    f.nome
FROM
    funcionario f,
    departamento d
WHERE
    f.dnr = d.dnumero
        AND d.nome = 'Pesquisa';
        
SELECT  -- teste
    f.nome
FROM
    funcionario f,
    departamento d
WHERE
    f.dnr IN (SELECT 
            dnumero
        FROM
            departamento
        WHERE
            nome = 'Pesquisa');
            
            
SELECT 
    nome
FROM
    funcionario
WHERE
    dnr = (SELECT 
            dnumero
        FROM
            departamento
        WHERE
            nome = 'Pesquisa');
            
            
-- Recupere o nome dos funcionários que trabalham para o departamento de pesquisa ou matriz
SELECT 
    pnome, f.nome
FROM
    funcionario f,
    departamento d
WHERE
    (d.nome = 'Pesquisa' OR d.nome = 'Matriz')
        AND d.dnumero = f.dnumero;
        
SELECT 
    pnome, f.nome
FROM
    funcionario f,
    departamento d
WHERE
    dnumero IN (SELECT 
            dnumero
        FROM
            departamento
        WHERE
            nome = 'Pesquisa' OR nome = 'Matriz');

-- Recupere o nome dos funcionários que não possuem dependentes
	-- funcionário que não tem dependente não possui cpf na tabela de dependentes. Não possui uma coluna cpf_dependente, não dá para usar o null neste momento (somente com junção externa)
-- where cpf != fcpf; não pode. O produto cartesiano testa todas as combinações, e ele retornaria todos os que não são dependentes - query inútil
SELECT 
    pnome, nome
FROM
    funcionario f
WHERE
    cpf NOT IN (SELECT 
            fcpf
        FROM
            dependente);

-- Recupere todas as informações dos funcionários. Ordenar alfabeticamente
SELECT 
    *
FROM
    funcionario
ORDER BY pnome, nome, salario ASC;

-- Recupere todas as inrormações dos funcionários que trabalham no departamento 5, ordenando pelo que ganha mais

select * from funcionario
where dnr = 5
order by salario desc; -- do maior para o menor


-- Recupere os dados do(s) funcionário(s) que não trabalham em nenhum projeto
SELECT 
    f.*
FROM
    funcionario f
WHERE
    f.cpf NOT IN (SELECT DISTINCT
            fcpf
        FROM
            trabalha_em);
            
/*SELECT 
    *
FROM
    funcionario f
WHERE
    NOT EXISTS( SELECT 
            1
        FROM
            trabalha_em te
        WHERE
            te.fcpf = f.cpf) */