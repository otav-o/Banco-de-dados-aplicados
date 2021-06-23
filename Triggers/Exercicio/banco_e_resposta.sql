CREATE DATABASE mercado;
USE mercado;
CREATE TABLE produtos(
	referencia VARCHAR(3) PRIMARY KEY,
	descricao  VARCHAR(50),
	estoque	   INT NOT NULL DEFAULT 0
);

INSERT INTO produtos VALUES
('001','Feijão',10),
('002','Arroz',5),
('003','Fubá',15);

CREATE TABLE itensVenda(
	venda int primary key,
    produto varchar(3),
    quantidade int,
    constraint fk_produto_venda foreign key(produto) references produtos(referencia) on delete cascade on update cascade
);

/*
Crie uma nova tabela para o banco de dados mercado com o nome de LOG.
 - Coloque os campos Id (auto incremento), operação, tabela, data e hora;
 - Para cada uma operação das outras tabelas (INSERT, UPDATE ou DELETE);
 - Grave um registro na tabela LOG, com as informações pedidas;
 - Inclua, exclua e altere registros das demais tabelas do banco de dados;
 - Execute um SELECT na tabela de LOG e verifique o resultado.
*/

use mercado;
CREATE TABLE log (
    id INT PRIMARY KEY AUTO_INCREMENT,
    operacao VARCHAR(6),
    tabela VARCHAR(30),
    data_hora DATETIME
);

-- data date - curdate()
-- hora time - curtime()
-- data_hora timestamp - now()

Delimiter //
	create trigger insert_produtos_log after insert on produtos
	for each row
	begin
		insert into log(operacao, tabela, data, hora) values ('insert', 'produtos', now());
	end
//

Delimiter //
	create trigger update_produtos_log after update on produtos
	for each row
	begin
		insert into log(operacao, tabela, data, hora) values ('update', 'produtos', now());
	end
//

Delimiter //
	create trigger delete_produtos_log after delete on produtos
	for each row
	begin
		insert into log(operacao, tabela, data, hora) values ('delete', 'produtos', now());
	end
//

Delimiter //
	create trigger insert_itensvenda_log after insert on itensVenda
	for each row
	begin
		insert into log(operacao, tabela, data, hora) values ('insert', 'itensVenda', now());
	end
//

Delimiter //
	create trigger update_itensvenda_log after insert on itensVenda
	for each row
	begin
		insert into log(operacao, tabela, data, hora) values ('update', 'itensVenda', now());
	end
//

Delimiter //
	create trigger delete_itensvenda_log after insert on itensVenda
	for each row
	begin
		insert into log(operacao, tabela, data, hora) values ('delete', 'itensVenda', now());
	end
//

-- testar os triggers

insert into itensVenda(produto, quantidade, fk_produto_venda) values (4, '001', 5);
insert into itensVenda values (2, '002', 2), (3, '003', 3);
