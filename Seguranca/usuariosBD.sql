select * from mysql.user;

create user otavio identified by 'senha_usuario';
create user otavio@localhost identified by 'senha_usuario'; -- @ = at

-- inicialmente, não há qualquer permissão

show grants for otavio;

-- grant all on nome_banco.nome_tabela; -- grant all on *.*

grant all on hospital.doenca to otavio;

grant all on *.* to otavio with grant option;

-- db.* -- todas as tabelas do banco

grant select (cpf, datanasc) on hospital.paciente to otavio@localhost;

grant all on *.* to novo_usuario with grant option;
-- dar ou retirar permissões de outros usuários

grant all on *.* to otavio with grant option;

show grants for otavio;

/* 
	revoke <privilegios>
	on <objetos>
	from <usuarios>; 
*/

revoke all privileges on *.* from root@localhost;

grant all privileges on *.* to root@localhost with grant option;

revoke all privileges on *.* from otavio;


DELETE FROM mysql.user 
WHERE
    user = 'otavio';
    

/* Crie os usuários: fulano, ciclano, beltrano e admin; */
create user fulano, ciclano, beltrano, admin identified by '1', '2', '3', '4'; -- confirmar se é possível definir senhas diferentes

/* Fulano tem acesso a todas as tabelas, podendo conusltar, inserir, alterar e excluir dados */
grant select, insert, update, delete on empresa.* to fulano;
show grants for fulano;

/* Ciclano deve ter acesso somente à tabela funcionário.
Ele pode consultar e inserir dados, mas não alterar ou excluir. */

grant select, insert on empresa.funcionario to ciclano;
show grants for ciclano;

/* Fulano e Ciclano ganham direito de visualização, inclusão e alteração na tabela departamento; */
grant select, insert on empresa.departamento to fulano, ciclano;

/* Fulano ganha o direito de exclusão da tabela departamento */
grant drop on empresa.departamento to fulano;
show grants for fulano;

/* Admin tenta excluir a tabela departamento */

/* Root revoga o direito de todos os usuário (fulano, ciclano, beltrano e admin) */
revoke all on *.* from fulano, ciclano, beltrano, admin; -- não!

revoke select, insert, drop on empresa.departamento from fulano;
revoke select, insert, update, delete on empresa.* from fulano;
revoke select, insert on empresa.departamento from ciclano;
revoke select, insert on empresa.funcionario from ciclano;

select * from mysql.user;
