-- Utilize o banco de dados seguros para executar as seguintes consultas:
use seguros;

-- 1)  	Crie e exiba uma visão que recupere a média dos valores dos danos ocorridos no estado RJ.
CREATE VIEW media_danos_RJ AS
    SELECT 
        AVG(p.valor_dano)
    FROM
        participou p
            INNER JOIN
        acidente a ON p.numero_ocorrencia = a.numero_ocorrencia
    WHERE
        a.local like '%RJ'; 
        
select * from media_danos_RJ;
        
-- 2)  	Crie e exiba uma visão que recupere o modelo e ano dos carros que se envolveram em acidentes no ano de 2011. OBS: Utilize a função (extract(year from data)).
CREATE VIEW carros_acidentes_2011 AS
    SELECT 
        c.modelo, c.ano
    FROM
        carro c
            INNER JOIN
        participou p ON c.placa = p.placa
            NATURAL JOIN
        acidente a
    WHERE
        (extract(year from data)) = 2011;

-- 3)  Crie e exiba uma visão que liste o nome dos proprietários de cada veículo, juntamente com o modelo do veículo.
CREATE VIEW dono_veiculo AS
    SELECT 
        pessoa.nome, c.modelo
    FROM
        pessoa
            INNER JOIN
        pertence p ON p.id_motorista = pessoa.id_motorista
            NATURAL JOIN
        carro c;

-- 4)  	Crie e exiba uma visão que liste todos os dados das pessoas que não se envolveram em nenhum acidente. Use NOT IN.
CREATE VIEW nao_acidentados AS
    SELECT 
        *
    FROM
        pessoa
    WHERE
        id_motorista NOT IN (SELECT 
                id_motorista
            FROM
                participou);
  
CREATE VIEW nao_acidentados_2 AS
    SELECT 
        pessoa.*
    FROM
        pessoa
            LEFT JOIN
        participou p ON p.id_motorista = pessoa.id_motorista
    WHERE
        p.id_motorista IS NULL;

-- 5)  	Crie e exiba uma visão que recupere os dados dos carros que se envolveram em nenhum ou no máximo 1 acidente. Ordenados pelo modelo do carro.
CREATE VIEW carros_ate_1_acidente AS
    SELECT 
        c.*, COUNT(*)
    FROM
        carro c
    WHERE
        c.placa NOT IN (SELECT 
                c.placa
            FROM
                carro c
                    NATURAL JOIN
                participou p
            HAVING COUNT(*) > 1)
	GROUP BY placa
    ORDER BY modelo; 
            
CREATE VIEW carros_ate_1_acidente_2 AS
    SELECT 
        c.*
    FROM
        carro c
            NATURAL LEFT JOIN
        participou p
    GROUP BY c.modelo
    HAVING COUNT(*) <= 1
    ORDER BY c.modelo;

-- 6)   Crie e exiba uma visão que recupere os dados dos acidentes com o maior valor de dano.
/*
SELECT 
    a.*, max(p.valor_dano)
FROM
    acidente a
        NATURAL JOIN
    participou p
GROUP BY a.numero_ocorrencia
HAVING MAX(p.valor_dano);
-- errado!
*/
CREATE VIEW acidentes_maior_dano AS
    SELECT 
        a.*, MAX(p.valor_dano)
    FROM
        acidente a
            NATURAL JOIN
        participou p
    HAVING MAX(p.valor_dano);
-- conferir se está certo

-- 7)   Crie e exiba uma visão que recupere os dados dos acidentes com o menor valor de dano.
CREATE VIEW acidentes_menor_dano AS
    SELECT 
        a.*, MIN(p.valor_dano)
    FROM
        acidente a
            NATURAL JOIN
        participou p
    HAVING MIN(p.valor_dano);
-- conferir

-- 8)   Crie e exiba uma visão que recupere a data em que os carros do modelo Fiat Uno se envolveram em acidentes.
select * from acidente;
select * from carro;
select * from participou;

CREATE VIEW datas_acidentes_fiat_uno AS
    SELECT 
        a.data
    FROM
        carro c
            NATURAL JOIN
        participou p
            NATURAL JOIN
        acidente a
    WHERE
        c.modelo = 'Fiat Uno';
        
select * from datas_acidentes_fiat_uno;

-- 9)   Crie e exiba uma visão que recupere o modelo do carro, o local do acidente e o número de ocorrência dos acidentes
CREATE VIEW carro_local_acidente AS
    SELECT 
        c.modelo, a.local, p.numero_ocorrencia
    FROM
        carro c
            NATURAL JOIN
        participou p
            NATURAL JOIN
        acidente a;

-- 10)   Crie e exiba uma visão que recupere o número total de carros que se envolveram em acidentes.
CREATE VIEW quantidade_carros_acidentados AS
    SELECT 
        COUNT(DISTINCT c.placa)
    FROM
        carro c
            NATURAL JOIN
        participou p;

-- 11)   Crie e exiba uma visão que recupere a soma, a média, o valor mínimo e o valor máximo do valor do dano ocasionado por cada veículo.
CREATE VIEW dados_valor_dano AS
    SELECT 
        SUM(p.valor_dano),
        AVG(p.valor_dano),
        MIN(p.valor_dano),
        MAX(p.valor_dano)
    FROM
        participou p
    GROUP BY p.placa; -- sem os dados do carro, parece-me uma consulta inútil 

-- 12)   Crie e exiba uma visão que recuperar todos os dados do acidente mais antigo.
CREATE VIEW acidentes_mais_antigos AS
    SELECT 
        *
    FROM
        acidente
    HAVING MIN(data);
-- não usar group by

-- 13)   Crie e exiba uma visão que recuperar os dados do carro mais antigo que se envolveu em algum acidente.

select * from acidente;
select * from participou;
select * from carro;
SELECT 
    c.*, a.data
FROM
    carro c
        NATURAL JOIN
    participou p
        NATURAL JOIN
    acidente a
HAVING MIN(a.data);
-- errado (?)

-- 14)   Crie e exiba uma visão que recuperar os dados do carro mais novo que se envolveu em algum acidente.
SELECT 
    c.*
FROM
    carro c
        NATURAL JOIN
    participou p
HAVING MIN(c.ano);

-- 15)   Crie e exiba uma visão que recupere todos os dados dos carros que não se envolveram em nenhum acidente. Use NOT IN.

SELECT 
    c.*
FROM
    carro c
WHERE
    c.placa NOT IN (SELECT 
            placa
        FROM
            participou);
