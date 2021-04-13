select * from categoria;
select * from ies;
select * from area;
select * from organizacao;
select * from municipio;
select * from resultado;
select * from modalidade;

-- QUESTÃO 01: Recupere os nomes das ies e o nome das categorias das quais elas pertencem.(1478 linhas retornadas)
SELECT 
    i.nomeIES, c.nomeCategoria
FROM
    ies i,
    categoria c
WHERE
    i.codCategoria = c.codCategoria;
    
-- ou
SELECT 
    i.nomeIES, c.nomeCategoria
FROM
    ies i
        INNER JOIN
    categoria c ON i.codCategoria = c.codCategoria;
    
-- ou
SELECT 
    i.nomeIES, c.nomeCategoria
FROM
    ies i
        NATURAL JOIN
    categoria c;
    
-- QUESTÃO 02: Recupere o nome da ies, o nome da área e o conceito faixa das ies situadas no município de Juiz de Fora.(67 linhas retornadas)
SELECT 
    i.nomeIES, r.conceitoFaixa, a.nomeArea
FROM
    ies i,
    resultado r,
    area a,
    municipio m
WHERE
    i.codIES = r.codIES
        AND r.codArea = a.codArea
        AND r.codMunicipio = m.codMunicipio
        AND m.nomeMunicipio = 'Juiz de Fora';
        
-- ou
SELECT 
    i.nomeIES, r.conceitoFaixa, a.nomeArea
FROM
    ies i
        INNER JOIN
    resultado r ON i.codIES = r.codIES
        INNER JOIN
    area a ON r.codArea = a.codArea
        INNER JOIN
    municipio m ON r.codMunicipio = m.codMunicipio
WHERE
    m.nomeMunicipio = 'Juiz de Fora';

-- ou
SELECT 
    i.nomeIES, r.conceitoFaixa, a.nomeArea
FROM
    ies i
        NATURAL JOIN
    resultado r
        NATURAL JOIN
    area a
        NATURAL JOIN
    municipio m
WHERE
    m.nomeMunicipio = 'Juiz de Fora';
    
-- QUESTÃO 03: Recupere o nome da ies, o nome da área, o conceito faixa e o conceito contínuo das ies que receberam o conceito faixa ou conceito contínuo menor que 3.(7563 linhas retornadas)
SELECT 
    i.nomeIES, a.nomeArea, r.conceitoFaixa, r.conceitoContinuo
FROM
    ies i,
    area a,
    resultado r
WHERE
    i.codIES = r.codIES
        AND r.codArea = a.codArea
        AND (r.conceitoContinuo < 3
        OR r.conceitoFaixa < 3);
        
-- ou
SELECT 
    i.nomeIES, a.nomeArea, r.conceitoFaixa, r.conceitoContinuo
FROM
    ies i
        INNER JOIN
    resultado r ON i.codIES = r.codIES
        INNER JOIN
    area a ON r.codArea = a.codArea
WHERE
    r.conceitoContinuo < 3
        OR r.conceitoFaixa < 3; -- deu certo
        
-- ou
SELECT 
    i.nomeIES, a.nomeArea, r.conceitoFaixa, r.conceitoContinuo
FROM
    ies i
        NATURAL JOIN
    resultado r
        NATURAL JOIN
    area a
WHERE
    r.conceitoContinuo < 3
        OR r.conceitoFaixa < 3;
        
-- QUESTÃO 04: Recupere o nome da ies e o conceito contínuo de todas as ies cuja modalidade de ensino é presencial.(10054 linhas retornadas)
SELECT 
    i.nomeIES, r.conceitoContinuo
FROM
    ies i,
    resultado r,
    modalidade m
WHERE
    i.codIES = r.codIES
        AND r.codModalidade = m.codModalidade
        AND m.nomeModalidade LIKE '%presencial';
        
-- ou
SELECT 
    i.nomeIES, r.conceitoContinuo
FROM
    ies i
        INNER JOIN
    resultado r ON i.codIES = r.codIES
        INNER JOIN
    modalidade m ON r.codModalidade = m.codModalidade
WHERE
    m.nomeModalidade LIKE '%presencial';
    
-- ou
SELECT 
    i.nomeIES, r.conceitoContinuo
FROM
    ies i
        INNER JOIN
    resultado r ON i.codIES = r.codIES
        INNER JOIN
    modalidade m ON r.codModalidade = m.codModalidade
WHERE
    m.nomeModalidade LIKE '%presencial';
    
-- ou
SELECT 
    i.nomeIES, r.conceitoContinuo
FROM
    ies i
        NATURAL JOIN
    resultado r
        NATURAL JOIN
    modalidade m
WHERE
    m.nomeModalidade LIKE '%presencial';
        

