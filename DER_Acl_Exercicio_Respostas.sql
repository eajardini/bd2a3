create database bd2a3_acl
	encoding "UTF-8";

alter database bd2a3_acl 
	set datestyle = DMY;

\c bd2a3_acl

1)
create table usuario(
	usuarioID bigserial,
	login varchar(15) not null,
	senha varchar(50) not null,
	dataValidade date,
	usuarioBloqueado boolean,
	constraint pk_usuario primary key(usuarioID));


create table papel(
	papelID serial,
	nomePapel varchar(20),
	constraint pk_papel primary key(papelID));


create table RelUsuarioPapel(
	relUsuarioPapelID bigserial,
	usuarioID bigserial,
	papelID serial,
	constraint pk_RelUsuarioPapel primary key (relUsuarioPapelID),
	constraint fk_RelUsuarioPapel_usuario foreign key(usuarioID) references usuario,
	constraint fk_RelUsuarioPapel_papel foreign key(papelID) references papel);


2)
insert into papel values (default, 'Administrador');
insert into papel values (default, 'Vendas');
insert into papel values (default, 'Financeiro');

 papelid |   nomepapel
---------+---------------
       1 | Administrador
       2 | Vendas
       3 | Financeiro


3)
a)
insert into usuario 
	values (default, 'admin', md5('admin'), null, false);

select * from usuario;

insert into relusuariopapel 
values (default, 2, 1);

B)
insert into usuario
        values (default, 'laura', md5('laura123'), current_date + INTERVAL '2 YEAR', false);

select * from usuario;

insert into relusuariopapel
values (default, 3, 2);

select * from relusuariopapel;

C)
insert into usuario
        values (default, 'maria', md5('mama21'), current_date + INTERVAL '3 MONTH', false);

select * from usuario;

insert into relusuariopapel
values (default, 4, 3);

select * from relusuariopapel;

D)

insert into usuario
        values (default, 'marcos', md5('marcos43'), current_date - INTERVAL '1 DAY', false);

select * from usuario;

insert into relusuariopapel
values (default, 5, 3);

select * from relusuariopapel;

E)

insert into usuario
        values (default, 'tania', md5('tan98'), current_date + INTERVAL '1 WEEK', false);

select * from usuario;

insert into relusuariopapel
values (default, 6, 2);

insert into relusuariopapel
values (default, 6, 3);

select * from relusuariopapel;

F)

insert into usuario
        values (default, 'antonio', md5('ant37'), current_date + INTERVAL '4 MONTH', false);

select * from usuario;

insert into relusuariopapel
values (default, 7, 2);

select * from relusuariopapel;

G)

insert into usuario
        values (default, 'pedro', md5('pe22'), current_date + INTERVAL '6 MONTH', true);

select * from usuario;



4)

A) Liste os logins, senha e a situação (válido ou não) dos usuários cuja letra começam com ’M’.
select login, senha, usuarioBloqueado
  from usuario
 where login like 'm%';

B)  Liste os logins dos usuários e seus respectivos papeis. Só deve aparecer o login que possui papel
atribuído.
select login, nomePapel
  from usuario u, relUsuarioPapel rel ,papel p
 where u.usuarioID = rel.usuarioID
   and rel.papelID = p.papelID;

  login  |   nomepapel   
---------+---------------
 teste   | Administrador
 admin   | Administrador
 laura   | Vendas
 maria   | Financeiro
 marcos  | Financeiro
 tania   | Vendas
 tania   | Financeiro
 antonio | Vendas

C) Monte um relatório que liste todos os logins dos usuários. Para àqueles que possuem papéis, mostre,
além do login, o nome do papel, caso contrário, mostre NULL ou espaço em branco.

select login, nomePapel
  from usuario u LEFT JOIN relUsuarioPapel rel on (u.usuarioID = rel.usuarioID)
                 LEFT JOIN papel p             ON (rel.papelID = p.papelID);


  login  |   nomepapel   
---------+---------------
 teste   | Administrador
 admin   | Administrador
 laura   | Vendas
 maria   | Financeiro
 marcos  | Financeiro
 tania   | Vendas
 tania   | Financeiro
 antonio | Vendas
 pedro   | 
(9 rows)


D) Identifique o login e a data de validade do usuário que esteja com login vencido.

select login, dataValidade
  from usuario
 where datavalidade < current_date;


 login  | datavalidade 
--------+--------------
 marcos | 2020-08-17
(1 row)


E) Há usuários bloqueados? Identifique pelo login e pelo campo usuarioBloqueado.

select login, usuarioBloqueado
  from usuario
 where usuarioBloqueado = true;


 login | usuariobloqueado
-------+------------------
 pedro | t
(1 row)

F)  A gerência precisa de relatório que identifique os logins e senhas que não possuem papel.

select login
  from usuario
 where usuarioID not in (select usuarioID from relusuariopapel);


 login
-------
 pedro
(1 row)


5) Faça uma rotina para validar as credenciais de usuário que informou os dados por meio de formulário Login
do sistema. Você fará isso por confrontar o login e a senha informada com as armazenadas no BD. Não se
esqueça que você está usando senhas encriptadas por MD5.

select login, senha
  from usuario
 where login = 'laura'
   and senha = md5('laura123');


 login |              senha               
-------+----------------------------------
 laura | 58907c27b5ac1ad7289a6a56657b9e90
(1 row)



