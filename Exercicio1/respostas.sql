use petshop;

-- Recupere todos os dados dos clientes que não possuem sobrenome ou que o sobrenome esteja vazio.(1 linha retornada)
select * from cliente
	where sobrenome = null or
    sobrenome = ''
;

-- Recupere todos os dados dos animais que o código da raça é maior que 20.(583 linhas retornadas)
select * from animal
	where raca > 20
;

-- Recupere todos os dados dos tipos de serviços cujos valores estão entre 50 e 100 reais. (7 linhas retornadas)
select * from tipo_servico
	where valor > 50
    and valor < 100
;

-- Recupere todos os dados dos serviços do ano de 2021 e que não estão pagos (170 linhas retornadas)
-- Para comparar o ano de uma data, utilize year(data)

select * from servico
	where year(data) = 2021
    and pago = false
;

-- Recupere todos os dados das raças que exigem um nível de cuidado alto (18 linhas retornadas).

select * from raca
	where nivel_cuidados = 'Alto'
;
	
/*
	Recupere os serviços que estão inadimplentes há mais de 1 ano.
	Na álgebra relacional use data<2020-03-02.
	No sql utilize a função datadiff -  exemplo DATEDIFF (curdate(), data)>365, pois o resultado é retornado em dias.https://www.w3schools.com/sql/func_mysql_datediff.asp 
*/

select * from servico
	where datediff(curdate(), data) > 365
;

