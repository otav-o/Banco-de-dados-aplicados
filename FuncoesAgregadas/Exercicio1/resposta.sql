use seguros;

select * from carro;
select * from pessoa;
select * from participou;
select * from acidente;
select * from pertence;

-- 1)  	Recupere os dados dos motoristas que participaram de mais de uma ocorrência.
SELECT 
    m.*
FROM
    pessoa m
        NATURAL JOIN
    participou -- eu tinha feito a junção (a toa) com a tabela acidente!
GROUP BY m.id_motorista -- sem group by fica errado
HAVING COUNT(*) > 1;

SELECT 
    p.*, COUNT(*)
FROM
    pessoa p
        INNER JOIN
    participou part ON p.id_motorista = part.id_motorista
GROUP BY p.id_motorista
HAVING COUNT(*) > 1;

-- 2)  	Recupere todos os dados dos acidentes que tiveram o valor do dano maior que R$500,00.
SELECT 
    a.*
FROM
    acidente a
        NATURAL JOIN
    participou p
WHERE
    p.valor_dano > 500;
    
-- 3)  	Recupere o id, nome dos motoristas e o número da ocorrência, independente do motorista ter participado de algum acidente
SELECT 
    m.id_motorista, m.nome, p.numero_ocorrencia
FROM
    pessoa m
        NATURAL LEFT JOIN
    participou p;

-- 4)  	Recupere o valor total do dano causado por cada carro, juntamente com seu modelo, placa e ano.
SELECT 
    c.modelo, c.ano, SUM(p.valor_dano) AS 'valor total de dano'
FROM
    participou p
        NATURAL JOIN
    carro c
GROUP BY c.placa;

-- 5)  	Recupere os dados dos carros que não participaram de nenhum acidente.
SELECT 
    *
FROM
    carro
WHERE
    placa NOT IN (SELECT 
            placa
        FROM
            participou);
            
SELECT 
    c.*
FROM
    carro c
        NATURAL LEFT JOIN
    participou p
WHERE
    p.placa IS NULL;

-- 6) 	Recupere os dados do(s) carro(s) que teve(tiveram) o maior valor de dano, juntamente com o valor do dano.
/*SELECT 
    c.modelo, c.ano, MAX(p.valor_dano)
FROM
    carro c
        NATURAL JOIN
    participou p
GROUP BY c.placa
HAVING MAX(p.valor_dano);
*/

/*SELECT 
    c.*, valor_dano
FROM
    carro c
        NATURAL JOIN
    participou
ORDER BY valor_dano DESC
LIMIT 1; */ -- não pode pois, se houvesse mais de um carro com o maior valor, só mostraria um

SELECT 
    c.*, p.valor_dano
FROM
    carro c
        NATURAL JOIN
    participou p
WHERE
    p.valor_dano = (SELECT 
            MAX(valor_dano)
        FROM
            participou);


-- 7) 	Recupere os dados do(s) carro(s) que teve(tiveram) o menor valor de dano, juntamente com o valor do dano.
/*SELECT 
    c.modelo, c.ano, MIN(p.valor_dano)
FROM
    carro c
        NATURAL JOIN
    participou p
HAVING MIN(p.valor_dano);*/

SELECT 
    c.*, p.valor_dano
FROM
    carro c
        NATURAL JOIN
    participou p
WHERE
    p.valor_dano = (SELECT 
            MIN(valor_dano)
        FROM
            participou);

-- 8) 	Recupere as informações do(s) carro(s) que participou do maior número de ocorrências.
SELECT 
    c.*
FROM
    carro c
        NATURAL JOIN
    participou p
GROUP BY c.placa
HAVING MAX(COUNT(numero_ocorrencia));


select c.*
from carro c
natural join participou p
group by c.placa
having count(p.numero_ocorrencia) = max(SELECT 
    COUNT(p.numero_ocorrencia)
FROM
    carro c
        NATURAL JOIN
    participou p
GROUP BY c.placa);

SELECT 
    COUNT(p.numero_ocorrencia)
FROM
    carro c
        NATURAL JOIN
    participou p
GROUP BY c.placa;


SELECT 
    c.*
FROM
    (SELECT 
        c.*, COUNT(p.numero_ocorrencia)
    FROM
        carro c
    NATURAL JOIN participou p
    GROUP BY c.placa);










    