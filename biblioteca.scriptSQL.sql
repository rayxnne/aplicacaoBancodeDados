-- tabelas biblioteca
create table biblioteca_autor(
	id_autor bigint primary key,
    nome_autor varchar(150),
	nacionalidade varchar(100)
);
desc biblioteca_autor;

create table biblioteca_categoria(
	id_categoria bigint primary key,
	nome_categoria varchar(100)
);
desc biblioteca_categoria;

create table biblioteca_editora(
	id_editora bigint primary key,
	nome_editora varchar(150),
	contato varchar(50)
);
desc biblioteca_editora;

create table biblioteca_emprestimo(
	id_emprestimo bigint primary key,
	data_saida timestamp,
	data_prevista_devolucao date,
	data_devolucao_real timestamp,
	id_usuario bigint,
	id_exemplar bigint,
    foreign key(id_usuario) references biblioteca_usuario(id_usuario),
    foreign key(id_exemplar) references biblioteca_exemplar(id_exemplar)
);
desc biblioteca_emprestimo;

create table biblioteca_livro(
	id_livro bigint primary key,
	titulo varchar(255),
	isbn varchar(13),
	ano_publicacao int,
    id_categoria bigint,
	id_editora bigint,
	foreign key(id_categoria) references biblioteca_categoria(id_categoria),
	foreign key(id_editora) references biblioteca_editora(id_editora)
);
desc biblioteca_livro;

create table biblioteca_livro_autor(
	id_autor bigint,
	id_livro bigint,
	foreign key(id_autor) references biblioteca_autor(id_autor),
	foreign key(id_livro) references biblioteca_livro(id_livro)
);
desc biblioteca_livro_autor;

create table biblioteca_multa(
	id_multa bigint primary key,
	valor decimal(10,2),
	pago tinyint(1),
    id_emprestimo bigint,
	foreign key(id_emprestimo) references biblioteca_emprestimo(id_emprestimo)
);
desc biblioteca_multa;

create table biblioteca_exemplar(
	id_exemplar bigint primary key,
	status varchar(20),
	id_livro bigint,
    foreign key(id_livro) references biblioteca_livro(id_livro)
);
desc biblioteca_exemplar;

create table biblioteca_usuario(
	id_usuario bigint primary key,
	nome_usuario varchar(150),
	email varchar(100),
	data_cadastro date
);
desc biblioteca_usuario;


insert into biblioteca_categoria(id_categoria, nome_categoria)
	values(1, "Ficcção Científica"),
		  (2, "Romance"),
          (3, "História"),
          (4, "Biografia"),
          (5, "Tecnologia"),
          (6, "Suspense"),
          (7, "Autoajuda"),
          (8, "Clássicos"),
          (9, "Poesia"),
          (10, "Infantil");
select * from biblioteca_categoria;

update biblioteca_categoria
set nome_categoria = "Ficção Científica"
where id_categoria = 1;