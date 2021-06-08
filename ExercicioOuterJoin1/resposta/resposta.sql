-- QUESTÃO 01: Traga o nome de todos os filmes, os que foram locados por algum cliente, traga também o nome do cliente.
-- Traga também o nome de todos os clientes os que locaram  ou não filmes, caso tenha locado o nome do filme deverá aparecer.(52 linhas retornadas)
use locadora;
select * from cliente;
select * from filme;
select * from locacao;
select * from genero;
select * from filme_genero;

SELECT 
    f.titulo, c.nome_cliente
FROM
    filme f
        LEFT JOIN
    locacao l ON f.codigo_filme = l.codigo_filme
        LEFT JOIN
    cliente c ON c.codigo_cliente = l.codigo_cliente;
    
SELECT 
    f.titulo, c.nome_cliente
FROM
    cliente c
        RIGHT JOIN
    locacao l ON c.codigo_cliente = l.codigo_cliente
        RIGHT JOIN
    filme f ON f.codigo_filme = l.codigo_filme 
UNION SELECT 
    f.titulo, c.nome_cliente
FROM
    cliente c
        LEFT JOIN
    locacao l ON c.codigo_cliente = l.codigo_cliente
        LEFT JOIN
    filme f ON f.codigo_filme = l.codigo_filme;

 -- QUESTÃO 02: Traga o nome dos gêneros que não estão em nenhum filme.(4 linhas retornadas)
 
select * from genero;
select * from filme_genero;
select * from filme;

 SELECT
    g.nome_genero
FROM
    genero g
        LEFT JOIN
    filme_genero fg ON fg.codigo_genero = g.codigo_genero
        LEFT JOIN
    filme f ON f.codigo_filme = fg.codigo_filme
WHERE
    f.codigo_filme IS NULL; -- correto
    
 SELECT
    g.nome_genero
FROM
    genero g
        LEFT JOIN
    filme_genero fg ON fg.codigo_genero = g.codigo_genero
WHERE
    fg.codigo_filme IS NULL; -- melhor forma de fazer (sugerido pela Gabriele)
    
    
-- QUESTÃO 03: Traga o nome de todos os diretores. Caso ele tenha dirigido algum filme, traga o nome do filme.(23 linhas retornadas)

select * from diretor;
select * from filme_diretor;
select * from filme;


SELECT 
    d.nome_diretor, f.titulo
FROM
    diretor d
        LEFT JOIN
    filme_diretor fd ON fd.codigo_diretor = d.codigo_diretor
        LEFT JOIN
    filme f ON fd.codigo_filme = f.codigo_filme;