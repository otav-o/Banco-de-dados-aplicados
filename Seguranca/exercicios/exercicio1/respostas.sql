/* Crie o usuário administrador e admin e conceda a eles todas as permissões, como o usuário root. 
Incluindo a permissão de GRANT. Faça login com o usuário administrador e realize as seguintes operações.*/

use hospital;
create user oioi identified by '123';

grant all on *.* to administrador;

show grants for root@localhost;

select * from mysql.user;

grant all on hospital, sistema_bancario, locadora, livraria
to oioi identified by '123';

grant all on *.* to oioi with grant option;


/* Uma nova recepcionista foi contratada no hospital, sendo assim, crie o usuário recepcionista e conceda 
a ela permissões de visualizar, incluir, atualizar os registros das tabelas paciente, médico e doença e diagnóstico.*/

grant select(*) on hospital to recepcionista identified by '123456';


grant select, insert, update on hospital.paciente to recepcionista identified by '';
grant select, insert, update on hospital.medico to recepcionista identified by '';
grant select, insert, update on hospital.doenca to recepcionista identified by '';
grant select, insert, update on hospital.diagnostico to recepcionista identified by '';
show grants for recepcionista;


--

create user gerente identified by '';
grant all on sistema_bancario.* to gerente;
show grants


