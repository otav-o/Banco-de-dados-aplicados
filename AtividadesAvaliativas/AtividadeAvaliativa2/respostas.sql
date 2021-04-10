use hospital; 
select * from paciente;
select * from diagnostico;
select * from doenca;

-- QUESTÃO 01: Recupere o nome e data de nascimento dos pacientes que residem no Centro.
SELECT 
    nome, datanasc
FROM
    paciente
WHERE
    bairro = 'Centro';
    
-- QUESTÃO 02: Recupere o nome do paciente e a descrição da(s) doença(s) que ele foi diagnosticado.

SELECT 
    p.nome, d.descricao
FROM
    paciente p,
    doenca d,
    diagnostico di
WHERE
    p.cpf = di.cpf AND d.cid = di.cid;
    
-- QUESTÃO 03: Recupere o nome e data de nascimento dos pacientes que foram diagnosticados com Anorexia nervosa(1 linha retornada).
SELECT 
    p.nome, p.datanasc
FROM
    paciente p,
    doenca d,
    diagnostico di
WHERE
    p.cpf = di.cpf AND d.cid = di.cid
        AND d.descricao = 'Anorexia nervosa';
        
SELECT 
    p.nome, p.datanasc
FROM
    paciente p
        INNER JOIN
    diagnostico di ON p.cpf = di.cpf
        INNER JOIN
    doenca d ON di.cid = d.cid
WHERE
    d.descricao = 'Anorexia nervosa';
    
SELECT 
    p.nome, p.datanasc
FROM
    paciente p
        NATURAL JOIN
    diagnostico
        NATURAL JOIN
    doenca d
WHERE
    d.descricao = 'Anorexia nervosa';
    
-- QUESTÃO 04: Recupere o nome e o crm dos médicos especialistas em psiquiatria(1 linha retornada).
select * from medico;
select * from medico_especialidade;
select * from especialidade;

SELECT 
    m.nome, m.crm
FROM
    medico m,
    medico_especialidade me,
    especialidade esp
WHERE
    m.crm = me.crm AND me.rqe = esp.rqe
        AND esp.especialidade = 'Psiquiatria';

SELECT 
    m.nome, m.crm
FROM
    medico m
        INNER JOIN
    medico_especialidade me ON m.crm = me.crm
        INNER JOIN
    especialidade esp ON me.rqe = esp.rqe
WHERE
    esp.especialidade = 'Psiquiatria';

SELECT 
    m.nome, m.crm
FROM
    medico m
        NATURAL JOIN
    medico_especialidade
        NATURAL JOIN
    especialidade esp
WHERE
    esp.especialidade = 'Psiquiatria';
    
-- QUESTÃO 05: Recupere o nome dos médicos e o nome dos hospitais que eles atendem(20 linhas retornadas).
select * from hospital; select * from medico_hospital;

SELECT 
    m.nome, h.nome
FROM
    medico m,
    hospital h,
    medico_hospital mh
WHERE
    m.crm = mh.crm AND h.cnpj = mh.cnpj;
    
SELECT 
    m.nome, h.nome
FROM
    medico m
        INNER JOIN
    medico_hospital mh ON m.crm = mh.crm
        INNER JOIN
    hospital h ON h.cnpj = mh.cnpj;
    
/*
SELECT 
    m.nome, h.nome
FROM
    medico m
        NATURAL JOIN
    medico_hospital
        NATURAL JOIN
    hospital h;
*/ -- zero linhas retornadas

-- QUESTÃO 06: Recupere os dados dos pacientes que tem mais de 40 anos(7 linhas retornadas).
-- Dica: use year(now()) para extrair o ano da data atual e year(datanasc) para extrair o ano da data de nascimento. Subtraia as duas.

SELECT 
    *
FROM
    paciente
WHERE
    YEAR(NOW()) - YEAR(datanasc) > 40;
    
-- QUESTÃO 07: Recupere o nome e a especialidade dos médicos que diagnosticaram alguma doença nos pacientes(23 linhas retornadas).
SELECT 
    m.nome, esp.especialidade
FROM
    medico m,
    medico_especialidade me,
    especialidade esp,
    diagnostico di
WHERE
    m.crm = me.crm AND me.rqe = esp.rqe
        AND m.crm = di.crm;
        
SELECT 
    m.nome, esp.especialidade
FROM
    medico m
        NATURAL JOIN
    medico_especialidade me
        NATURAL JOIN
    especialidade esp,
    diagnostico di
WHERE
    m.crm = di.crm; -- é possível fazer sem o where?
    