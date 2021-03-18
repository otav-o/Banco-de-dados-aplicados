use reserva;
-- EXERCÍCIO DE PRODUTO CARTESIANO
select * from voo;
select * from cidade;
select * from assento;
select * from cliente;
select * from reserva;
select * from aeronave;
select * from voo;

-- 01 - Recupere o número de voos, assim como o nome da cidade de origem e o nome da cidade de destino
SELECT 
    v.numerovoo,
    c.nomecidade AS cidadeOrigem,
    c1.nomecidade AS cidadeDestino
FROM
    voo v,
    cidade c,
    cidade c1
WHERE
    v.cidadeorigem = c.codigocidade
        AND v.cidadedestino = c1.codigocidade
;
    
-- 02 - Recupere todos os dados dos assentos do voo GIG-32 que estão reservados
SELECT 
    a.*, v.numerovoo
FROM
    assento a,
    voo v
WHERE
    v.numerovoo = 'GIG-32'
        AND a.status = 'Indisponível'
;

-- 03 - Recupere o horário de chegada de todos os voos que chegam em São Paulo
SELECT 
    v.horariochegada, v.numerovoo, c.nomecidade AS cidadedestino
FROM
    voo v,
    cidade c
WHERE
    v.cidadedestino = c.codigocidade
        AND c.nomecidade = 'São Paulo';
    
-- 04 - Recupere os nomes e cpfs dos clientes que efetuaram reservas para o voo CON-26
SELECT 
    cli.nomecliente, cli.cpf, v.numerovoo
FROM
    cliente cli,
    reserva r,
    voo v
WHERE
    cli.codigocliente = r.codigocliente
        AND r.codigovoo = v.codigovoo
        AND v.numerovoo = 'CON-26';

-- 05 - Recupere os dados das aeronaves que farão voos com destino a Juiz de Fora
SELECT 
    a.*, c.nomecidade
FROM
    aeronave a,
    voo v,
    cidade c
WHERE
    a.codigoaeronave = v.codigoaeronave
        AND v.cidadedestino = c.codigocidade
        AND c.nomecidade = 'Juiz de Fora'; 

-- 06 - Recupere os números de assentos e o nome da classe para os assentos que estão reservados no voo GIG-17
SELECT 
    a.numeroassento, a.classe
FROM
    assento a,
    reserva r,
    voo v
WHERE
    a.numeroassento = r.numeroassento
    and r.codigovoo = v.codigovoo
    and v.numerovoo = 'GIG-17';

-- 07 - Recupere o nome e telefone dos clientes que viajaram para o Rio de Janeiro

SELECT 
    nomecliente, telefone
FROM
    cliente cli,
    reserva r,
    voo v,
    cidade c
WHERE
    c.nomecidade = 'Rio de Janeiro'
        AND c.codigocidade = v.cidadedestino
        AND v.codigovoo = r.codigovoo
        AND r.codigocliente = cli.codigocliente;
