create database locadora;
use locadora;
create table cliente(
codigo_cliente decimal(4) primary key,
nome_cliente varchar(50),
telefone varchar(13),
cpf decimal(11),
rg varchar(10),
rua varchar(50),
bairro varchar(20),
cidade varchar(20),
cep char(9),
datanasc date);

insert into cliente(codigo_cliente,cpf,rg,nome_cliente,rua,bairro,cidade,cep, datanasc,telefone) 
values(1111,12345678901,'MG11222333','Maria das Dores',
'Prof. Cunha Figueiredo','Mundo Novo','Juiz de Fora','36033-143','1995-03-11','(32)3222-1199'),
(1212,23456789012,'MG22333444','Otávia Neto Braga',
'Moraes e Castro','São Mateus','Juiz de Fora','35044-123','1990-08-15','(24)2255-3397'),
(1313,34567890123,'MG33444555','Geralda Paiva Britto',
'Dr. Paulo Japiassu Coelho','Cascatinha','Juiz de Fora','36033-215','1942-12-22','(32)3304-5879'),
(1414,45678901234,'MG44555666','Natália Almeida Pascoalino',
'Av. Rio Branco','Centro','Juiz de Fora','36036-123','1974-01-23','(32)4545-6562'),
(1515,56789012345,'MG55666777','Antônio dos Santos Martins',
'Olegário Maciel','Paineiras','Juiz de Fora','36035-444','1964-05-06','(32)5632-2244'),
(1616,67890123456,'MG66777888','Freddy Alexandre Silva',
'Oswaldo Aranha','Centro','Juiz de Fora','36022-111','1955-04-12','(21)3312-4455'),
(1717,78901234567,'MG77888999','Maria Perpétua Natalina',
'Osório Tristão','Santa Candida','Juiz de Fora','36044-123','1974-12-11','(32)6525-4712'),
(1818,89012345678,'MG88999000','Feliciana Margarida de Jesus',
'Capitão Arnaldo de Carvalho','Vale do Ipê','Juiz de Fora','36066-789','1964-06-22','(32)4632-7080'),
(1919,90123456789,'MG99888777','Gláucia Almeida Pascoalino',
'Av. dos Andradas','Centro','Juiz de Fora','36054-123','1947-09-04','(44)5623-4102'),
(2222,11223344556,'MG12345678','Isadora de Freitas','Padre Frederico','Santa Catarina','Juiz de Fora','36022-450','2000-08-13','(32)8451-9625'),
(2020,22334455667,'MG23456789','Maria Fernanda de Oliveira','Barão de São João Nepomuceno','Centro','Juiz de Fora','36020-655','2004-02-16','(24)3234-5658'),
(2121,33445566778,'MG34567890','Pedro Henrique Miranda','Rua Moraes e Castro','São Mateus','Juiz de Fora','36015-077','1992-01-26','(21)2333-4548');


create table genero(
codigo_genero decimal(2) primary key,
nome_genero varchar(25)
);
insert into genero values(1,'Ação'),(2,'Aventura'),(3,'Fantasia'),(4,'Comédia'),(5,'Romance'),(6,'Biografia'),(7,'Drama'),(8,'Esporte'),
(9,'Mistério'),(10,'Suspense'),(11,'Terror'),(12,'Animação'),(13,'Horror'),(14,'Ficção Científica'),(15,'Faroeste'),(16,'História'),
(17,'Família'),(18,'Crime'),(19,'Documentário'),(20,'Suspense'),(21,'Biografia'),(22,'Musical'),(23,'Comédia Romântica');

create table filme(
codigo_filme decimal(3) primary key,
titulo varchar(50),
duracao decimal(5),
sinopse varchar(1000),
estreia date
);

insert into filme values
(300,'Deadpool',108,'O mercenário Wade Wilson (Ryan Reynolds) é um anti-herói do universo Marvel, conhecido como Deadpool. Depois de ser submetido a um experimento para ganhar fator de cura, o mercenário tagarela, armado com suas habilidades e um senso de humor negro, vai atrás do homem que quase destruiu sua vida.','2016-02-11') ,
(301,'Como ser solteira',110,'A jovem Julie Jenson é uma antropóloga que decide escrever um livro. O tema da obra é como é ser solteira nos dias de hoje. Ela busca entender como as pessoas lidam com a solteirice convicta, o sexo casual, o encontro às escuras, o medo de se comprometer e quando é a hora certa para se casar.','2016-02-25'),
(302,'Joy:O nome do sucesso',102,'A inventora Joy Mangano (Jennifer Lawrence) é uma mãe solteira cheia de ideias criativas na cabeça. A sua primeira criação revoluciona o mercado com o Miracle Mop, um esfregão feito com um tecido propício para ser torcido, sem a pessoa molhar as mãos. A partir dessa invenção ela constrói seu negócio milionário.','2016-01-21'),
(303,'Um Homem Entre Gigantes',103,'O neurologista Bennet Omalu (Will Smith) faz um estudo pioneiro sobre uma doença que muitos jogadores de futebol americano apresentam, a encefalopatia traumática crônica. A descoberta gera nos bastidores do esporte muita preocupação entre atletas e expõe os reais interesses políticos, culturais e corporativos criados em torno da Liga Nacional de Futebol (NFL).','2016-03-03'),
(304,'O Regresso',156,'No século 19, o explorador Hugh Glass (Leonardo DiCaprio) comanda uma ação no rio Missouri. No local ele acaba sendo atacado por uma ursa. Em vez de ajudarem, os trabalhadores que o acompanhavam o deixam à própria sorte e ainda roubam os pertences de Glass. Para a surpresa do grupo, o explorador sobreviveu e ele está sedento por vingança.','2016-02-04'),
(305,'Presságios de um Crime',101,'Um agente do FBI (Jeffrey Dean Morgan) recruta o médico John Clancy (Anthony Hopkins) para ajudá-lo na caça de um serial killer (Colin Farrell). Clancy possui poderes psíquicos e descobre que o assassino também tem, e a patir daí eles entram num perigoso jogo de gato e rato.','2016-05-25'),
(306,'A Escolha',111,'Gabby Holland (Teresa Palmer) acaba de se mudar para uma vizinhança e tem Travis Parker (Benjamin Walker) morando ao lado. A princípio, os dois não se dão bem. Mas logo, uma situação força os vizinhos a tentarem se dar bem e o amor pede passagem nesse improvável romance.','2016-02-04'),
(307,'50 Tons de Preto',92,'Paródia do drama romântico Cinquenta Tons de Cinza, filme que apresenta uma relação complexa e intensa entre uma jovem virgem e sonhadora e um empresário que revela seu interesse pelo sadomasoquismo.','2016-03-03'),
(308,'Mundo cão',122,'Em 2007, o Centro de Controle de Zoonoses impõe o sacrifício de animais capturados. Santana (Babu Santana) é funcionário desse departamento e certo dia ele pega um cachorro grande e agressivo. O dono do bicho, o criminoso Paulinho (Lázaro Ramos), vai tirar satisfações com Santana, gerando uma série de desentendimentos.','2016-03-17'),
(309,'Floresta Maldita',93,'A americana Sara (Natalie Dormer) está desesperada com o desaparecimento de sua irmã gêmea. Ela teme que a irmã tenha ido para a floresta dos suicidas Aokigahara, no Japão. Apesar de todos os alertarem, Sara se atreve a entrar na mata para descobrir o que realmente aconteceu.','2017-01-12'),
(310,'Visões do passado',90,'O psicólogo Peter Bower (Adrien Brody) está tendo pesadelos e visões aterrorizantes. Ao descobrir que seus pacientes são fantasmas de pessoas que morreram há vinte anos, Peter fica com medo de ficar louco e decide voltar para sua cidade natal. No local, ele desvenda um mistério do passado que só ele pode solucionar.','2016-03-31'),
(311,'Especialista em crise',108,'Ao aceitar o desafio de trabalhar pela reeleição de um impopular presidente boliviano, um grupo de consultores americanos percebem que precisarão de ajuda. Depois de rastrear a consultora política Jane Bodine (Sandra Bullock), eles a convencem a liderar a equipe - decisão da qual se arrependem rapidamente assim que "Jane Calamidade", como é conhecida, começa a explicar o seu apelido, desencadeando sua própria marca de caos na campanha. Quando tudo parece perdido, Pat Candy (Billy Bob Thornton), pior inimigo de Jane, chega à cidade para trabalhar para a oposição.','2016-03-31'),
(312,'Snoopy & Charlie Brown - Peanuts, O Filme',102,'Charlie Brown, Snoopy, Lucy, Linus e todo resto da turma do beagle mais amado do mundo está de volta! A aventura começa quando Snoopy embarca numa missão, ao partir em busca de seu arqui-inimigo, o Barão Vermelho, enquanto seu melhor amigo, Charlie Brown, dá início a sua própria missão.','2016-01-14'),
(313,'A Quinta onda',94,'No futuro, a Terra é tomada por alienígenas. Na primeira onda de ataques, um pulso eletromagnético acaba com toda a eletricidade do planeta. Na segunda, um tsunami mata 40% da população. Na terceira onda, os pássaros começam a transmitir um vírus que mata 97% das pessoas que resistiram aos outros ataques. Já na quarta onda, a adolescente Cassie Sullivan (Chlöe Grace Moretz) precisa se virar sozinha para sobreviver e ainda reencontrar seu irmão.','2016-01-21'),
(314,'Creed - Nascido para Lutar',95,'O veterano Rocky Balboa (Sylvester Stallone) pode não estar mais nos ringues em disputas de boxe, mas continua com o vigor de sempre, agora como treinador. Sob sua batuta está o jovem Adonis Creed (Michael B. Jordan), neto do lutador Apollo Creed, que enfrentou Balboa várias vezes no ringue.','2016-01-14'),
(315,'Os 8 odiados',182,'Entre seis e oito anos após o fim da Guerra Civil, uma carruagem quebra em meio a paisagem invernal de Wyoming. O caçador de recompensas John Ruth (Kurt Russel) e a fugitiva Daisy Domergue (Jennifer Jason Leigh) vão para Red Rock, onde Ruth a entregará à justiça. Mas durante o percurso, eles encontram o Major Marquis Warren (Samuel L. Jackson), um ex-soldado que se transformou em um terrível mercenário, e Chris Mannix (Walton Goggins), um renegado sulista que quer ser o novo xerife da cidade.','2016-01-07'),
(316,'Macbeth: Ambição e Guerra',113,'O bravo general escocês Macbeth (Michael Fassbender) é tomado pela ambição quando três bruxas profetizam que ele será o novo rei. Sua mulher, Lady Macbeth (Marion Cotillard), o instiga a fazer de tudo para chegar até o trono, nem que para isso signifique derramar muito sangue nessa jornada.','2015-12-24'),
(317,'Star Wars: O Despertar da Força',135,'No sexto capítulo da franquia, Star Wars: Episódio VI - O Retorno de Jedi (1983), Luke Skywalker (Mark Hamill) consegue fazer com que Darth Vader encontre o seu lado bom e elimine o Imperador Palpatine na segunda Estrela da Morte. Trinta anos se passam e Luke volta a unir forças com Princesa Leia (Carrie Fisher), Han Solo (Harrison Ford), Chewbacca (Peter Mayhew) e os robôs C-3PO (Anthony Daniels) e R2-D2 (Kenny Baker) para uma nova aventura espacial na disputa pela Força.','2015-12-17'),
(318,'Alvin e os Esquilos 4 - Na Estrada',86,'O trio de esquilos cantores e tagarelas formado por Alvin, Simon e Theodore estão de volta para mais uma aventura musical. Alvin continua arranjando confusões e faz o intelectual Simon e o fofo Theodore serem forçados a acompanhá-lo.','2015-12-24'),
(319,'Amy',128,'Documentário conta a história da cantora inglesa Amy Winehouse. Mostrando o ponto de vista da estrela, o filme revela imagens de arquivo inéditas, além de canções que não chegaram a ser lançadas.','2015-09-26'),
(320,'X-MEN: APOCALIPSE',144,'ambém conhecido como Apocalipse, En Sabah Nur (Oscar Isaac) é o mutante original. Após milhares da anos, ele volta a vida disposto a garantir sua supremacia e acabar com a humanidade. Ele seleciona quatro Cavaleiros nas figuras de Magneto (Michael Fassbender), Psylocke (Olivia Munn), Anjo (Ben Hardy) e Tempestade (Alexandra Shipp). Do outro lado, o professor Charles Xavier (James McAvoy) conta com uma série de novos alunos, como Jean Grey (Sophie Turner), Ciclope (Tye Sheridan) e Noturno (Kodi Smit-McPhee), além de caras conhecidas como Mística (Jennifer Lawrence), Fera (Nicholas Hoult) e Mercúrio (Evan Peters), para tentar impedir o vilão.','2016-05-19'),
(321,'Capitão América: Guerra Civil',147,'Steve Rogers (Chris Evans) é o atual líder dos Vingadores, super-grupo de heróis formado por Viúva Negra (Scarlett Johansson), Feiticeira Escarlate (Elizabeth Olsen), Visão (Paul Bettany), Falcão (Anthony Mackie) e Máquina de Combate (Don Cheadle). O ataque de Ultron fez com que os políticos buscassem algum meio de controlar os super-heróis, já que seus atos afetam toda a humanidade. Tal decisão coloca o Capitão América em rota de colisão com Tony Stark (Robert Downey Jr.), o Homem de Ferro. ','2016-04-28');

create table filme_genero(
codigo_filme decimal(3),
codigo_genero decimal(2),
primary key(codigo_filme,codigo_genero),
constraint fk_filme foreign key(codigo_filme) references filme(codigo_filme) on delete cascade on update cascade,
constraint fk_genero foreign key(codigo_genero) references genero(codigo_genero) on delete cascade on update cascade);

insert into filme_genero values(300,1),(300,2),(300,3),(301,4),(301,5),(302,6),(302,7),(303,7),(303,8),(304,2),(304,7),(305,9),(305,10),
(306,7),(306,5),(307,4),(308,4),(309,11),(310,9),(310,10),(311,4),(311,7),(312,1),(312,2),(312,4),(313,2),(313,14),(313,20),(314,7),
(314,8),(315,15),(316,2),(316,7),(316,16),(317,1),(317,2),(317,3),(317,14),(318,4),(318,12),(318,17),(319,6),(319,19),(319,22),
(320,1),(320,3),(320,14),(321,1),(321,3),(321,14);

create table ator(
codigo_ator decimal(4) primary key,
nome_ator varchar(20),
sobrenome varchar(20),
cpf decimal(11)
);

create table filme_ator(
codigo_filme decimal(3),
codigo_ator decimal(4),
primary key(codigo_filme,codigo_ator),
constraint fk_filme1 foreign key(codigo_filme) references filme(codigo_filme) on delete cascade on update cascade,
constraint fk_ator foreign key(codigo_ator) references ator(codigo_ator) on delete cascade on update cascade);

insert into ator values(100,'Ryan','Reynolds',11122233344),
(101,'Morena','Baccarin',22233344455),
(102,'Gina','Carano',33344455566),
(103,'Ed','Skrein',44455566677),
(104,'Brianna','Hidebrand',55566677788),
(105,'Rachel','Sheen',66677788899),
(106,'Stan','Lee',77788899900),
(107,'Dakota','Johnson',88899900011),
(108,'Rebel','Wilson',99900011122),
(109,'Leslie','Man',11111111111),
(110,'Alison','Brie',22222222222),
(111,'Nicholas','Braun',33333333333),
(112,'Anderson','Holm',44444444444),
(113,'Jennifer','Lawrence',55555555555),
(114,'Bradley','Cooper',66666666666),
(115,'Édgar','Ramirez',77777777777),
(116,'Isabella','Rossellini',88888888888),
(117,'Will','Smith',99999999999),
(118,'Alec','Baldwin',10101010110),
(119,'Gugu','Mbatha-Raw',12121212121),
(120,'Leonardo','DiCaprio',13131313131),
(121,'Tom','Hardy',14141414141),
(122,'Will','Poulter',15151515151),
(123,'Anthony','Hopkins',16161616161),
(124,'Colin','Farrell',17171717171),
(125,'Jeffrey Dean','Morgan',18181818181),
(126,'Abbie','Cornish',19191919191),
(127,'Teresa','Palmer',1111222233),
(128,'Benjamin','Walker',2222333344),
(129,'Tom','Welling',3333444455),
(130,'Marlon','Wayans',4444555566),
(131,'Kali','Hawk',5555666677),
(132,'Mike','Epps',6666777788),
(133,'Lázaro','Ramos',7777888899),
(134,'Babu','Santana',8888999900),
(135,'Adriana','Esteves',9999000011),
(136,'Natalie','Dormer',99988877766),
(137,'Taylor','Kinney',88877766655),
(138,'Eoin','Macken',77766655544),
(139,'Yuho','Yamashita',66655544433),
(140,'Adrien','Brody',55544433322),
(141,'Sam','Neill',44433322211),
(142,'Robin','McLeavy',33322211100),
(143,'Sandra','Bullock',22211100099),
(144,'Billy Bob','Thornton',11111222223),
(145,'Joaquim de','Almeida',22222333334),
(146,'Anthony','Mackie',56789012345),
(147,'Noah','Schnapp',33333444445),
(148,'Bill','Melendez',44444555556),
(149,'Francesca','Capaldi',55555666667),
(150,'Kristin','Chenoweth',66666777778),
(151,'Chloe Grace','Moretz',77777888889),
(152,'Nick','Robinson',88888999990),
(153,'Alex','Roe',9999900001),
(154,'Sylvester','Stallone',11111122222),
(155,'Michael B.','Jordan',22222233333),
(156,'Tessa','Thompson',33333344444),
(157,'Samuel L.','Jackson',44444455555),
(158,'Kurt','Russell',55555566666),
(159,'Jennifer Jason','Leigh',66666677777),
(160,'Walton','Goggins',77777788888),
(161,'Michael','Fassbender',88888899999),
(162,'Marion','Cotillard',99999900000),
(163,'Paddy','Considine',11111112222),
(164,'Daisy','Ridley',22222223333),
(165,'John','Boyega',33333334444),
(166,'Harrison','Ford',44444445555),
(167,'Adam','Driver',55555556666),
(168,'Jason','Lee',99999990000),
(169,'Justin','Long',11111111222),
(170,'Matthew','Gray',22222222333),
(171,'Tony','Hale',33333333444),
(172,'Jesse','McCarthey',44444444555),
(173,'Ben','Affleck',66666666777),
(174,'Jason','Lee',77777777888),
(175,'Joey Lauren','Adams',88888888999),
(176,'Jennifer','Lawrence',99999999000),
(177,'Sophie','Turner',11111111122),
(178,'James','McAvoy',22222222233),
(179,'Chris','Evans','12345678901'),
(180,'Robert','Downey Jr.',23456789012),
(181,'Paul','Rudd',78901234567),
(182,'Scarlett','Johansson',34567890123),
(183,'Martin','Freeman',45678901234),
(184,'Sebastian','Stan',67890123456);

insert into filme_ator values(300,100),(300,101),(300,102),(300,103),(300,104),(300,105),(300,106),(300,107),(301,108),(301,109),
(301,110),(301,111),(301,112),(302,113),(302,114),(302,115),(302,116),(303,117),(303,118),(303,119),(304,120),(304,121),(304,122),
(305,123),(305,124),(305,125),(305,126), (306,127),(306,128),(306,129),(307,130),(307,131),(307,132),(308,133),(308,134),(308,135),
(309,136),(309,137),(309,138), (309,139),(310,140),(310,141),(310,142),(311,143),(311,144),(311,145),(311,146),(312,147),(312,148),
(312,149),(312,150),(313,151),(313,152),(313,153),(314,154),(314,155),(314,156),(315,157),(315,158),(315,159),(315,160),(316,161),
(316,162),(316,163),(317,164),(317,165),(317,166),(317,167),(318,168),(318,169),(318,170),(318,171),(318,172),(319,173),(319,174),
(319,175),(320,176),(320,177),(320,178),(320,161),(321,179),(321,180),(321,181),(321,182),(321,183),(321,184),(321,146),(321,106);

create table diretor(
codigo_diretor decimal(4) primary key,
nome_diretor varchar(50)
);

insert into diretor values(1,'Quentin Tarantino'),
(2,'Justin Kurzel'),(3,'J. J. Abrams'),(4,'Walt Becker'),(5,'Kevin Smith'),(6,'Bryan Singer'),(7,'Anthony Russo'),
(8,'Joe Russo'),(9,'Tim Miller'),(10,'Christian Ditter'),(11,'David O. Russell'),(12,'Peter Landesman'),
(13,'Alejandro González Iñárritu'),(14,'Afonso Poyart'),(15,'Ross Katz'),(16,'Michael Tiddes'),(17,'Marcos Jorge'),
(18,'Jason Zada'),(19,'Michael Petroni'),(20,'David Gordon Green'),(21,'Steve Martino'),(22,'J Blakeson'),(23,'Ryan Coogler');

create table filme_diretor(
codigo_filme decimal(3),
codigo_diretor decimal(4),
primary key(codigo_filme,codigo_diretor),
constraint fk_filme2 foreign key(codigo_filme) references filme(codigo_filme) on delete cascade on update cascade,
constraint fk_diretor foreign key(codigo_diretor) references diretor(codigo_diretor) on delete cascade on update cascade);

insert into filme_diretor values(315,1),(316,2),(317,3),(318,4), (319,5),(320,6),(321,7),(321,8),(300,9),(301,10),(302,11),(303,12),
(304,13),(305,14),(306,15),(307,16),(308,17),(309,18),(310,19),(311,20),(312,21),(313,22),(314,23);

create table locacao(
codigo_locacao decimal(5) primary key,
codigo_cliente decimal(4),
codigo_filme decimal(3),
valor real(5,2),
data_locacao date,
constraint fk_cliente foreign key(codigo_cliente) references cliente(codigo_cliente),
constraint fk_filme3 foreign key(codigo_filme) references filme(codigo_filme));

insert into locacao values(1,1111,300,5.00,'2016-05-01'),(2,1111,310,5.50,'2016-05-09'),(3,1111,320,5.30,'2016-04-22'),
(4,1212,301,6.80,'2016-03-10'),(5,1212,302,5.70,'2016-03-12'),(6,1313,321,7.00,'2016-06-13'),(7,1313,303,6.30,'2016-05-02'),
(8,1414,305,6.20,'2016-05-28'),(9,1414,307,6.10,'2016-03-21'),(10,1515,304,6.30,'2016-04-23'),(11,1515,308,5.25,'2016-02-13'),
(12,1515,311,6.50,'2016-04-15'),(13,1616,312,6.00,'2016-01-30'),(14,1616,313,6.75,'2016-02-15'),(15,1717,321,7.50,'2016-06-02'),
(16,1717,320,7.30,'2016-06-12'),(17,1717,319,6.10,'2015-12-02'),(18,1717,321,7.50,'2016-05-15'),(19,1717,304,6.10,'2016-04-23'),
(20,1818,305,8.00,'2016-06-06'),(21,1818,306,5.80,'2016-04-03'),(22,1919,307,5.90,'2016-06-02'),(23,1919,321,7.50,'2016-06-02'),
(24,1919,321,7.50,'2016-06-13'),(25,2222,300,5.00,'2016-04-19'),(26,2222,301,8.50,'2016-02-25'),(27,2222,302,6.50,'2016-01-31'),
(28,2222,303,6.30,'2016-04-04'),(29,2222,304,7.50,'2016-02-04'),(30,2222,305,8.50,'2016-05-28'),(31,2222,321,8.50,'2016-04-28'),
(32,2222,320,8.50,'2016-05-19'),(33,1919,306,6.50,'2016-03-25'),(34,1818,307,6.30,'2016-05-19'),(35,1717,308,7.50,'2016-03-24'),
(36,1616,310,6.90,'2016-04-01'),(37,1616,311,6.50,'2016-04-08'),(38,1616,312,6.00,'2016-02-06'),(39,1515,313,6.50,'2016-03-29'),
(40,1414,317,8.50,'2015-12-17'),(41,2222,317,8.50,'2015-12-19'),(42,1717,317,8.50,'2015-12-21'),(43,1919,317,8.00,'2016-01-02'),
(44,1515,321,8.00,'2016-06-12'),(45,1414,321,8.00,'2016-06-05'),(46,2222,317,7.50,'2016-05-15'),(47,1818,317,7.50,'2016-05-31'),
(48,1919,318,6.50,'2016-06-01'),(49,1212,318,6.50,'2016-05-14'),(50,1111,321,7.50,'2016-06-09');



