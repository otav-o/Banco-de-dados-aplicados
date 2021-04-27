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
    participou -- tinha feito a junção (a toa) com a tabela acidente!
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

-- 4)  	Recupere o valor total do dano causado por cada carro, juntamente com sua marca, placa e ano.
SELECT 
    c.modelo, c.ano, SUM(p.valor_dano) AS 'valor total de dano'
FROM
    participou p
        NATURAL JOIN
    carro c
GROUP BY c.placa;




    