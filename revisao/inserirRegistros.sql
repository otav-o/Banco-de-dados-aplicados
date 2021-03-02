use hospital;

desc especialidade;

insert into especialidade values
	(123, 'Cardiologia'),
    (234, 'Ginecologia'),
    (345, 'Urologia')
;

SELECT 
    *
FROM
    especialidade;

desc hospital;
insert hospital values
	(11111111111111, 'Monte Sinai', 'Av. Presidente Itamar Franco',
	'Cascatinha', 'Juiz de Fora', '36033000', '3236901112'),
	(222222222222, 'Hospital Pronto Socorro', 'Av. Presidente Itamar Franco',
	'Cascatinha', 'Juiz de Fora', '36033000', '3236901112')
;

desc paciente;

insert into paciente values
	(11122233344, 23456789, 'Otávio', 'Avenida A', 
    'Cascatinha', 'Juiz de Fora', '36033000', '1983-07-18'),
    (2223334445, 1234567, 'Ivone Maria Silveira', 'Rua C',
    'Jardim de Alá', 'Juiz de Fora', 360360500, '1952-06-23')
;

SELECT 
    *
FROM
    paciente

desc medico;

insert into medico values
	(123455, 11222222222, 'Marcelo Condé', 'Av. Barão do Rio Branco', 'Centro', 'Juiz de Fora', 12345678),
    (223455, 11222222222, 'Eduardo Gomes', 'Av. Paulista', 'Centro', 'Florianópolis', 21345678),
    (323455, 11222222222, 'Paula Andrade', 'Rua São Mateus', 'São Pedro', 'Juiz de Fora', 345678922)
;

/*DELETE*/
set sql_safe_updates = 0;

-- Nenhuma linha
DELETE FROM paciente 
WHERE
    cidade = 'Rio de Janeiro';

-- Uma linha de qualquer tabela
DELETE FROM paciente 
WHERE
    cpf = 111222333444;

-- Duas linhas de qualquer tabela
DELETE FROM doenca 
WHERE
    descricao = 'Hipertensão portal'
    OR cid = 'O13';
    
-- Todas as linhas de qualquer tabela
delete from paciente; -- delete sem where

/*UPDATE*/
-- Nenhuma linha de qualquer tabela
update paciente set rua = 'Rua C' where cpf=12345687;

-- duas linhas de qualquer tabela
update hospital set rua = 'Rua K' where rua = 'Av. Barão do Rio Branco';

-- todas as linhas
update hospital set nome = 'Asconcer';
	