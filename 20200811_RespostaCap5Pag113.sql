--1. No relatório de desempenho de vendedores, há a necessidade de saber o número de pedido que cada vendedor fez. Este número será obtido pela função de agregação count(num_pedido). Sabe-se que exite pelo menos um vendedor que não vendeu nada. desta forma, encontre o nome dos vendedores e a quantidade de pedidos realizados por eles. Traga até mesmo os que não fizeram nenhum pedido.

--Antes, vamos criar um vendedor novo para garantir que haja pelo menos um vendedor sem pedido.
insert into vendedor
values (1211, 'Vendedor sem nome', 43211, 'A', '123456');

select nome_vendedor, count(num_pedido)
from vendedor ve left join pedido pe 
     on (ve.codigo_vendedor = pe.codigo_vendedor)
group by 1;

Resposta:
   nome_vendedor   | count 
-------------------+-------
 Carlos            |     1
 Felipe            |     1
 Vendedor sem nome |     0
 Maurício          |     2
 Antônio           |     3
 Josias            |     1
 João              |     7
 Jonas             |     1
 José              |     2
(9 rows)


--2. Em escolas, é corriqueiro que alunos façam matrícula, mas abandonem o curso sem mesmo terminar um semestre. A secretaria da escola que utiliza o sistema precisa ter conhecimento do nome dos alunos e o histórico deles. Também é preciso saber aqueles alunos que fizeram matrícula, mas se evadiram do curso antes de terminá-lo. Destarte, elabore uma consulta que traga o nome do aluno e o número de sua matrícula na tabela histórico. Traga mesmo aqueles que não possuam históricos.

select alu_nome , hist_matriculaaluno
from aluno alu left join historico hist
           on (alu.alu_matricula = hist_matriculaaluno)
;

Resposta:

 alu_nome        | hist_matriculaaluno 
------------------------+---------------------
 Marcos Silva Hydra     |                   1
 Luis Firmino Rios      |                   5
 Marcos Silva Hydra     |                   1
 Marcos Silva Hydra     |                   1
 Tadeu Mauro Alencar    |                   4
 Wellington Machado     |                   3
 Otávio Ramos Oliveira  |                    
 Ademar Silveira Barros |                    

 
 --3. Altere a consulta anterior para trazer somente os alunos desistentes. O relatório deve trazer somente o nome dos alunos que não possuam histórico. Faça por meio de junção Left Join.
 
 select alu_nome                        
from aluno alu left join historico hist
   on (alu.alu_matricula = hist_matriculaaluno)
where hist_matriculaaluno is null;

Respsota:
        alu_nome        
------------------------
 Otávio Ramos Oliveira
 Ademar Silveira Barros
(2 rows)


