--  Mostre os números dos pedidos, os nomes dos Clientes e a data do pedido que compraram no dia 01/02/2018. 
-- Retorne a dat no formato DD/MM/AAAA. Faça da maneira tradicional (ANSI89) e moderna (ANSI92).
--ANSI89
SELECT num_pedido, nome_cliente, to_char(data_pedido, 'DD/MM/YYYY')
from cliente c, pedido p  
where c.codigo_cliente = p.codigo_cliente
  and p.data_pedido = '01/02/2018';
--ANSI92
SELECT num_pedido, nome_cliente, to_char(data_pedido, 'DD/MM/YYYY')
from cliente c INNER JOIN pedido p  on (c.codigo_cliente = p.codigo_cliente)
where p.data_pedido = '01/02/2018';

--2. Dado o produto Papel, mostre a descrição do produto e os números dos pedidos que os produtos se encontram. Use a tabela produto e item_pedido. 
select descricao, num_pedido
from produto pro, item_pedido ip
where pro.codigo_produto = ip.codigo_produto
  and descricao = 'Papel';

--3. Com a cidade de São Paulo, encontre o a quantidade de pedido feita por clientes que nela residem.
select cidade, count(num_pedido)
from cliente c, pedido p
where c.codigo_cliente = p.codigo_cliente
  and c.cidade = 'São Paulo'
group by 1;

--4. Encontre o nome da agência e a a soma dos saldos das contas da agência da cidade de Araraquara.
select nome_age, sum(saldo_con)
from agencia ag, conta con
where ag.cod_age  = con.cod_age_con
group by 1;

--5. Altere a consulta anterior para trazer a soma dos saldos das contas por cidade. Mostre o nome da cidade e a soma dos fundos.
select cidade_age, sum(saldo_con)
from agencia ag, conta con
where ag.cod_age  = con.cod_age_con
group by 1;