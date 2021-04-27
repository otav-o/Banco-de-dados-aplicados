use hospital;
select * from medico;
select * from doenca;
select * from diagnostico;
select * from paciente;
select * from hospital;
select * from medico_hospital;

-- QUESTÃO 01: Recupere o(s) nome(s) do(s) médico(s) e a quantidade de doenças que ele diagnosticou. Ordene da maior para menor quantidade(11 linhas retornadas).
SELECT 
    m.nome, COUNT(d.cid)
FROM
    medico m
        NATURAL JOIN
    diagnostico
        NATURAL JOIN
    doenca d
GROUP BY m.nome
ORDER BY COUNT(d.cid) DESC; -- por quê não funciona com natural join?

SELECT 
    m.nome, COUNT(d.cid)
FROM
    medico m
        INNER JOIN
    diagnostico di ON m.crm = di.crm
        INNER JOIN
    doenca d ON di.cid = d.cid
GROUP BY m.nome
ORDER BY COUNT(d.cid) DESC;

-- QUESTÃO 02: Recupere o(s) nome(s) do(s) paciente(s) diagnosticado(s) com mais de 2 doenças(3 linhas retornadas).
SELECT 
    p.nome
FROM
    paciente p
        INNER JOIN
    diagnostico di ON p.cpf = di.cpf
        INNER JOIN
    doenca d ON d.cid = di.cid
GROUP BY p.cpf
HAVING COUNT(d.cid) > 2;

SELECT 
    p.nome
FROM
    paciente p
        NATURAL JOIN
    diagnostico
        NATURAL JOIN
    doenca d
GROUP BY p.cpf
HAVING COUNT(d.cid) > 2;


-- QUESTÃO 03: Recupere o(s) nome(s) do(s) médico(s) que não trabalha(m) em nenhum hospital(5 linhas retornadas).
SELECT 
    m.nome
FROM
    medico m
        LEFT JOIN
    medico_hospital mh ON m.crm = mh.crm
WHERE
    mh.crm IS NULL;
    
SELECT 
    m.nome
FROM
    medico m
WHERE
    m.crm NOT IN (SELECT 
            crm
        FROM
            medico_hospital);


-- QUESTÃO 04: Recupere o(s) nome(s) de todos os pacientes. Caso ele tenha sido diagnosticado com alguma doença, recupere também a descrição da doença(23 linhas retornadas).

SELECT 
    p.nome, d.descricao
FROM
    paciente p
        LEFT JOIN
    diagnostico di ON di.cpf = p.cpf
        NATURAL JOIN
    doenca d;
    
-- não há paciente sem nenhuma doença/diagnóstico?

SELECT 
    p.nome
FROM
    paciente p
WHERE
    p.cpf NOT IN (SELECT 
            cpf
        FROM
            diagnostico);

SELECT 
    p.nome, d.descricao
FROM
    paciente p
        LEFT JOIN
    diagnostico di ON di.cpf = p.cpf
        NATURAL JOIN
    doenca d
WHERE
    d.cid IS NULL;
