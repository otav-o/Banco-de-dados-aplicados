create database hospital;
use hospital;
create table paciente(
	cpf decimal(11) primary key,
    rg char(11),
    nome varchar(50),
    rua varchar(50),
    bairro varchar(20),
    cidade varchar(20),
    cep char(9),
    datanasc date
);

insert into paciente values(12345678901,'MG11222333','Maria das Dores',
'Prof. Cunha Figueiredo','Mundo Novo','Juiz de Fora','36033-143','1995-03-11'),
(23456789012,'MG22333444','Otávia Neto Braga',
'Moraes e Castro','São Mateus','Juiz de Fora','35044-123','1990-08-15'),
(34567890123,'MG33444555','Geralda Paiva Britto',
'Dr. Paulo Japiassu Coelho','Cascatinha','Juiz de Fora','36033-215','1942-12-22'),
(45678901234,'MG44555666','Natália Almeida Pascoalino',
'Av. Rio Branco','Centro','Juiz de Fora','36036-123','1974-01-23'),
(56789012345,'MG55666777','Antônio dos Santos Martins',
'Olegário Maciel','Paineiras','Juiz de Fora','36035-444','1964-05-06'),
(67890123456,'MG66777888','Freddy Alexandre Silva',
'Oswaldo Aranha','Centro','Juiz de Fora','36022-111','1955-04-12'),
(78901234567,'MG77888999','Maria Perpétua Natalina',
'Osório Tristão','Santa Candida','Juiz de Fora','36044-123','1974-12-11'),
(89012345678,'MG88999000','Feliciana Margarida de Jesus',
'Capitão Arnaldo de Carvalho','Vale do Ipê','Juiz de Fora','36066-789','1964-06-22'),
(90123456789,'MG99888777','Gláucia Almeida Pascoalino',
'Av. dos Andradas','Centro','Juiz de Fora','36054-123','1947-09-04'),
(11223344556,'MG12345678','Isadora de Freitas','Padre Frederico','Santa Catarina','Juiz de Fora','36022-450','2013-08-13'),
(22334455667,'MG23456789','Maria Fernanda de Oliveira','Barão de São João Nepomuceno','Centro','Juiz de Fora','36020-655','2014-02-16'),
(33445566778,'MG34567890','Pedro Henrique Miranda','Rua Moraes e Castro','São Mateus','Juiz de Fora','36015-077','2012-01-26');

create table medico(
	crm decimal(10) primary key,
    cpf decimal(11),
    nome varchar(50),
    rua varchar(50),
    bairro varchar(20),
    cidade varchar(20),
    cep varchar(9)
);

insert into medico values(43641,98765432109,'AIRTON ESMERIO FERNANDES JUNIOR', 'Tiradentes','Centro','Juiz de Fora','36021-148'),
(10874,87654321098,'FLAVIO RIBEIRO MARTINS','Rua Dr Edgard Carlos Pereira','Santa Tereza','Juiz de Fora','36022-441'),
(7683,76543210987,'MARCIO GRILLO DE BRETAS', 'Rua Dr Constantino Paleta','Centro','Juiz de Fora','36025-144'),
(11024,65432109876,'LUIZ KINGMA LANZIOTTI','Rua Padre Cafe','São Mateus','Juiz de Fora','36012-850'),
(26945,54321098765,'CHRISTIANE MARIA MEURER ALVES','Av Pres Itamar Franco','São Mateus','Juiz de Fora','36015-230'),
(36046,43210987654,'RODRIGO DA SILVA OLIVEIRA GOMES','Av. Barão do Rio Branco','Centro','Juiz de Fora','36055-330'),
(13753,32109876543,'RONALDO MULLER','Rua Halfeld','Centro','Juiz de Fora','36088-512'),
(18130,21098765432,'SUMAYA MATTAR','Av. Barão do Rio Branco','Centro','Juiz de Fora','36044-220'),
(34930,10987654321,'LUIZ GUILHERME LOPES JUNIOR','Av Pres Itamar Franco','Dom Bosco','Juiz de Fora','36025-654'),
(25096,11122233344,'ELIANE BAIAO GUILHERMINO','Rua Rei Alberto','Centro','Juiz de Fora','36089-774'),
(23232,22233344455,'MARCELO VITOR MENDES CONDE','Av. Barão do Rio Branco','Centro','Juiz de Fora','36022-113'),
(26989,33344455566,'ADRIANA DE ALMEIDA PASCINI BREGA','Av. Barão do Rio Branco','São Mateus','Juiz de Fora','36011-223'),
(13127,44455566677,'PAULO SERGIO CURZIO','Av. Barão do Rio Branco','Centro','Juiz de Fora','36027-145'),
(30539,55566677788,'ALBA FABIANE CARVALHO TAROCO','Av. Barão do Rio Branco','Bom Pastor','Juiz de Fora','36066-450'),
(20169,66677788899,'JAIR PIRES DE OLIVEIRA','Av. Barão do Rio Branco','Centro','Juiz de Fora','36074-560'),
(31727,77788899901,'CESAR AUGUSTO SOUZA LIMA DE MELLO','Santo Antônio','Centro','Juiz de Fora','36022-444'),
(41674,88899900011,'FELIPE TORRES RABELO','Rua Santos Dumont','Grambery','Juiz de Fora','36011-236');
create table especialidade(
	rqe decimal(5) primary key,
    especialidade varchar(50)
);
insert into especialidade values(7379,'Alergia e Imunologia'),
(977,'Anestegiologia'),(12557,'Acumpuntura'),(19072,'Angiologia'),(17981,'Canceriologia'),(25832,'Cardiologia'),(9990,'Clínica Médica'),
(15688,'Dermatologia'),(29607,'Endocrinologia e Metabologia'),(25270,'Geriatria'),(6520,'GINECOLOGIA E OBSTETRÍCIA'),(31760,'NEFROLOGIA'),
(2740,'Neurologia'),(18086,'Oftamologia'),(20160,'Pediatria'),(9229,'PSIQUIATRIA'),(22344,'Urologia'),(2261,'CIRURGIA PLÁSTICA');
create table medico_especialidade(
	crm decimal(10),
    rqe decimal(5),
    primary key (crm, rqe),
    constraint fk_medico_especialidade foreign key(crm)
    references medico(crm),
    constraint fk_especialidade foreign key(rqe) 
    references especialidade(rqe)
);
insert into medico_especialidade values(43641,7379),(10874,977),(7683,12557),(11024,19072),(26945,17981),(36046,25832),(13753,9990),(18130,15688),
(26989,31760),(13127,2740),(34930,29607),(25096,25270),(23232,6520),(30539,18086),(20169,20160),(31727,9229),(41674,22344);
create table hospital(
	cnpj decimal(14) primary key,
    nome varchar(50),
    rua varchar(50),
    bairro varchar(20),
    cidade varchar(20),
    cep char(9),
    telefone char(13)
);
insert into hospital values(25415993000193,'HOSPITAL MONTE SINAI','RUA VICENTE BEGHELLI','Dom Bosco','Juiz de Fora','36025-550','(32)3239-4455'),
(17268871000193,'HOSPITAL ALBERT SABIN','RUA DOUTOR EDGARD CARLOS PEREIRA','Santa Tereza','Juiz de Fora','36020-200','(32)3249-7000'),
(21575709000195,'Santa Casa De Misericordia De Juiz De Fora','Av. Barão do Rio Branco','Centro','Juiz de Fora','36021-630','(32)2104-2000'),
(21583042000172,'HOSPITAL E MATERNIDADE THEREZINHA DE JESUS','R Dr Dirceu De Andrade','São Mateus','Juiz de Fora','36025-330','(32)4009-2277'),
(18338178000102,'Hospital de Pronto Dr. Mozart Teixeira','Av. Barão do Rio Branco','Centro','Juiz de Fora','36025-020','(32)3690-7152'),
(21599824000108,'Hospital Asconcer','Av. Presidente Itamar Franco','Cascatinha','Juiz de Fora','36025-290','(32)3311-4000');
create table medico_hospital(
	cnpj decimal(14),
    crm decimal(10),
    dataInicio date,
    primary key(cnpj, crm),
    constraint fk_hospital foreign key(cnpj)
    references hospital(cnpj),
    constraint fk_hosp_medico foreign key(crm)
    references medico(crm)
);
insert into medico_hospital values(25415993000193,10874,'2010-02-16'),(17268871000193,10874,'2011-01-22'),(25415993000193,11024,'2002-10-19'),
(17268871000193,26945,'2003-02-08'),(17268871000193,36046,'1999-03-10'),(17268871000193,11024,'2000-11-03'),(21575709000195,23232,'1995-06-05'),
(25415993000193,23232,'2009-04-23'),(21583042000172,23232,'2003-05-26'),(17268871000193,13753,'1998-04-08'),(17268871000193,25096,'2007-08-16'),
(18338178000102,13753,'2008-07-18'),(21599824000108,26945,'2006-09-14'),(18338178000102,26989,'2011-12-07'),(21583042000172,13127,'2012-03-13'),
(25415993000193,20169,'2014-05-27'),(21575709000195,31727,'2013-12-01'),(18338178000102,31727,'2010-12-15'),(25415993000193,31727,'2002-06-30'),
(17268871000193,41674,'2006-04-20');
create table doenca(
	cid char(5) primary key,
    descricao varchar(100)
);
insert into doenca values('T78.4','Alergia não especificada'),('L20.9','Dermatite atópica, não especificada'),('I83.9','Varizes dos membros inferiores sem úlcera ou inflamação'),
('I73.9','Doenças vasculares periféricas não especificada'),('C61','Neoplasia maligna da próstata'),('C50.8','Neoplasia maligna da mama com lesão invasiva'),
('C92','Leucemia mielóide'),('C18.2','Neoplasia maligna do cólon ascendente'),('J01.1','Sinusite frontal aguda'),('E66.0','Obesidade devida a excesso de calorias'),
('E03.9','Hipotireoidismo não especificado'),('E05','Tireotoxicose (hipertireoidismo)'),('E10.4','Diabetes mellitus insulino-dependente - com complicações neurológicas'),
('I10','Hipertensão essencial (primária)'),('R01.1','Sopro cardíaco, não especificado'),('M81','Osteoporose sem fratura patológica'),
('G30.1','Doença de Alzheimer de início tardio'),('N30.9','Cistite, não especificada'),('Q51.3','Útero bicórneo'),
('N20.9','Calculose urinária, não especificada'),('N18.9','Insuficiência renal crônica não especificada'),
('G20','Doença de Parkinson'),('G03.1','Meningite crônica'),('G05.8','Encefalite, mielite e encefalomielite em outras doenças classificadas em outra parte'),
('H26.2','Catarata complicada'),('H44.6','Corpo estranho retido (antigo) intra-ocular de natureza magnética'),('H44.2','Miopia degenerativa'),
('B01','Varicela (Catapora)'),('J15','Pneumonia bacteriana não classificada em outra parte'),('B05','Sarampo'),('F20','Esquizofrenia'),
('F31.1','Transtorno afetivo bipolar'),('F42','Transtorno obsessivo-compulsivo'),('F50','Anorexia nervosa'),('F50.2','Bulimia nervosa'),
('F33','Transtorno depressivo recorrente'),('N47','Hipertrofia do prepúcio, fimose e parafimose'),('Z30.2','Esterilização'),('K29.7',null);
create table diagnostico(
	cpf decimal(11),
    crm decimal(10),
    cid char(5),
    data date,
    primary key(cpf,crm,cid),
    constraint fk_diag_paciente foreign key(cpf)
    references paciente(cpf),
    constraint fk_diag_crm foreign key(crm)
    references medico(crm),
    constraint fk_doenca_paciente foreign key(cid)
    references doenca(cid)
);
insert into diagnostico values(12345678901,43641,'T78.4','2015-01-16'),(12345678901,18130,'L20.9','2015-06-23'),
(23456789012,23232,'N30.9','2015-08-04'),(23456789012,13753,'J01.1','2015-11-04'),(12345678901,23232,'Q51.3','2012-08-20'),
(34567890123,25096,'M81','2013-02-06'),(90123456789,25096,'G30.1','2015-10-09'),(45678901234,31727,'F50','2010-07-03'),
(45678901234,31727,'F50.2','2011-05-30'),(78901234567,31727,'F42','2008-05-31'),(78901234567,31727,'F31.1','2008-07-15'),
(56789012345,31727,'F33','2015-08-08'),(56789012345,41674,'Z30.2','2014-09-22'),(33445566778,41674,'N47','2015-04-23'),
(11223344556,20169,'B05','2014-10-26'),(22334455667,20169,'J15','2015-08-19'),(67890123456,34930,'E66.0','2006-12-03'),
(67890123456,34930,'E03.9','2009-10-14'),(78901234567,36046,'I10','2005-03-09'),(33445566778,36046,'R01.1','2014-12-29'),
(89012345678,13753,'J01.1','1990-10-20'),(89012345678,34930,'E10.4','2003-11-18'),(45678901234,26945,'C50.8','2007-04-17');


