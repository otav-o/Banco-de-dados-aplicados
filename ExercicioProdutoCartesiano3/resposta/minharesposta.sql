use zoo;
select * from animais;
select * from empregados;
select * from clientes;
select * from provedores;
select * from eventoanimais;
select * from especies;
select * from alimentacao;
select * from tipoeventos;
select * from sociedades;

-- 01: Liste o nome do animal e de seus cuidadores.
SELECT 
    a.nome, e.nome
FROM
    animais a,
    empregados e
WHERE
    a.idCuidador = e.idEmpregado;
    
-- 02: Liste os nomes de todos os clientes também são provedores.
SELECT 
    c.nome
FROM
    clientes c,
    provedores p
WHERE
    c.idCliente = p.idCliente;


-- 03: Liste o nome e data de saída dos animais que saíram do zoológico por falecimento(2 linhas retornadas).
SELECT 
    a.nome, a.dataSaida
FROM
    animais a,
    eventoanimais e
WHERE
    e.idAnimal = a.idAnimal
        AND e.descricao = 'Falecimento';

-- 04: Liste os nomes dos animais, a data de nascimento, o nome do seu cuidador e a descrição da medicação que tomou. (60 linhas retornadas).
SELECT 
    a.nome, a.dataNascimento, e.nome AS cuidador, m.descricao
FROM
    animais a,
    empregados e,
    medicacao m
WHERE
    a.idCuidador = e.idEmpregado
        AND a.idMedicacao = m.idMedicacao;
        
-- 05: Recupere os dados de todos os animais carnívoros que ainda estão no zoológico (17 linhas retornadas).
SELECT 
    a.*
FROM
    animais a,
    especies e,
    alimentacao al
WHERE
    a.idEspecie = e.idEspecie
        AND e.idAlimentacao = al.idAlimentacao
        AND al.nome = 'Carnívoros'
        AND a.dataSaida IS NULL;

-- 06: Liste o nome e a espécie dos animais que fizeram translado (2 linhas retornadas).
SELECT 
    a.nome, esp.nomeComum
FROM
    animais a,
    especies esp,
    eventoanimais ev,
    tipoeventos t
WHERE
    a.idEspecie = esp.idEspecie
        AND ev.idAnimal = a.idAnimal
        AND ev.tipoEvento = t.idTipo
        AND t.descricao = 'translado';

-- 07: Recupere o nome e estoque do produto fornecido pelas ongs, assim como o nome dos clientes que fazem parte dessas ongs (2 linhas retornadas).
SELECT 
    p.nome AS 'Nome do produto',
    p.estoque,
    c.nome AS 'Nome do cliente'
FROM
    produtos p,
    provedores prov,
    sociedades s,
    clientes c
WHERE
    p.idProvedor = prov.idProvedor
        AND prov.tipoSociedade = s.idTipoSociedade
        AND c.tipoSociedade = s.idTipoSociedade
        AND s.descricao = 'ong';

