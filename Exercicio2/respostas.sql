use fornecedor; -- banco de dados
select * from fornecedor; -- tabela

 -- Relação fornecedor
-- Selecione os fornecedores que não possuem cidade cadastrada.

select * from fornecedor
	where cidade is null
;

-- Selecione os fornecedores da cidade de São Paulo com status disponível.

select * from fornecedor
	where cidade = 'São Paulo'
    and status = 'disponível'
;

-- Selecione os fornecedores que não possuem o nome Pedro.

select * from fornecedor
	where fnome <> 'Pedro'
;

 -- Relação Peca
 select * from peca;
 
-- Selecione as peças de nome Tubo ou que possuem o preço maior que 2.00.

select * from peca
	where pnome = 'Tubo'
    or preco > 2
;
-- Selecione as peças de cor azul da cidade do Rio de Janeiro.

select * from peca
	where cor = 'Azul'
    and cidade = 'Rio de Janeiro'
;

-- Selecione as peças com o peso maior que 0.5.

select * from peca
	where peso > 0.5
;

-- Selecione as peças de nome Parafuso e possuem a cor azul ou as peças de nome Parafuso e que possuem o peso maior que 0.3.

select * from peca
	where pnome = 'Parafuso' 
	and (cor = 'Azul' or peso > 0.3)
;

-- Selecione as peças da cidade Juiz de Fora com peso maior que 0.3.

select * from peca
	where cidade = 'Juiz de Fora'
    and peso > 0.3
;

-- Selecione as peças com preço maior que 1.3 e preço menor que 3.

select * from peca
	where preco > 1.3 
    and preco < 3
;

 -- Relação Pedido
 select * from pedido;
 
-- Selecione os pedidos com a quantidade menor ou igual a 100.

select * from pedido
	where qdade <= 100
;

-- Selecione os pedidos das peças de número 1 ou de quantidade maior que 300.

select * from pedido
	where num_peca = 1
    or qdade > 300
;

-- Selecione todos os pedidos feitos pelo fornecedor número 1 ou número 2. 

select * from pedido
	where num_fornecedor = 1
    or num_fornecedor = 2
;

