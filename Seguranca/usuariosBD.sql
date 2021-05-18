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
    


