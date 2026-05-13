/* PADARIA */
create table padaria_endereco(
	id_endereco int auto_increment primary key,
    rua varchar(45),
    numero int not null,
    bairro varchar(45),
    cep char(8),
    complemento varchar(45) not null,
    cidade varchar(45) not null,
    uf varchar(45) not null
);

insert into padaria_endereco(rua, numero, bairro, cep, complemento)
	values("Rua das avencas", 205, "Polvilho", "06342310", "Casa"),
		  ("Rua dos flox", 56, "Polvilho", "06520450", "Casa"),
          ("Rua Jose Peixoto", 88, "Parque Santana", "04567232", "Prédio"),
          ("Av. Faria Lima", 378, "Pinheiros", "08765397", "Prédio"),
          ("Av Paulista", 789, "Bela Vista", "03456542", "Prédio"),
          ("Av. Nove de Julho", 1267, "Jardim Europa", "02347865", "Prédio"),
          ("Av. Rebouças", 7562, "Pinheiros", "08721390", "Prédio"),
          ("Av. Europa", 1233, "Jardins", "02347556", "Prédio"),
          ("Av. Europa", 1980, "Jardim Europa", "02347821", "Prédio"),
          ("Av. Ipiranga ", 1445, "Santa Cecília", "65489722", "Prédio");
select * from padaria_endereco;

create table padaria_produto(
	id_produto int auto_increment primary key,
    nome varchar(100),
    preco decimal(8,2)
);

insert into padaria_produto(nome, preco)
	values('Pão Francês (Unidade)', 1.00),
		  ('Pão de Queijo Especial', 4.50),
		  ('Bolo de Fubá Cremoso', 28.50),
		  ('Croissant de Presunto e Queijo', 12.90),
		  ('Baguete Italiana', 15.00),
		  ('Sonho de Creme', 7.50),
		  ('Pão de Mel', 6.00),
		  ('Rosca Doce com Coco', 18.90),
		  ('Pão de Forma Artesanal', 14.00),
		  ('Broa de Milho', 5.50),
		  ('Carolina de Chocolate (Cento)', 45.00),
		  ('Torta de Frango Individual', 11.00),
		  ('Biscoito de Polvilho 200g', 9.80),
		  ('Brioche de Manteiga', 8.50),
		  ('Pão de Leite (Pacote)', 13.00);
select * from padaria_produto;

create table padaria_fornecedor(
	id_fornecedor int auto_increment primary key,
    nome varchar(100),
    telefone varchar(20)
);

insert into padaria_fornecedor(nome, telefone) 
	values('Moinho Central Alimentos', '(11)4002-8922'),
		  ('Laticínios Vale do Sol', '(31)3224-5566'),
		  ('Distribuidora de Ovos Granja Real', '(19)98765-4321'),
		  ('Frigorífico Corte Fino', '(21)2501-3030'),
		  ('Hortifruti Direto do Campo', '(41)3344-2211'),
		  ('Embalagens Plásticas Descart-Bem', '(11)5566-7788'),
		  ('Café Aroma de Minas', '(35)3421-9000'),
		  ('Doces & CIA Confeitaria Profissional', '(11)2233-4455'),
		  ('Bebidas e Cia Distribuidora', '(81)3030-4040'),
		  ('Mantecal Derivados de Trigo', '(47)3211-0099'),
		  ('Fermentos e Aditivos BioMix', '(11)91234-5678'),
		  ('Frios e Embutidos Sabor de Casa', '(51)3322-1100');
select * from padaria_fornecedor;

create table padaria_vendas(
	id_venda int auto_increment primary key,
    quantidade int,
    data_venda date,
    id_produto int,
    foreign key(id_produto) references padaria_produto(id_produto)
);

insert into padaria_vendas(id_produto, quantidade, data_venda)
	values(1, 150, '2024-05-01'), 
		  (2, 200, '2024-05-01'), 
		  (3, 120, '2024-05-02'), 
		  (4, 180, '2024-05-02'), 
		  (5, 110, '2024-05-03'), 
		  (6, 195, '2024-05-03'), 
		  (7, 130, '2024-05-04'), 
		  (8, 160, '2024-05-04'), 
		  (9, 140, '2024-05-05'), 
		  (10, 175, '2024-05-05'), 
		  (11, 200, '2024-05-06'), 
		  (12, 105, '2024-05-06'), 
		  (13, 190, '2024-05-07'), 
          (14, 125, '2024-05-07'), 
          (15, 165, '2024-05-08'), 
		  (1, 185, '2024-05-08'), 
          (2, 115, '2024-05-09'), 
          (3, 145, '2024-05-09'), 
		  (4, 200, '2024-05-10'), 
          (5, 135, '2024-05-10'),
          (6, 25, '2024-05-11'), 
          (7, 30, '2024-05-11'), 
          (8, 20, '2024-05-12'), 
		  (9, 28, '2024-05-12'), 
          (10, 22, '2024-05-13');
select * from padaria_vendas;

/*--------------------------------------------------------------------*/

-- exercicos 
-- Listar todos os produtos cadastrados
select nome AS Produtos
from padaria_produto;

-- Listar total de unidades vendidas por produto
select nome, SUM(quantidade) as total_vendido
from padaria_produto, padaria_vendas
where padaria_vendas.id_produto = padaria_produto.id_produto
group by padaria_vendas.id_produto, nome;

-- Listar o total de vendas do Bolo de Fubá Cremoso
select nome, sum(id_venda) as total_vendas
from padaria_produto, padaria_vendas
where padaria_produto.nome = 'Bolo de Fubá Cremoso';

-- Listar o total de vendas da Baguete Italiana
select nome, sum(id_venda) as total_vendido
from padaria_produto, padaria_vendas
where padaria_produto.nome = 'Baguete Italiana';

-- Produtos vendidos em 2024-05-06
select  id_venda,  data_venda, nome
from padaria_produto, padaria_vendas
where padaria_produto.id_produto = padaria_vendas.id_produto
	  AND data_venda = '2024-05-06';
      
/*--------------------------------------------------------------------*/

-- ATIVIDADE - PADARIA
-- 1. inserir pelo menos 4 registros na tabela de produtos
insert into padaria_produto(nome, preco) 
	values('Pão de Batata com Requeijão', 6.50),
		  ('Baguete com Gergelim', 12.00),
	      ('Misto Quente Especial', 14.90),
		  ('Rosquinha de Leite Ninho', 4.00);

-- 2. atualizar pelo menos 1 desses registros
update padaria_produto
set preco = 1.99
where id_produto = 1;

-- 3. excluir 1 destes registros
delete from padaria_produto
where id_produto = 14;

-- 4. fazer a consulta dessa tabela
select * 
from padaria_produto;

/*--------------------------------------------------------------------*/

-- 1. Quais os cinco produtos que mais venderam?
select sum(quantidade), nome
from padaria_vendas natural join padaria_produto
    group by id_produto
    limit 5;

-- 2. Quais fornecedores são responsáveis pelos três produtos mais vendidos?
select padaria_fornecedor.nome
from padaria_vendas natural join padaria_fornecedor
    group by padaria_fornecedor.nome
    limit 3;

-- 3. Existe algum produto cadastrado que ainda não foi vendido?
select nome
from padaria_produto
	where id_produto not in (
		select id_produto
        from padaria_vendas 
    );

-- 4. Qual o faturamento total de cada dia registrado?
select sum(total_venda) as Faturamento_total, data_venda
from padaria_vendas
	group by data_venda;
    
/*--------------------------------------------------------------------*/

-- Atividade Padaria
-- Inserir pelo menos 4 registros na tabela de produtos
insert into padaria_produto(nome, preco, id_fornecedor, qtde_estoque)
	values("Baguete Italiana", 15.00, 1, 41),
		  ("Pâo de Forma Artesanal", 14.00, 10, 30),
          ("Torta de Frango Individual", 11.00, 4, 58),
          ("Misto Quente Especial", 14.90, 12, 17);

-- 🛠️ Atualizar pelo menos 1 desses registros
update padaria_produto
set preco = 1.99
where id_produto = 1;

-- 🗑️ Excluir 1 desses registros
delete from padaria_produto
where nome = "Sonho de Doce de Leite";

-- 🔎 Fazer a consulta dessa tabela
select *
from padaria_produto;

/*--------------------------------------------------------------------*/

-- Atividade Encontro 14
-- Pensando em um negócio de uma padaria, quais são os comandos para:
-- 1. Mostrar Produtos com preço acima de R$5,00
select nome, preco 
from padaria_produto
where preco > 5.00;

-- 2. Mostrar Produtos com nome contendo “Bolo”
select nome 
from padaria_produto
where nome = "Bolo";

-- 3. Mostrar Produtos com estoque abaixo de 20 unidades
select nome, qtde_estoque
from padaria_produto
where qtde_estoque < 20;

-- 4. Mostrar Produtos entre R$3,00 e R$10,00
select * from padaria_produto;
select nome, preco
from padaria_produto
where preco >= 3.00 and preco <= 10.00;

-- 5. Mostrar Produtos que começam com "Pão"
select nome 
from padaria_produto
where nome = "Pão%";

-- 6. Mostrar Produtos com nome "Croissant" e estoque maior que 30
select nome, qtde_estoque
from padaria_produto
where nome = "Croissant" and qtde_estoque > 30;

/*--------------------------------------------------------------------*/

-- Enunciado da Prática — Padaria
-- Pensando em um negócio de padaria, quais são os comandos para:
-- Mostrar Nome dos produtos em MAIÚSCULAS
select upper(nome) as Produto
from padaria_produto;

-- Mostrar Nome dos produtos em minúsculas
select lower(nome) as Produto
from padaria_produto;

-- Mostrar Quantidade de letras no nome do produto
select length(nome)
from padaria_produto;

-- Mostrar as Três primeiras letras do nome do produto
select substring(nome, 1, 3)
from padaria_produto;

-- Mostrar Preço arredondado para o inteiro mais próximo
select nome, round(preco, 1) as Preco
from padaria_produto;

-- Exibir data atual junto com os produtos
select now() as DataHoraAtual, nome
from padaria_produto;

/*--------------------------------------------------------------------*/

-- Exercicios
-- Pensando em um negócio de uma padaria, quais são os comandos para:
-- Exibir o nome dos produtos e o nome do fornecedor de cada um
select padaria_produto.nome, padaria_fornecedor.nome
from padaria_produto inner join padaria_fornecedor using(id_fornecedor)
where padaria_produto.id_fornecedor = padaria_fornecedor.id_fornecedor;

-- Listar os produtos vendidos com suas quantidades e data da venda
select nome, quantidade, data_venda
from padaria_produto inner join padaria_vendas using(id_produto)
where padaria_produto.id_produto = padaria_vendas.id_produto;

-- Ver o nome do produto, valor total da venda e nome do fornecedor
select padaria_produto.nome, total_venda, padaria_produto.nome
from padaria_produto inner join padaria_vendas using(id_produto)
inner join padaria_fornecedor using(id_fornecedor);

-- Exibir produtos com estoque abaixo de 30 unidades e seus fornecedores
select padaria_produto.nome, padaria_fornecedor.nome
from padaria_produto inner join padaria_fornecedor using(id_fornecedor)
where qtde_estoque < 30;

/*--------------------------------------------------------------------*/

create table padaria_categoria(
	id_cat int auto_increment primary key not null,
    valonmin decimal(8,2) not null,
    valormax decimal(8,2) not null,
    classificacao varchar(15)
);
desc padaria_produto;

insert into padaria_categoria(valormin, valormax, classificacao)
	values(0.00, 20.00, "Barato"),
		  (20.00, 40.00, "Intermediario"),
          (40.00, 100.00, "Caro");
select * from padaria_categoria;

alter table  padaria_produto
add column id_cat int;

/* produto de id 3 é o unico intermediario */
update padaria_produto
set id_cat = 1
where id_produto = 3;

/* produto de id 11 é o unico caro */
update padaria_produto
set id_cat = 3
where id_produto = 11;
/* os produtos restantes sao todos classificados como barato */

-- Produtos e Faixas de Preço
-- Classificar os produtos em categorias de preço: Barato, Intermediário e Caro
-- Com base no preço de cada item.
select nome, classificacao
from padaria_produto inner join padaria_categoria using(id_cat)
where preco between 0 and 20; 

select nome, classificacao
from padaria_produto inner join padaria_categoria using(id_cat)
where preco between 20 and 40;

select nome, classificacao
from padaria_produto inner join padaria_categoria using(id_cat)
where preco between 40 and 100;

/*--------------------------------------------------------------------*/

-- joins nao identicas e externas
-- Listar todos os produtos disponíveis, mostrando quantas vezes cada 
-- um foi vendido — mesmo que nunca tenha sido vendido.
select count(id_venda) as Total, nome 
from padaria_produto
	left join padaria_vendas
	on padaria_produto.id_produto = padaria_vendas.id_produto
	group by nome;

-- Classificar os produtos em categorias de preço: barato,
-- intermediário e caro com base no preço de cada item.
select nome, classificacao
from padaria_categoria
	inner join padaria_produto
    on preco between valormin and valormax;
    
   