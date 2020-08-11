-- 1. Encontre as descrições dos produtos que não 
-- apareceram em pedido algum.

select descricao
from produto
where codigo_produto not in (select codigo_produto
                             from item_pedido);


-- 2. Encontre o nome do curso de valor mais alto.
select cur_nome
from curso
where cur_valorcurso in (select max(cur_valorcurso)
                         from curso);

cur_nome 
----------
 Redes I
(1 row)


-- 3. Encontre os nomes dos instrutores que possuem mais de 2 turmas. 
--  Ordene esse nome por ordem alfabética decrescente.
select inst_codigo, inst_nome
        from instrutor
        where inst_codigo in (select count(tur_codigoinstrutor)
                              from turma
                              group by tur_codigoinstrutor
                              having count(tur_codigoinstrutor) >= 2);
 
 inst_codigo |   inst_nome   
-------------+---------------
           2 | Pedro Paula
           3 | Augusto Lemos
(2 rows)

-- 4. Projete os nomes dos correntistas (tabela clientecor) que não fizeram empréstimos nem depósitos.

select cod_cli, nome_cli
        from clientecor 
        where cod_cli not in (select cod_cli_dep from depositante)
          and cod_cli not in (select cod_cli_dev from devedor);


 cod_cli | nome_cli 
---------+----------
       3 | Turner
(1 row)


