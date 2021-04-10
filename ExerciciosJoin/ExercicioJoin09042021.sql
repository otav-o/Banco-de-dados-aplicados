-- QUESTÃO 01: Recupere  os dados dos autores que publicaram livros pela editora Pearson no ano de 2014.(1 linha retornada)

use livraria;

select * from autor;
select * from autoria;
select * from livro;
select * from cliente;
select * from vendas;

SELECT 
    a.*
FROM
    autor a,
    autoria au,
    livro l
WHERE
    a.numautor = au.numautor
        AND au.numlivro = l.numlivro
        AND l.nomeeditora = 'Pearson'
        AND l.anopub = 2014;
 
SELECT 
    a.*
FROM
    autor a
        INNER JOIN
    autoria au ON a.numautor = au.numautor
        INNER JOIN
    livro l ON au.numlivro = l.numlivro
WHERE
    l.nomeeditora = 'Pearson'
        AND l.anopub = 2014;
        
SELECT 
    a.*
FROM
    autor a
        NATURAL JOIN
    autoria
        NATURAL JOIN
    livro l
WHERE
    l.nomeeditora = 'Pearson'
        AND l.anopub = 2014;
        
-- QUESTÃO 02: Recupere  os dados dos clientes que não efetuaram nenhuma compra. Utilize not in no SQL e o operador de subtração na álgebra relacional.(8 linhas retornadas)

SELECT 
    *
FROM
    cliente
WHERE
    numcli NOT IN (SELECT 
            numcli -- só precisa da tabela vendas na subconsulta
        FROM
            vendas); -- outra forma: junção externa
            
-- QUESTÃO 03: Recupere os dados dos livros que não foram vendidos. Utilize not in no SQL e o operador de subtração na álgebra relacional. (1 linha retornada)
SELECT 
    *
FROM
    livro
WHERE
    numlivro NOT IN (SELECT 
            numlivro
        FROM
            vendas v);
            
-- QUESTÃO 04: Recupere o nome dos clientes com os nomes dos livros que eles compraram e data e o preço da compra. Ordene do maior preço para o menor. (19 linhas retornadas)

SELECT 
    cli.nomecli, l.nomelivro, v.data, v.preco
FROM
    cliente cli,
    livro l,
    vendas v
WHERE
    cli.numcli = v.numcli
        AND l.numlivro = v.numlivro
ORDER BY v.preco DESC; -- não tem como ordenar na álgebra relacional

SELECT 
    cli.nomecli, l.nomelivro, v.data, v.preco
FROM
    cliente cli
        INNER JOIN
    vendas v ON cli.numcli = v.numcli
        INNER JOIN
    livro l ON l.numlivro = v.numlivro
ORDER BY v.preco DESC;


SELECT 
    cli.nomecli, l.nomelivro, v.data, v.preco
FROM
    cliente cli
        NATURAL JOIN
    vendas v
        NATURAL JOIN
    livro l
ORDER BY v.preco DESC;

-- QUESTÃO 05: Recupere o nome de todos os livros que foram vendidos. Elimine os resultados repetidos. Ordene alfabeticamente. (8 linhas retornadas)

SELECT DISTINCT
    l.nomelivro
FROM
    livro l,
    vendas v
WHERE
    l.numlivro = v.numlivro
ORDER BY l.nomelivro;


SELECT DISTINCT
    l.nomelivro
FROM
    livro l
        INNER JOIN
    vendas v ON l.numlivro = v.numlivro
ORDER BY l.nomelivro;


SELECT DISTINCT
    l.nomelivro
FROM
    livro l
        NATURAL JOIN
    vendas v
ORDER BY l.nomelivro;

-- fim