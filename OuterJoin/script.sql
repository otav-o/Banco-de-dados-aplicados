-- Recupere o nome e sobrenome de todos os funcionários. Caso ele esteja asociado a algum departamento, traga o nome do departamento
use empresa;

SELECT 
    f.pnome, f.nome, d.nome
FROM
    funcionario f
        LEFT JOIN
    departamento d ON f.dnr = d.dnumero;
    
    
-- Recuperar todas as informações dos departamentos. Caso ele tenha algum funcionário associado a ele, traga o nome do funcionário
SELECT 
    d.nome, f.pnome, f.nome
FROM
    funcionario f
        RIGHT OUTER JOIN
    departamento d ON f.dnr = d.dnumero;
    
    
-- ----
SELECT 
    d.nome, f.pnome, f.nome
FROM
    funcionario f
        LEFT JOIN
    departamento d ON f.dnr = d.dnumero 
UNION SELECT 
    d.nome, f.pnome, f.nome
FROM
    funcionario f
        RIGHT JOIN
    departamento d ON f.dnr = d.dnumero;
    
-- Recupere o nome e sobrenome dos funcionários que não possuem dependentes
SELECT 
    f.pnome, f.nome, d.nome_dependente
FROM
    funcionario f
        LEFT JOIN
    dependente d ON f.cpf = d.fcpf
WHERE
    d.nome_dependente IS NULL; -- serve qualquer coluna
    
    -- inner join com o left join: basta colocar IS NOT NULL
