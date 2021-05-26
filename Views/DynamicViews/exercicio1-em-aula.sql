use empresa;
CREATE VIEW visao1 AS SELECT 'Brasil' AS pais, 'MG' AS estado, 'Juiz de Fora' AS cidade;

select * from visao1;

-- Nem precisa criar uma view
select 'miria' as nome, 'rua a' as endereco, '123456' as cpf, 'juiz de fora' as cidade;


/* Recuperar os funcionários e o nome dos projetos em que eles trabalham */
CREATE VIEW vw_funcionario_projeto AS
    SELECT 
        pnome, nome, projnome
    FROM
        funcionario f
            INNER JOIN
        trabalha_em t ON f.cpf = t.fcpf
            INNER JOIN
        projeto p ON t.pnr = p.projnumero;
        
-- Aplicar uma condição
SELECT 
    *
FROM
    vw_funcionario_projeto
WHERE
    projnome LIKE '%Produto%d';
    
/* Recupere o nome do projeto e a quantidade de funcionários que trabalham em cada projeto */
select projnome, count(*) as 'qtd funcionarios'
from vw_funcionario_projeto
group by projnome; -- não é o ideal    

/* Crie uma View que exiba todas as informações dos departamentos localizados em São Paulo */
CREATE VIEW vw_departamentos_sp AS
    SELECT 
        *
    FROM
        departamento
            NATURAL JOIN
        localizacao_dep l
    WHERE
        l.dlocal = 'São Paulo';

select * from vw_departamentos_sp;

/* Crie e exiba uma view que recupere o nome dos departamentos, a quantidade de funcionários de cada departamento e a soma do salários pagos */
CREATE VIEW vw_depart_salarios AS
    SELECT 
        d.nome, COUNT(*), SUM(salario)
    FROM
        funcionario f
            INNER JOIN
        departamento d ON f.dnr = d.dnumero
    GROUP BY d.dnumero;

select * from vw_depart_salarios;
    
use clinico;
/* Recuperar o nome do paciente, o nome do médico e o nome do medicamento que foi prescrito na sua consulta */

SELECT 
    nome_paciente, nome_medico, nome_medicamento
FROM
    paciente p
        INNER JOIN
    consulta c ON p.id_paciente = c.id_paciente
        INNER JOIN
    medico m ON c.id_medico = m.id_medico
        INNER JOIN
    prescricao pre ON pre.id_consulta = c.id_consulta
        INNER JOIN
    medicamento med ON med.id_medicamento = pre.id_medicamento;  -- 0.641/0.015 s
    
CREATE VIEW vw_juncao_nomes_paciente_medico_medicamento AS
    SELECT 
        nome_paciente, nome_medico, nome_medicamento
    FROM
        paciente p
            INNER JOIN
        consulta c ON p.id_paciente = c.id_paciente
            INNER JOIN
        medico m ON c.id_medico = m.id_medico
            INNER JOIN
        prescricao pre ON pre.id_consulta = c.id_consulta
            INNER JOIN
        medicamento med ON med.id_medicamento = pre.id_medicamento;

select * from vw_juncao_nomes_paciente_medico_medicamento;

