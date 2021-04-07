use empresa;
select * from funcionario;
select * from departamento;
select * from projeto;
select * from trabalha_em;

/* Recupere o nome e o sobrenome dos funcionários que trabalham no departamento de pesquisa */

-- Junção
SELECT 
    pnome, func.nome
FROM
    funcionario func,
    departamento dep
WHERE
    dnumero = dnr
        AND dep.nome = 'Pesquisa';

-- Junção interna        
SELECT 
    pnome, func.nome
FROM
    funcionario func
        INNER JOIN
    departamento ON dnr = dnumero
WHERE
    dnome = 'Pesquisa';
    
/* Recupere o nome do funcionário e o nome do projeto em que ele trabalha */

-- Junção
SELECT 
    f.pnome, p.projnome
FROM
    funcionario f,
    projeto p,
    trabalha_em t
WHERE
    f.cpf = t.fcpf AND t.pnr = p.projnumero;
    
-- Junção interna
SELECT 
    f.pnome, p.projnome
FROM
    funcionario f
        INNER JOIN
    trabalha_em t ON f.cpf = t.fcpf
        INNER JOIN
    projeto p ON p.projnumero = t.pnr;
    
-- --------------------------------------------------------------
use reserva;

/* Recupere o nome do cliente que efetuou uma reserva em 28/02/2014 */
select * from cliente;
select * from reserva;
select * from voo;

SELECT 
    c.nomecliente
FROM
    cliente c,
    reserva r
WHERE
    r.datareserva = '2014-02-28'
        AND r.codigocliente = c.codigocliente;

SELECT 
    c.nomecliente
FROM
    cliente c
        INNER JOIN
    reserva r ON c.codigocliente = r.codigocliente
WHERE
    r.datareserva = '2014-02-28';
    

SELECT 
    c.nomecliente
FROM
    cliente c
        NATURAL JOIN
    reserva r
WHERE
    r.datareserva = '2014-02-28';
    
    -- natural join: se **as colunas que unem as tabelas** têm o mesmo nome

/* Recupere o prefixo da aeronave que realizou um voo para JDF-12 */
SELECT 
    prefixo
FROM
    aeronave
        NATURAL JOIN
    voo
WHERE
    numerovoo = 'JDF-12';
    
/* Recupere o número dos voos com destino ao Rio de Janeiro*/
SELECT DISTINCT
    numerovoo
FROM
    voo
        INNER JOIN
    cidade ON voo.cidadedestino = cidade.codigocidade
WHERE
    nomecidade = 'Rio de Janeiro';
    
/* Recupere a classe dos assentos que estão reservados */

select * from assento;
select * from reserva;

SELECT 
    a.classe
FROM
    assento a,
    reserva r
WHERE
    a.numeroassento = r.numeroassento;
    
SELECT 
    a.classe
FROM
    assento a
        INNER JOIN
    reserva r ON a.numeroassento = r.numeroassento;
    
SELECT DISTINCT
    a.classe
FROM
    assento a
        NATURAL JOIN
    reserva;
