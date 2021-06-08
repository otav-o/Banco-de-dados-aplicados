-- TRIGGERS
DELIMITER //
CREATE 
    TRIGGER insert_vendas
 AFTER INSERT ON itensvenda FOR EACH ROW 
    BEGIN 
		update produtos set estoque = estoque - new.quantidade
        where referencia = new.produto;
    END
//

insert into itensvenda values(1, '001', 1);

insert into itensvenda values(2, '002', 2);

insert into itensvenda values(3, '003', 3);
-- antes da inserção: new
-- depois da inserção: old


DELIMITER //
CREATE 
    TRIGGER delete_vendas
 AFTER DELETE ON itensvenda FOR EACH ROW 
    BEGIN 
		update produtos set estoque = estoque + old.quantidade
        where referencia = old.produto;
    END //
    
delete from itensVenda where venda = 4;


insert into itensVenda values (4, '001', 5);


/* Crie uma nova trigger que antes de ralizar uma operaçção dna tabela itens 
venda verifique se o estuoque é suviciente para a quantidade comprada*/

delimiter //
CREATE 
    TRIGGER  checar_estoque
 BEFORE INSERT ON itensvenda FOR EACH ROW 
    BEGIN 
		declare quantidadeEstoque integer;
		set quantidadeEstoque = (select estoque from produtos where referencia = new.produto);
        if(quantidadeEstoque < new.quantidade) then
			SIGNAL SQLSTATE '45000'; 
        end if
    END
//
