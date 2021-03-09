CREATE DATABASE fornecedor;
use fornecedor;
CREATE TABLE fornecedor(
num_fornecedor NUMERIC(4),
fnome VARCHAR(30),
status VARCHAR(15),
cidade VARCHAR(20),
CONSTRAINT pk_fornecedor 
PRIMARY KEY(num_fornecedor));
CREATE TABLE peca(
num_peca NUMERIC(5),
pnome VARCHAR(30),
cor VARCHAR(10),
peso REAL,
cidade VARCHAR(20),
preco REAL,
CONSTRAINT pk_peca 
PRIMARY KEY(num_peca));

CREATE TABLE pedido(
num_fornecedor NUMERIC(4),
num_peca NUMERIC(5),
qdade integer,
CONSTRAINT pk_pedido 
PRIMARY KEY(num_fornecedor,num_peca),
CONSTRAINT fk_fornecedor FOREIGN KEY(num_fornecedor)
REFERENCES fornecedor(num_fornecedor) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_peca FOREIGN KEY(num_peca)
REFERENCES peca(num_peca) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO peca 
VALUES(1,'Porca','Vermelho',0.8,'São Paulo',1.75);

INSERT INTO fornecedor 
VALUES(1,'Agnaldo','disponível','São Paulo');

INSERT INTO fornecedor(num_fornecedor,fnome,status)
VALUES(2,'Ronaldo','indisponível');

INSERT INTO fornecedor VALUES
(3,'Jair','indisponível','Rio de Janeiro'),
(4,'Lindolfo','disponível','Belo Horizonte'),
(5,'Mauro','disponível', 'Juiz de Fora');

INSERT INTO peca(num_peca,pnome,cor,peso,cidade,preco)
VALUES(2,'Pino','Verde',0.5,'Rio de Janeiro',1.30),
(3,'Parafuso','Azul',0.4,'Rio de Janeiro',1.00),
(4,'Parafuso','Cinza',0.3,'Juiz de Fora',0.90),
(5,'Tubo','Branco',1,'Juiz de Fora',2.25),
(6,'Tubo','Preto',1,'Belo Horizonte',3.50);

INSERT INTO pedido VALUES
(1,1,300),
(1,2,200),
(1,3,50),
(1,4,100),
(1,5,20),
(1,6,68),
(4,1,500),
(4,2,400),
(5,3,450);