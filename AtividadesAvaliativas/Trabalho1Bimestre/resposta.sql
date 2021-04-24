use clinico;
select * from paciente;
select * from consulta;
select * from medico;
select * from medicamento;
select * from prescricao;

-- QUESTÃO 1(0.5 PONTO): Liste o nome dos médicos que realizaram consultas no dia 07/04/2014.
select nome_medico from medico natural join consulta where data_consulta = '2014-04-07';

-- QUESTÃO 2(0.5 PONTO): Liste o nome dos pacientes que consultaram com algum médico que já faleceu.
select p.nome_paciente from paciente p, consulta c, medico m where c.id_paciente = p.id_paciente and m.id_medico = c.id_medico and  m.situacao = 'falecido';
select p.nome_paciente from paciente p natural join consulta natural join medico m where m.situacao = 'falecido';
-- natural join retornou duas linhas a menos!

-- QUESTÃO 3(1 PONTO): Liste o nome dos pacientes que nunca realizaram uma consulta.(5 linhas retornadas). OBS: Use NOT IN.
SELECT 
    p.nome_paciente
FROM
    paciente p
WHERE
    p.id_paciente NOT IN (SELECT 
            id_paciente
        FROM
            consulta);

-- QUESTÃO 4(1 PONTO): Liste o nome dos médicos, juntamente com o nome dos pacientes que eles consultaram. Ordene pelo nome do médico.(3783 linhas retornadas).
SELECT 
    m.nome_medico, p.nome_paciente
FROM
    medico m,
    paciente p,
    consulta c
WHERE
    c.id_medico = m.id_medico
        AND c.id_paciente = p.id_paciente
ORDER BY m.nome_medico;

SELECT 
    m.nome_medico, p.nome_paciente
FROM
    medico m
        INNER JOIN
    consulta c ON c.id_medico = m.id_medico
        INNER JOIN
    paciente p ON c.id_paciente = p.id_paciente
ORDER BY m.nome_medico;

SELECT 
    m.nome_medico, p.nome_paciente
FROM
    medico m
        NATURAL JOIN
    consulta c
        NATURAL JOIN
    paciente p
ORDER BY m.nome_medico; -- retorna menos linhas (??)

-- QUESTÃO 5(1 PONTO): Liste o nome de todos os medicamentos que foram prescritos em alguma consulta. Elimine as repetições.(69 linhas retornadas). 

SELECT DISTINCT
    nome_medicamento
FROM
    medicamento
        NATURAL JOIN
    prescricao;

-- QUESTÃO 6(1 PONTO): Liste o nome do médico, o nome do paciente e o medicamento que ele prescreveu durante a consulta. (419 linhas retornadas)

SELECT 
    m.nome_medico, p.nome_paciente, med.nome_medicamento
FROM
    medico m
        NATURAL JOIN
    consulta c
        NATURAL JOIN
    prescricao
        NATURAL JOIN
    medicamento med,
    paciente p
WHERE
    p.id_paciente = c.id_paciente; -- tem como fazer com natural join?

    /*
    , paciente p
        NATURAL JOIN
    consulta;
    */