/* ESCOLA */
CREATE TABLE escola_aluno(
	id_aluno int auto_increment primary key,
    aluno_nome varchar(50) not null,
    aluno_sobrenome varchar(50) not null,
    aluno_curso varchar(100)
);
desc escola_aluno;

CREATE TABLE escola_professor(
	id_professor int auto_increment primary key,
    nome_professor varchar(100) not null,
    professor_curso varchar(100) not null
);
desc escola_professor;

CREATE TABLE escola_comentario(
	id_comentario int auto_increment primary key,
    id_aluno int not null,
    id_professor int not null,
    comentario text not null,
    nota_professor decimal(3,1),
    foreign key(id_aluno) references escola_aluno(id_aluno),
    foreign key(id_professor) references escola_professor(id_professor)
);
desc escola_comentario;

insert into escola_aluno(aluno_nome, aluno_sobrenome, aluno_curso)
		values('Lucas', 'Silva', 'Desenvolvimento Full Stack'),
			  ('Ana', 'Oliveira', 'Desenvolvimento Full Stack'),
			  ('Mateus', 'Santos', 'Desenvolvimento Full Stack'),
			  ('Beatriz', 'Costa', 'Desenvolvimento Full Stack'),
			  ('Guilherme', 'Almeida', 'Desenvolvimento Full Stack'),
			  ('Mariana', 'Pereira', 'Desenvolvimento Full Stack'),
			  ('Enzo', 'Ribeiro', 'Desenvolvimento Full Stack'),
			  ('Julia', 'Carvalho', 'Desenvolvimento Full Stack'),
              ('Rafael', 'Mendes', 'Engenharia de Dados'),
			  ('Larissa', 'Freitas', 'Engenharia de Dados'),
			  ('Gustavo', 'Souza', 'Engenharia de Dados'),
			  ('Camila', 'Barbosa', 'Engenharia de Dados'),
			  ('Felipe', 'Martins', 'Engenharia de Dados'),
			  ('Isabela', 'Rocha', 'Engenharia de Dados'),
			  ('Thiago', 'Gomes', 'Engenharia de Dados'),
			  ('Bruna', 'Lima', 'Engenharia de Dados'),
              ('Leonardo', 'Nascimento', 'Análise e Ciência de Dados'),
			  ('Leticia', 'Fernandes', 'Análise e Ciência de Dados'),
			  ('Vinicius', 'Araujo', 'Análise e Ciência de Dados'),
			  ('Sophia', 'Cardoso', 'Análise e Ciência de Dados'),
			  ('Gabriel', 'Melo', 'Análise e Ciência de Dados'),
			  ('Manuela', 'Teixeira', 'Análise e Ciência de Dados'),
			  ('Arthur', 'Castro', 'Análise e Ciência de Dados'),
			  ('Valentina', 'Cavalcanti', 'Análise e Ciência de Dados'),
              ('Daniel', 'Azevedo', 'Defesa Cibernética'),
			  ('Heloisa', 'Moraes', 'Defesa Cibernética'),
			  ('Caio', 'Vieira', 'Defesa Cibernética'),
			  ('Lorena', 'Moreira', 'Defesa Cibernética'),
			  ('Nicolas', 'Guimarães', 'Defesa Cibernética'),
			  ('Alice', 'Borges', 'Defesa Cibernética'),
			  ('Samuel', 'Marques', 'Defesa Cibernética'),
			  ('Cecilia', 'Pinto', 'Defesa Cibernética'),
              ('Igor', 'Monteiro', 'Segurança de Redes e Sistemas'),
			  ('Vitoria', 'Duarte', 'Segurança de Redes e Sistemas'),
			  ('Murilo', 'Caldeira', 'Segurança de Redes e Sistemas'),
			  ('Giovanna', 'Aragão', 'Segurança de Redes e Sistemas'),
			  ('Hugo', 'Viana', 'Segurança de Redes e Sistemas'),
			  ('Yasmin', 'Farias', 'Segurança de Redes e Sistemas'),
			  ('Otavio', 'Batista', 'Segurança de Redes e Sistemas'),
			  ('Lara', 'Assis', 'Segurança de Redes e Sistemas');
select * from escola_aluno;

insert into escola_professor(nome_professor, professor_curso)
	values('Dr. Ricardo Montes', 'Engenharia de Dados'),
		  ('Profa. Letícia Schimidt', 'Defesa Cibernética'),
		  ('Mestre André Villanova', 'Desenvolvimento Full Stack'),
		  ('Dr. Carlos Mesquita', 'Análise e Ciência de Dados'),
		  ('Profa. Adriana Fontes', 'Segurança de Redes e Sistemas');
select * from escola_professor;

insert into escola_comentario(id_aluno, id_professor, comentario, nota_professor)
	values(1, 1, 'Aula fantástica sobre modelagem dimensional. Muito claro.', 10.0),
		  (2, 1, 'O conteúdo de Spark é denso, mas o professor explica bem.', 8.5),
		  (3, 1, 'Poderia disponibilizar os scripts SQL após a aula.', 7.0),
		  (4, 1, 'Domínio total do assunto. Referência na área!', 10.0),
		  (5, 1, 'A parte de NoSQL foi um pouco corrida para o meu gosto.', 6.5),
		  (6, 1, 'Excelente material de apoio e bibliografia sugerida.', 9.0),
		  (7, 1, 'O professor é muito atencioso com as dúvidas no chat.', 9.5),
		  (8, 1, 'Gostaria de mais estudos de caso reais de grandes empresas.', 8.0),
		  (9, 2, 'Incrível a demonstração de engenharia social. Assustador e útil!', 10.0),
		  (10, 2, 'Melhor disciplina do curso até agora. Didática impecável.', 10.0),
		  (11, 2, 'As máquinas virtuais do lab apresentaram alguns erros.', 7.5),
		  (12, 2, 'A professora incentiva muito a ética profissional na área.', 9.5),
		  (13, 2, 'Conteúdo de criptografia muito bem detalhado.', 9.0),
		  (14, 2, 'Senti falta de mais tempo para o exercício final de Pentest.', 8.0),
		  (15, 2, 'Explicou o protocolo SSL de uma forma que eu finalmente entendi.', 9.0),
		  (16, 2, 'Aulas dinâmicas e que prendem a atenção do início ao fim.', 10.0),
		  (17, 3, 'O passo a passo da API em Node.js foi excelente.', 9.5),
		  (18, 3, 'Gosto muito de como ele aborda as boas práticas de Clean Code.', 10.0),
		  (19, 3, 'O ritmo é muito acelerado para quem é iniciante total.', 6.0),
		  (20, 3, 'Professor muito engajado e apaixonado pelo que faz.', 9.0),
		  (21, 3, 'As correções dos desafios são bem detalhadas e ajudam muito.', 9.5),
		  (22, 3, 'Poderia focar um pouco mais em CSS avançado.', 7.5),
		  (23, 3, 'Consegui meu primeiro estágio graças às dicas de portfólio dele!', 10.0),
		  (24, 3, 'Excelente abordagem sobre Git e trabalho em equipe.', 9.0),
		  (25, 4, 'A base teórica de estatística é muito sólida. Recomendo.', 9.0),
		  (26, 4, 'O professor foca muito na matemática e esquece um pouco o código.', 7.0),
		  (27, 4, 'Aprendi a visualizar dados de forma profissional com o curso.', 9.5),
		  (28, 4, 'Os Jupyter Notebooks disponibilizados são perfeitos.', 10.0),
		  (29, 4, 'A correção da prova foi um pouco rigorosa demais.', 8.0),
		  (30, 4, 'Explica regressão linear de um jeito muito intuitivo.', 9.0),
		  (31, 4, 'Professor sempre traz artigos científicos atuais para debate.', 9.5),
		  (32, 4, 'Faltou um pouco mais de foco em limpeza de dados (Wrangling).', 7.5),
		  (33, 5, 'A aula sobre Wireshark foi a mais prática do semestre.', 10.0),
		  (34, 5, 'Excelente professora, demonstra muita experiência de mercado.', 9.5),
		  (35, 5, 'A prova prática foi bem difícil, mas condiz com a matéria.', 8.5),
		  (36, 5, 'Gostaria de mais aulas sobre segurança em nuvem (Cloud).', 7.0),
		  (37, 5, 'Didática clara e objetiva. Sem enrolação.', 9.0),
		  (38, 5, 'Sempre responde os e-mails com rapidez e clareza.', 10.0),
		  (39, 5, 'O conteúdo sobre firewalls foi muito bem estruturado.', 9.0),
		  (40, 5, 'As aulas gravadas ajudam muito na revisão do conteúdo.', 9.5);
select * from escola_comentario;

-- exercicios 2 02-04
-- 1. Listar todos os alunos e seus cursos
select aluno_nome, aluno_sobrenome, aluno_curso
from escola_aluno
order by aluno_nome;

-- 2. Lista todos os professores e cursos que lecionam
select nome_professor, professor_curso
from escola_professor
order by nome_professor;

-- 3. Listar comentários e notas dos alunos com nome do professor
select comentario, nome_professor, nota_professor
from escola_comentario, escola_professor
where escola_comentario.id_professor = escola_professor.id_professor
order by nome_professor;

-- 4. Listar comentários com nota abaixo de 7.0
select id_comentario, comentario
from escola_comentario
where nota_professor < 7;

-- 5. Listar comentários com nota acima de 6.0
select id_comentario, comentario
from escola_comentario
where nota_professor > 7;

/*--------------------------------------------------------------------*/

-- ATIVIDADE - ESCOLA
-- 1. adicione o campo 'ATIVO' para sinalizar o status do aluno;
alter table escola_aluno
add column aluno_status boolean;

-- 2. adicione o campo 'DATA DE NASCIMENTO'
alter table escola_aluno
add column aluno_datanasc date;

-- 3. adicione o campo de 'EMAIL'
alter table escola_aluno
add column aluno_email varchar(50);



