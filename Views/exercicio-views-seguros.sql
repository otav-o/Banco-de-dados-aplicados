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
select * from acidente;
select * from carro;
select * from participou;

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
-- 7)   Crie e exiba uma visão que recupere os dados dos acidentes com o menor valor de dano.
-- 8)   Crie e exiba uma visão que recupere a data em que os carros do modelo Fiat Uno se envolveram em acidentes.
-- 9)   Crie e exiba uma visão que recupere o modelo do carro, o local do acidente e o número de ocorrência dos acidentes
-- 10)   Crie e exiba uma visão que recupere o número total de carros que se envolveram em acidentes.
-- 11)   Crie e exiba uma visão que recupere a soma, a média, o valor mínimo e o valor máximo do valor do dano ocasionado por cada veículo.
-- 12)   Crie e exiba uma visão que recuperar todos os dados do acidente mais antigo.
-- 13)   Crie e exiba uma visão que recuperar os dados do carro mais antigo que se envolveu em algum acidente.
-- 14)   Crie e exiba uma visão que recuperar os dados do carro mais novo que se envolveu em algum acidente.
-- 15)   Crie e exiba uma visão que recupere todos os dados dos carros que não se envolveram em nenhum acidente. Use NOT IN.
