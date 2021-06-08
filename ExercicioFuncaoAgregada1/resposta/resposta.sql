use academia_ginastica;

-- QUESTÃO 01: Recupere os nomes e sobrenome dos instrutores e o código das turmas que eles ministram. Ordene pelo nome do instrutor.(1008 linhas retornadas) 

-- QUESTÃO 02: Recupere os dados dos instrutores que dão aula para mais de 2 turmas. (47 linhas retornadas)

select * from turma;
select * from instrutor;

SELECT 
    i.*, COUNT(*), t.instrutor_idinstrutor
FROM
    instrutor i
        LEFT JOIN
    turma t ON t.instrutor_idinstrutor = i.idinstrutor
GROUP BY i.idinstrutor
HAVING COUNT(*) > 2; 
 
-- QUESTÃO 03: Recupere os nomes das atividades com a quantidade de turmas que a praticam. Ordene pelo nome da atividade. (40 linhas retornadas)
select * from atividade;
select * from turma;

SELECT 
    a.nome, COUNT(t.idturma) AS 'Quantidade de turmas'
FROM
    atividade a
        LEFT JOIN
    turma t ON a.idatividade = t.atividade_idatividade
GROUP BY a.idatividade
ORDER BY a.nome;

-- QUESTÃO 04: Recupere os dados dos alunos não matriculados. (14247 linhas retornadas)

select * from aluno;
select * from matricula;

SELECT 
    a.*, m.datamatricula
FROM
    aluno a
        LEFT JOIN
    matricula m ON a.numMatricula = m.aluno_matricula
WHERE
    m.aluno_matricula IS NULL;
    
    
SELECT 
    a.*
FROM
    aluno a
WHERE
    a.numMatricula NOT IN (SELECT 
            a.numMatricula
        FROM
            aluno a
                INNER JOIN
            matricula m ON a.numMatricula = m.aluno_matricula);
            
SELECT 
    *
FROM
    aluno
WHERE
    aluno.numMatricula NOT IN (SELECT 
            aluno_matricula
        FROM
            matricula);

    
-- QUESTÃO 05: Recupere os dados dos alunos e os códigos das turmas que eles participam. Ordene pelo nome do aluno. (2656 linhas retornadas)