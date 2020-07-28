-- FUNCAGREG001 - Encontre a média dos preços de venda dos produtos que terminem com a letra 'o'. Arredonde para duas casas decimais.
SELECT round(avg(valor_venda),2)
from produto
where descricao like '%o';

--Encontre a média das horas-aulas de todas as turmas. Trunque com duas casas decimais. Coloque alias de ”Média dos Valores das Horas/Aulas”.
select trunc(avg(tur_precohoratur),2) as "Média dos Valores das Horas/Aulas"
from turma;

-- FUNCAGREG002 - Encontre o curso mais caro e o mais barato. Use as duas funções no mesmo SELECT. Coloque o alias "Valor do Curso Mais Caro", para o curso curso de maior valor e o alias "Valor do Curso Mais Barato" para o curso de menor valor.
select max(cur_valorcurso) as "Valor do Curso Mais Caro", min(cur_valorcurso) as "Valor do Curso Mais Barato"
from curso;

--Mostre a quantidade de alunos cadastrados no sistema.
select count(*)
from aluno;

-- GROUPBY001 - Encontre: 1 - A soma da quantidade de produtos, por meio da função sum na coluna quantidade; 2 - A quantidade de produtos distintos, por meio da função count sobre a coluna quantidade, que cada pedido (coluna num_pedido) possui. Utilize a tabela item_pedido. 
select num_pedido,sum(quantidade), count(quantidade)
from item_pedido
GROUP BY 1;
ou 
select num_pedido,sum(quantidade), count(quantidade)
from item_pedido
GROUP BY num_pedido;
ou 
select num_pedido,sum(quantidade), count(quantidade)
from item_pedido
GROUP BY 1 asc;
ou 
select num_pedido,sum(quantidade), count(quantidade)
from item_pedido
GROUP BY num_pedido asc;

-- ORDERBY001 - Faça uma consulta para um relatório que retorne as descrições do produtos e seus respectivos valores de venda. Ordene de forma ascendente pelo valor de venda.
select descricao, valor_venda
from produto
order by valor_venda;
OU
select descricao, valor_venda
from produto
order by 2;

-- ORDERBY002 - Paulo Afonso precisa de um relatório que contenha o código do cliente e a quantidade de pedidos que cada um possui. Utilize a tabela pedido. Mostre ordenado de forma descente pela quantidade de pedidos de cada código do cliente. 
select codigo_cliente, count(*)
from pedido
GROUP BY 1
order by 2 desc; 
OU
select codigo_cliente, count(*)
from pedido
GROUP BY codigo_cliente
order by count(*) desc; 

--Encontre a soma dos salários dos vendedores agrupados por faixa de comissão. Mas só mostre as faixas cuja a soma seja igual ou maior que 6000.
SELECT faixa_comissao, sum(salario_fixo)
from vendedor
GROUP BY 1
having sum(salario_fixo) >= 6000;
