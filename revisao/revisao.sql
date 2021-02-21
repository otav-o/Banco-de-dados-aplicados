create database hospital;
use hospital;
create table paciente (
	cpf decimal(11) primary key,
    rg decimal(8) not null unique,
    nome varchar(50),
    rua varchar(50),
    bairro varchar(30),
    cidade varchar(40) default 'Juiz de Fora',
    cep decimal(8),
    datanasc date
    /*
    primary key(cpf, rg, nome), -- se for composta só pode declarar assim
    constraint pk_paciente primary key(cpf)
    unique(cidade, estado, pais)
    */
);
alter table paciente add constraint pk_paciente primary key(cpf);

-- MODIFY X CHANGE
-- CHANGE: Para alterar nome, tipo, valor padrão, restrições
-- MODIFY: Para alterar somente o tipo e restrições

alter table paciente change rua endereco varchar(50); -- nome_antigo nome_novo tipo + restrições
alter table paciente modify nome varchar(80); -- modify altera somente o tipo
alter table paciente modify cpf decimal(11) primary key;
alter table paciente change cpf cpf decimal(11) primary key;

alter table paciente modify rg decimal(8) default 12345668; -- não precisa repetir o nome

alter table paciente modify cpf char(11);

alter table paciente add constraint ck_rg unique(rg);
alter table paciente change rg rg decimal(8) unique;


