-- Verificar se existe o banco pizzaria, se sim nós o deletamos
DROP DATABASE IF EXISTS pizzaria;
-- Agora estamos criando o banco
CREATE DATABASE IF NOT EXISTS pizzaria;
-- Aqui estamos dizendo que vamos usar o banco pizzaria
USE pizzaria;
-- Criamos a tabela de pizza
CREATE TABLE pizzas (
     idpizzas int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
     pizzas varchar(45) NOT NULL,
     valor double DEFAULT NULL
 ) ENGINE=InnoDB;
 
INSERT INTO pizzas (pizzas, valor) VALUES('Calabresa', 14.56);
INSERT INTO pizzas (pizzas, valor) VALUES('Quatro Queijos', 20.56);
INSERT INTO pizzas (pizzas, valor) VALUES('Portuguesa', 17.56);

CREATE TABLE pedido(
	idpedido int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    idpizzas int(11) NOT NULL,
    quantidade int(11) not null,
	valorPedido double, 
	constraint fk_pedido_pizza foreign key(idpizzas) references pizzas(idpizzas)
	on delete cascade on update cascade
);
-- Verificar se existe já existe a procedure, se sim nós a deletamos
DROP PROCEDURE IF EXISTS pesquisaPizza;
 
-- O delimiter serve para indicar o final, final mesmo, do conjunto de instruções, já que usamos por diversas vezes o ; 
-- (ponto e virgula) ele não serve para essa função
DELIMITER $$
-- Criamos a procedure com o comando CREATE PROCEDURE [nome da procedure]
-- Repare que depois entre parênteses temos um parâmetro que recebemos
-- A palavra reservada IN indica que este é apenas um parâmetro de Entrada, ele poderia ser também um de saída, a palavra reservada 
-- nesse caso seria OUT
-- Após o IN [colocar um nome para o parâmetro] [tipo, pode ser INT, DATE, VARCHAR] 
CREATE PROCEDURE pesquisaPizza(IN parametro VARCHAR(50))
-- Aqui colocamos o a comando para iniciarmos o que a stored procedure devera fazer quando a solicitarmos
BEGIN 
    -- Aqui vamos fazer um teste antes para saber se parâmetro num veio vazio, é isso mesmo aqui podemos fazer IFs
    -- Os testes são feitos com o comando IF ([condição]) THEN
IF(parametro= "") THEN
        SELECT "Nome Vazio" AS 'ERRO';
    ELSE
-- Aqui o procedimento que a procedure deverá fazer REPARE QUE TEMOS QUE TERMINAR A INSTRUÇÃO COM ponto e vírgula (;)
SELECT a.idpizzas, a.pizzas AS 'Nomes Pizzas', a.valor AS 'Valor de Venda'
FROM pizzas a 
WHERE pizzas LIKE CONCAT('%',parametro,'%') 
ORDER BY a.pizzas ASC ;
-- FINAL DO IF
 
END IF;
-- Indicamos o fim das instruções da procedure
END;
-- e para finalizar vamos colocar delimiter, aqui dizemos que é o fim mesmo. rsrsrsr
$$

-- Para chamada de Stored Procedure, usamos o comando CALL [nome da procedure]([parâmetros se houver])
CALL pesquisaPizza("Cala");