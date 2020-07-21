-- 1. Encontre os nomes e as datas de admissão dos instrutores onde aqueles contenha a letra ‘A’ no meio do
-- mesmo e que foram contratados após ’01/01/1990’ e que não termine o nome pela ‘o’.
-- RESP:
SELECT inst_nome, inst_dataadmissao
from instrutor
where inst_nome like '%A%'
  AND inst_dataadmissao > '01/01/1990'
  and inst_nome not like '%o';

--   2. Encontre o número do pedido, o código do cliente e o prazo de entrega dos pedidos 
-- cujo prazo de entrega
-- seja de 10 ou 20 ou 30 dias.
SELECT num_pedido, codigo_cliente, prazo_entrega
from pedido
WHERE prazo_entrega in (10,20,30);


-- 3. Mostre todos os dados dos clientes cujo CEP esteja entre 30077000 e 30079000 
-- e que não residam nem em
-- ‘RJ’ ou ‘PR’.

SELECT *
from cliente
WHERE cep BETWEEN '30077000' and '30079000'
  AND uf not in ('RJ', 'PR');

-- 4. Mostre o nome, a nota do 1 bimestre, a nota do 2 bimestre e 
-- a média dos dois bimestre.
--  Este último campo
-- calculado deve aparecer com o título de média final. Use a tabela histórico
SELECT hist_matriculaaluno, hist_notabim1, 
       hist_notabim2, (hist_notabim1+ hist_notabim2)/2 as "Média Final"
from historico;

-- 5. Mostre os códigos dos cursos e as turmas que estão o cursando para 
--turmas com preço da hora entre 25,00 e
-- 40,00.

select tur_codigocurso, tur_codtur , tur_precohoratur
from turma
where tur_precohoratur between 25 and 40;

-- 6. Encontre todos os dados dos pedidos que não 
-- pertencem ao cliente 720, mas que foram realizados a partir de
-- ’01/01/2005’.

select * 
from pedido
where codigo_cliente not in (720)
and data_pedido > '01/01/2005';

-- 7. Encontre os nomes dos cursos que iniciem pela palavra ‘Oracle’.

select *
from curso
where cur_nome like 'Oracle%';
