/* LOCADORA */

CREATE TABLE locadora_cliente(
	id_cliente int auto_increment primary key,
    nome varchar(50) not null,
    sobrenome varchar(50) not null,
    telefone varchar(20),
    email varchar(100)
);

CREATE TABLE locadora_automovel(
	id_automovel int auto_increment primary key,
    marca varchar(50),
    modelo varchar(50),
    tipo varchar(50)
);

CREATE TABLE locadora_datalocacao(
	id_datalocacao int auto_increment primary key,
    datainiciolocacao date,
    datafimlocacao date,
    id_cliente int,
    id_automovel int,
    foreign key(id_cliente) references locadora_cliente(id_cliente),
    foreign key(id_automovel) references locadora_automovel(id_automovel)
);

INSERT INTO locadora_cliente(nome, sobrenome, telefone, email) 
	VALUES('Ricardo', 'Albuquerque', '(11) 98877-6655', 'ricardo.albu@email.com'),
		  ('Fernanda', 'Montenegro', '(21) 97766-5544', 'f.montenegro@provedor.com.br'),
	  	  ('Thiago', 'Leifert', '(11) 96655-4433', 'leifert.thiago@contato.com'),
		  ('Camila', 'Pitanga', '(71) 95544-3322', 'pitanga.c@bahia.com.br'),
		  ('Bruno', 'Gagliasso', '(21) 94433-2211', 'bruno.g@actor.com'),
		  ('Marina', 'Ruy', '(11) 93322-1100', 'marina.ruy@fashion.com'),
		  ('Rodrigo', 'Lombardi', '(11) 92211-0099', 'lombardi.r@empresa.com'),
		  ('Paolla', 'Oliveira', '(21) 91100-9988', 'paolla.oli@webmail.com'),
		  ('Lázaro', 'Ramos', '(71) 90099-8877', 'lazaro.ramos@estudio.com'),
		  ('Taís', 'Araújo', '(21) 89988-7766', 'tais.araujo@agencia.com'),
		  ('Marcos', 'Mion', '(11) 88877-6655', 'mion.marcos@tv.com'),
		  ('Sabrina', 'Sato', '(11) 87766-5544', 'sato.sabrina@japao.com.br'),
		  ('Cauã', 'Reymond', '(21) 86655-4433', 'caua.reymond@surf.com'),
		  ('Grazi', 'Massafera', '(41) 85544-3322', 'grazi.m@parana.com.br'),
		  ('Felipe', 'Neto', '(21) 84433-2211', 'felipe.neto@youtube.com'),
		  ('Whindersson', 'Nunes', '(86) 83322-1100', 'whind.nunes@piaui.com'),
		  ('Anitta', 'Larissa', '(21) 82211-0099', 'anitta.oficial@music.com'),
		  ('Yuri', 'Alberto', '(11) 81100-9988', 'yuri.alberto@corinthians.com'),
		  ('Gisele', 'Bündchen', '(51) 80099-8877', 'gisele.b@runway.com'),
		  ('Ivete', 'Sangalo', '(71) 79988-7766', 'ivete.veveta@axe.com.br');
select * from locadora_cliente;

INSERT INTO locadora_automovel(marca, modelo, tipo) 
	VALUES('Toyota', 'Corolla', 'Sedan'),
		  ('Volkswagen', 'T-Cross', 'SUV'),
		  ('Ford', 'Ranger', 'Picape'),
		  ('Hyundai', 'HB20', 'Hatch'),
		  ('Honda', 'Civic Type R', 'Esportivo'),
		  ('Jeep', 'Compass', 'SUV'),
		  ('Chevrolet', 'Onix Plus', 'Sedan'),
		  ('Fiat', 'Strada', 'Picape');
select * from locadora_automovel;

INSERT INTO locadora_datalocacao(datainiciolocacao, datafimlocacao, id_cliente, id_automovel)
	VALUES ('2025-08-05', '2025-08-10', 1, 1),
		   ('2025-08-12', '2025-08-15', 2, 3),
		   ('2025-09-01', '2025-09-07', 3, 5),
		   ('2025-09-10', '2025-09-20', 4, 8),
		   ('2025-10-05', '2025-10-12', 5, 2),
		   ('2025-10-15', '2025-10-18', 6, 4),
		   ('2025-11-02', '2025-11-05', 7, 6),
		   ('2025-11-10', '2025-11-25', 8, 7),
		   ('2025-12-01', '2025-12-15', 9, 1),
		   ('2025-12-20', '2025-12-27', 10, 3),
		   ('2025-12-22', '2026-01-02', 11, 5),
           ('2026-01-05', '2026-01-10', 12, 2),
		   ('2026-01-12', '2026-01-20', 13, 8),
		   ('2026-01-15', '2026-01-18', 14, 4),
		   ('2026-02-01', '2026-02-05', 15, 6),
		   ('2026-02-07', '2026-02-14', 16, 7),
		   ('2026-02-10', '2026-02-15', 17, 1),
		   ('2026-02-20', '2026-02-28', 18, 3),
		   ('2026-03-01', '2026-03-10', 19, 5),
		   ('2026-03-05', '2026-03-08', 20, 2),
		   ('2026-03-10', '2026-03-15', 1, 8),
		   ('2026-03-12', '2026-03-20', 2, 4),
		   ('2026-03-15', '2026-03-18', 3, 6),
		   ('2026-03-20', '2026-03-25', 4, 7),
		   ('2026-03-25', '2026-04-02', 5, 1);
select * from locadora_datalocacao;

-- exercicios 3
-- 1. Consultar todos os clientes cadastrados.
select *
from locadora_cliente;

-- 2. Consultar todos os automóveis disponíveis.
select * 
from locadora_automovel;

-- 3. Consultar informações sobre o cliente e o automóvel locado, 
-- incluindo a data de início e fim da locação, a marca e o modelo do automóvel.
select id_datalocacao, nome, sobrenome, marca, modelo, datainiciolocacao, datafimlocacao
from locadora_datalocacao, locadora_cliente, locadora_automovel
where locadora_datalocacao.id_cliente = locadora_cliente.id_cliente 
	  AND locadora_datalocacao.id_automovel = locadora_automovel.id_automovel
order by id_datalocacao;

-- 4. Consultar informações sobre os automóveis locados em uma data 
-- específica, incluindo a marca e o modelo.
select datainiciolocacao, id_automovel,  modelo, marca
from locadora_automovel
inner join locadora_datalocacao using(id_automovel)
where datainiciolocacao = "2026-03-12";

/*--------------------------------------------------------------------*/

-- Locadora de Veículos
-- Qual funcionário fechou mais locações? (TOP 3)
select count(id_funcionario) as Total, nome
from locadora_datalocacao natural join locadora_funcionario
	group by nome
    limit 3;

-- Qual categoria de carro foi mais locado?
select count(tipo) as Qtde, tipo
from locadora_automovel natural join locadora_datalocacao
	group by tipo
    limit 1;

-- Quais foram os cinco veículos mais locados?
select count(tipo) as Qtde, tipo
from locadora_automovel natural join locadora_datalocacao
	group by tipo
    limit 5;

-- Qual o faturamento total de cada veículo?
select sum(total_locacao) as Faturamento_total, modelo
from locadora_datalocacao natural join locadora_automovel
	group by modelo;

