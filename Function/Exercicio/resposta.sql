/* 
	Implemente uma função no banco de dados pizzaria para calcular o que será 
    inserido na coluna valorTotal quando um novo pedido for feito, ou seja, 
    quando uma nova inserção for feita na tabela pedido.
*/

use pizzaria;

DELIMITER //
	create function calcularTotalPedido(id int, qtd int) returns real 
	deterministic 
	begin 
		declare total real; 
		set total = (select valor from pizzas where id = idpizzas) * qtd;
		return total;
	end
//

insert into pedido (idpizzas, quantidade, valorPedido)
values(2, 5, calcularTotalPedido(2, 5));

select * from pedido;