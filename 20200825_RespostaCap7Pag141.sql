--1. Insira um novo cliente. Vocês escolherão os dados para a tabela Cliente.
insert into cliente
values (878, 'José da Silva Pereira', 'Rua das Couves', 'Votuporanga', '17898-989', 'SP', '2222', '111');

INSERT 0 1


--2. Atualize com aumento o salário do vendedor Josias em 10%.
update vendedor 
set salario_fixo = salario_fixo * 1.1
where codigo_vendedor = 310;



--3. Faça uma baixa no estoque. Diminua da tabela Produto a respectiva quantidade vendida informada na tabela
--   Item_Pedido para produtos cuja unidade seja 'M'.

a) select descricao, unidade, qtde from produto;

descricao | unidade |  qtde
-----------+---------+--------
 Linho     | M       | 111.00
 Papel     | M       | 111.00
 Chocolate | BAR     | 111.00
 Linha     | M       | 111.00
 Vinho     | L       | 111.00
 Queijo    | Kg      | 111.00
 Madeira   | M       | 111.00
 Ouro      | G       | 111.00
(8 rows)

b)
update produto pro
set qtde = qtde - (select sum(quantidade) 
	                 from item_pedido ip 
		               where ip.codigo_produto = pro.codigo_produto)
where unidade = 'M';

c)
select descricao, unidade, qtde from produto;

d)
 descricao | unidade |  qtde
-----------+---------+--------
 Linho     | M       |  91.00
 Papel     | M       | -12.00
 Linha     | M       | -19.00
 Madeira   | M       | 103.00
 Chocolate | BAR     | 111.00
 Vinho     | L       | 111.00
 Queijo    | Kg      | 111.00
 Ouro      | G       | 111.00
(8 rows)



4. Simule a inclusão de um pedido feito por um novo cliente de acordo com as seguintes orientações:
(a) O cliente se chama Antônio das Neves. Os demais dados são escolhidos por vocês
insert into cliente
values (893, 'Antônio das Neves', 'Rua das Laranjeiras', 'Votuporanga', '17898-989', 'SP', '2222', '111');


(b) O pedido terá data de hoje e o vendedor será o Josias.
i) select codigo_vendedor, nome_vendedor
   from vendedor
   where nome_vendedor = 'Josias';

codigo_vendedor | nome_vendedor
-----------------+---------------
             310 | Josias


ii) insert into pedido
values (676, 22, 893, 310, 342.88, current_date);

select * from pedido where num_pedido = 676;
 num_pedido | prazo_entrega | codigo_cliente | codigo_vendedor | total_pedido | data_pedido
------------+---------------+----------------+-----------------+--------------+-------------
        676 |            22 |            893 |             310 |       342.88 | 2020-08-25
(1 row)


(c) Dois produtos constarão no pedido: ouro e vinho. A quantidade será escolhida por vocês.

i) select codigo_produto, descricao
   from produto 
   where descricao like 'Ouro%' or descricao like 'Vinho%';


 codigo_produto | descricao 
----------------+-----------
             78 | Vinho
             13 | Ouro
(2 rows)


ii) 

--Vinho
insert into item_pedido 
values (676, 78, 12, 23.00, 16.00);

--Ouro
insert into item_pedido 
values (676, 13, 12, 23.00, 16.00);

5. Remova o cliente que vocês inseriram no item 1.

delete from cliente 
where codigo_cliente = 878;

6. Remova o cliente o cliente Antônio da Neves criado no item 4.

(a) Caso haja erro, escreva o motivo do erro. Imagine que você está explicando o motivo do SGBD não

deixar a remoção do referido cliente em um teste para vaga de emprego.

Resposta: Não foi possível remover o referido cliente pois o mesmo se encontra com pedidos relacionados ao seu código. Para removê-lo tenho de apagar nesta ordem:
1) Os itens de pedido do pedido do cliente Antônio das Neves
delete from item_pedido
where num_pedido = 676;

2) Seu pedido
delete from pedido
where num_pedido = 676;

3) Por fim, o referido cliente.
delete from cliente
where codigo_cliente = 893;



