use empresa;
select * from funcionario;
select * from departamento;
-- Achar a soma dos salários de todos os funcionários, o salário máximo, o mínimo e a média de todos.

SELECT 
    ROUND(SUM(salario), 2) AS Soma,
    MAX(salario) AS Maior,
    MIN(salario) AS Menor,
    TRUNCATE(AVG(salario), 2) AS Media
FROM
    funcionario;
    
    -- truncamento corta o valor; arredondamento eleva ou diminui. Segundo parâmetro é o número de casas decimais
    
SELECT 
    sexo,
    ROUND(SUM(salario), 2) AS Soma,
    MAX(salario) AS Maior,
    MIN(salario) AS Menor,
    TRUNCATE(AVG(salario), 2) AS Media
FROM
    funcionario
GROUP BY sexo;

SELECT 
    dnr,
    ROUND(SUM(salario), 2) AS Soma,
    MAX(salario) AS Maior,
    MIN(salario) AS Menor,
    TRUNCATE(AVG(salario), 2) AS Media
FROM
    funcionario
GROUP BY dnr;


select count(*) -- cuidado pois não conta se a coluna estiver nula
from funcionario;

SELECT 
    COUNT(*)
FROM
    funcionario f
        INNER JOIN
    departamento d on f.dnr = d.dnumero
WHERE
    d.nome = 'Pesquisa';
    
    
-- Recuperar a quantidade de dependentes que cada funcionário possui
SELECT 
    pnome, nome, COUNT(*)
FROM
    funcionario
        INNER JOIN
    dependente ON cpf = fcpf
GROUP BY cpf; -- pode agrupar por qualquer coluna, mas cuidado: pnome, por exemplo, pode ser repetição. Uma boa ideia é agrupar pela PK

-- Recuperar o nome dos funcionarios que possuem dois ou mais dependentes
SELECT 
    pnome, nome, COUNT(*)
FROM
    funcionario
        INNER JOIN
    dependente ON cpf = fcpf
WHERE
    (SELECT 
            COUNT(*)
        FROM
            dependente
        GROUP BY fcpf) >= 2
GROUP BY cpf;


SELECT 
    pnome, nome, COUNT(*)
FROM
    funcionario
        INNER JOIN
    dependente ON cpf = fcpf
GROUP BY cpf
HAVING COUNT(*) >= 2;

-- having é obrigatório para condições com as funções de agregação. E fica depois de group by

-- Recupere a quantidade de funcionários que possuem 2 ou mais dependentes

SELECT 
    COUNT(*)
FROM
    funcionario
WHERE
    cpf IN (SELECT 
            cpf
        FROM
            funcionario
                INNER JOIN
            dependente ON cpf = fcpf
        GROUP BY cpf
        HAVING COUNT(*) >= 2);

 SELECT 
    COUNT(*)
FROM
    (SELECT 
        cpf
    FROM
        funcionario
    INNER JOIN dependente ON cpf = fcpf
    GROUP BY cpf
    HAVING COUNT(*) >= 2) AS contagem;       
    
    
    
-- Recupere o número de dependentes de cada funcionário
SELECT 
    pnome, nome, COUNT(*)
FROM
    funcionario
        INNER JOIN
    dependente ON cpf = fcpf
GROUP BY pnome, nome;
-- cuidado: sem o group by, o resultado fica errado


-- Para cada departamento, recuperar o número do departamento, o número de funcionários do departamento e o salário médio

select * from departamento;
select * from funcionario;

SELECT 
    dnr, COUNT(*), AVG(salario)
FROM
    funcionario
WHERE
    dnr IS NOT NULL
GROUP BY dnr;
