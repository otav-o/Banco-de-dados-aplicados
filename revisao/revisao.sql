create database hospital;
use hospital;
CREATE TABLE paciente (
    cpf DECIMAL(11) PRIMARY KEY,
    rg DECIMAL(8) NOT NULL UNIQUE,
    nome VARCHAR(50),
    rua VARCHAR(50),
    bairro VARCHAR(30),
    cidade VARCHAR(40) DEFAULT 'Juiz de Fora',
    cep DECIMAL(8),
    datanasc DATE
)
alter table paciente add constraint pk_paciente primary key(cpf);

-- MODIFY X CHANGE
-- CHANGE: Para alterar nome, tipo, valor padrão, restrições
-- MODIFY: Para alterar somente o tipo e restrições

alter table paciente change rua endereco varchar(50); -- nome_antigo nome_novo tipo + restrições
alter table paciente modify nome varchar(80); -- modify altera somente o tipo
alter table paciente modify cpf decimal(11) primary key;
alter table paciente drop primary key;
desc paciente;
alter table paciente change cpf cpf decimal(11) primary key;

alter table paciente modify rg decimal(8) default 12345668; -- não precisa repetir o nome

alter table paciente modify cpf char(11);

alter table paciente add constraint ck_rg unique(rg);
alter table paciente change rg rg decimal(8) unique;

-- ---------------------------------------------------------------------

CREATE TABLE doenca (
    cid CHAR(3) PRIMARY KEY,
    descricao VARCHAR(100)
);

CREATE TABLE medico (
    crm DECIMAL(6) PRIMARY KEY,
    cpf VARCHAR(11),
    nome VARCHAR(50),
    rua VARCHAR(50),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    cep DECIMAL(8)
);

CREATE TABLE especialidade (
    rqe DECIMAL(3) PRIMARY KEY,
    especialidade VARCHAR(30)
);

CREATE TABLE hospital (
    cnpj DECIMAL(14) PRIMARY KEY,
    nome VARCHAR(50),
    rua VARCHAR(50),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    cep DECIMAL(8),
    telefone CHAR(11)
);

CREATE TABLE diagnostico (
    cpf DECIMAL(11),
    FOREIGN KEY (cpf)
        REFERENCES paciente (cpf),
    crm DECIMAL(6),
    FOREIGN KEY (crm)
        REFERENCES medico (crm),
    cid CHAR(3),
    FOREIGN KEY (cid)
        REFERENCES doenca (cid),
    data DATE,
    CONSTRAINT pk_diagnostico PRIMARY KEY (cpf , crm , cid)
);

CREATE TABLE medico_especialidade (
    crm DECIMAL(6),
    CONSTRAINT fk_medespec_med FOREIGN KEY (crm)
        REFERENCES medico (crm)
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    rqe DECIMAL(3),
    CONSTRAINT fk_medespec_espec FOREIGN KEY (rqe)
        REFERENCES especialidade (rqe)
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    CONSTRAINT fk_med_espec PRIMARY KEY (crm , rqe)
);

CREATE TABLE medico_hospital (
    cnpj DECIMAL(14),
    FOREIGN KEY (cnpj)
        REFERENCES hospital (cnpj),
        
    crm DECIMAL(10),
    FOREIGN KEY (crm)
        REFERENCES medico (crm),
        
	PRIMARY KEY(cnpj, crm)
);






