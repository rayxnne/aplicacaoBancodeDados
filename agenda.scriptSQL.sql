/* AGENDA */
-- 1. crie as três tabelas
create table agenda_tipoevento (
    id_tipo int auto_increment primary key,
    descricao varchar(50) not null
);

create table agenda_contato (
    id_contato int auto_increment primary key,
    nome varchar(100) not null,
    telefone varchar(20),
    email varchar(100)
);

create table agenda_endereco (
    id_endereco int auto_increment primary key,
    logradouro varchar(100),
    numero VARCHAR(10),
    cidade VARCHAR(50),
    estado CHAR(2),
    id_contato INT,
    FOREIGN KEY (id_contato) REFERENCES agenda_contato(id_contato) ON DELETE CASCADE
);

create table agenda_evento (
    id_evento int auto_increment primary key,
    titulo varchar(100) not null,
    data_evento datetime not null,
    id_endereco int,
    id_tipo int,
    FOREIGN KEY (id_tipo) REFERENCES agenda_tipoevento(id_tipo),
    FOREIGN KEY (id_endereco) REFERENCES agenda_endereco(id_endereco)
    );

-- 2. insire pelo menos 2 registros em cada uma
insert into agenda_tipoevento(descricao) 
	values('Reunião de Trabalho'), 
		  ('Consulta Médica'), 
		  ('Lazer/Social'), 
		  ('Acadêmico'), 
		  ('Manutenção');

insert into agenda_contato(nome, telefone, email) 
	values('Dra. Helena Souza', '(11) 91234-5678', 'helena.med@exemplo.com'),
		  ('Carlos Silva (TI)', '(21) 98888-7777', 'carlos.ti@empresa.com'),
		  ('Academia FitBody', '(31) 3333-4444', 'recepcao@fitbody.com'),
		  ('Mariana Oliveira', '(19) 97766-5544', 'mari.oli@pessoal.com'),
		  ('Oficina do João', '(11) 5544-3322', 'joao.mecanico@email.com');

insert into agenda_endereco(logradouro, numero, cidade, estado, id_contato) 
	VALUES('Av. Brigadeiro Faria Lima', '2000', 'São Paulo', 'SP', 2), 
		  ('Rua das Camélias', '450', 'Campinas', 'SP', 1),           
		  ('Rua Mariz e Barros', '12', 'Rio de Janeiro', 'RJ', 4),    
		  ('Av. do Contorno', '8000', 'Belo Horizonte', 'MG', 3),    
		  ('Rua Santa Ifigênia', '150', 'São Paulo', 'SP', 5);        

insert into agenda_evento(titulo, data_evento, id_endereco, id_tipo) 
	VALUES('Reunião Trimestral de Resultados', '2026-05-10 14:00:00', 1, 1),
		  ('Check-up Geral', '2026-04-12 09:30:00', 2, 2),
		  ('Almoço com Mariana', '2026-05-15 12:30:00', 3, 3),
		  ('Treinamento de Redes', '2026-04-10 19:00:00', 4, 4),
		  ('Troca de Óleo do Carro', '2026-05-22 08:00:00', 5, 5);

-- 3. consulte os dados usando o SELECT
select * from agenda_tipoevento;
select * from agenda_contato;
select * from agenda_endereco;
select * from agenda_evento;

-- 4. crie um select selecionando somente a coluna nome
select titulo 
from agenda_evento;

-- 5. crie uma consulta usando o where nome = 'Mariana Oliveira'
select titulo, data_evento, nome
from agenda_evento, agenda_endereco, agenda_contato
where agenda_evento.id_endereco = agenda_endereco.id_endereco
	  AND agenda_endereco.id_contato = agenda_contato.id_contato
	  AND agenda_contato.nome = 'Mariana Oliveira';