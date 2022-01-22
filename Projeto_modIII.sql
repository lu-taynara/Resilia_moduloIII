-- Database: Resilia_Modulo_III

-- DROP DATABASE IF EXISTS "Resilia_Modulo_III";

CREATE DATABASE "Resilia_Modulo_III"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
--	CRIANDO AS TABELAS
CREATE TABLE Aluno (
	id_aluno SERIAL NOT NULL,
	nome VARCHAR(50) NULL,
	genero VARCHAR(50) NULL,
	dt_nacto DATE NULL,
	email VARCHAR(50) NULL,
	cpf VARCHAR(50) NULL,
    PRIMARY KEY (id_aluno)
);	

CREATE TABLE Curso (
	id_curso SERIAL NOT NULL,
	nome VARCHAR(50) NULL,
	duracao VARCHAR(50) NULL,
	valor FLOAT8 NULL,
    PRIMARY KEY (id_curso)
);

CREATE TABLE Facilitador (
	id_facili SERIAL NOT NULL,
	nome VARCHAR(50) NULL,
    PRIMARY KEY (id_facili)
);

CREATE TABLE Turma(
	id_turma SERIAL NOT NULL,
	id_curso INT NOT NULL,
	id_facili INT NOT NULL,
    nome VARCHAR(50) NULL,
    qnt_aluno INT NOT NULL,
 	horario VARCHAR(50) NULL,
	PRIMARY KEY (id_turma),
    CONSTRAINT Fk_Turma_id_curso FOREIGN KEY (id_curso) REFERENCES Curso (id_curso),
	CONSTRAINT Fk_Turma_id_modulo FOREIGN KEY (id_facili) REFERENCES Facilitador (id_facili)
);

CREATE TABLE Modulo (
	id_modulo SERIAL NOT NULL,
	materia VARCHAR(50) NULL,
    PRIMARY KEY (id_modulo)
);

CREATE TABLE Matricula (
	id_matricula SERIAL NOT NULL,
	id_aluno INT NOT NULL,
	id_turma INT NOT NULL,
	id_curso INT NOT NULL,
	dt_matricula DATE,
    PRIMARY KEY (id_matricula),
	CONSTRAINT Fk_Matricula_id_aluno FOREIGN KEY (id_aluno) REFERENCES Aluno (id_aluno),
	CONSTRAINT Fk_Matricula_id_turma FOREIGN KEY (id_turma) REFERENCES Turma (id_turma),
	CONSTRAINT Fk_Matricula_id_curso FOREIGN KEY (id_curso) REFERENCES Curso (id_curso)
);

CREATE TABLE RH (
	id_RH SERIAL NOT NULL,
	id_facili NULL,
	qnt_func INT NULL,
    PRIMARY KEY (id_RH)
);

CREATE TABLE Financeiro (
	id_financeiro SERIAL NOT NULL,
	cont_pg FLOAT8 NULL,
	cont_receber FLOAT8 NULL,
    PRIMARY KEY (id_financeiro)
);

CREATE TABLE DP (
	id_DP SERIAL NOT NULL,
	id_RH INT NOT NULL,
	id_financeiro INT NOT NULL,
    PRIMARY KEY (id_DP),
	CONSTRAINT Fk_DP_id_RH FOREIGN KEY (id_RH) REFERENCES RH (id_RH),
	CONSTRAINT Fk_DP_id_financeiro FOREIGN KEY (id_financeiro) REFERENCES Financeiro (id_financeiro)
);


--EXCLUIR UMA TABELA
DROP TABLE Aluno CASCADE

--DELETAR UMA COLUNA DA TABELA
DELETE FROM Aluno

--CONSULTAR TABELA
SELECT * FROM Curso

--ALTERAR TIPO 
ALTER TABLE Aluno ALTER COLUMN cpf TYPE VARCHAR(50);

--ADD CHAVE ESTRANGEIRA FK
ALTER TABLE Curso ADD CONSTRAINT Fk_curso_id_modulo
    FOREIGN KEY (id_modulo) REFERENCES Modulo (id_modulo) ON DELETE NO ACTION ON UPDATE NO ACTION;


--ADICIONAR CAMPO NA TABELA
ALTER TABLE Curso ADD id_modulo INT NULL


--POPULAR TABELAS - ADICIONAR DADOS
--ALUNO
INSERT INTO Aluno (nome, genero, dt_nacto, email, cpf) VALUES
	 ('Luana Taynara', 'Feminino', '04/01/1994', 'lu@xpto.com', '321654987-98'),
	 ('Graziela Queiroz', 'Feminino', '01/06/1981', 'gra@xpto.com', '456123789-01'),
	 ('Natalia Thome', 'Feminino', '05/05/1991', 'nat@xpto.com', '789456123-20'),
	 ('Jaqueline Caires', 'Feminino', '27/03/1981', 'jack@xpto.com', '258741369-78'),
	 ('Helena Maria', 'Feminino', '25/08/1978', 'helena@xpto.com', '075331758-12'),
	 ('Julia Andreia', 'Feminino', '14/08/2000', 'ju@xpto.com', '654012578-32'),
	 ('Luiza Cristina', 'Feminino', '15/07/2003', 'luiza@xpto.com', '128914668-45'),
	 ('Rafaela Binha', 'Feminino', '03/04/1999', 'rafa@xpto.com', '391170408-74'),
	 ('Matheus Felipe', 'Masculino', '18/03/1992', 'ma@xpto.com', '299866078-65'),
	 ('Anthonny Garotinho', 'Masculino', '13/09/1985', 'antho@xpto.com', '651234565-37'),
	 ('Bryan Francisco', 'Masculino', '21/11/1974', 'bryan@xpto.com', '987000548-54'),
	 ('Henrique Diego', 'Masculino', '17/12/1965', 'kiki@xpto.com', '502145896-12'),
	 ('Ryan Douglas', 'Masculino', '15/11/1991', 'rico@xpto.com', '120305478-28'),
	 ('Jurema Bernades', 'Feminino', '09/01/1997', 'jure@xpto.com', '369258147-74'),
	 ('Felipe Junior', 'Masculino', '04/02/2005', 'fefe@xpto.com', '963852741-96'),
	 ('Erick Roberto', 'Masculino', '30/05/2003', 'eric@xpto.com', '741852963-21'),
	 ('Francisco Jose', 'Masculino', '01/10/1990', 'franc@xpto.com', '123456789-78')
	
--CURSO
INSERT INTO Curso (nome, duracao, valor, id_modulo) VALUES
	('Analise de Dados', '6 meses', 15.080, 1),
	('ADS', '2 anos', 33.000, 2),
	('Front-End', '8 meses', 72.320, 2),
	('Back-End', '6 meses', 47.740, 3)
	
--DP
INSERT INTO DP (id_rh, id_financeiro) VALUES
	(1, 1)

--FACILITADOR
INSERT INTO Facilitador (nome) VALUES
	('Marisa'),
	('Thais'),
	('Julina'),
	('Mauricio')

--FINANCEIRO
INSERT INTO Financeiro (cont_pg, cont_receber) VALUES
	(850.00, 11573.00)

--MATRICULA
INSERT INTO Matricula (id_aluno, id_turma, id_curso, dt_matricula) VALUES
	(1, 1, 1, '10/01/2021'),
	(2, 2, 1, '10/01/2021'),
	(3, 3, 2, '10/01/2021'),
	(4, 1, 2, '10/01/2021'),
	(5, 2, 3, '05/06/2020'),
	(6, 3, 3, '05/06/2020'),
	(7, 1, 4, '05/06/2020'),
	(8, 2, 4, '05/06/2020'),
	(9, 3, 1, '05/06/2020'),
	(10, 1, 1, '05/06/2020'),
	(1, 2, 2, '10/01/2021'),
	(2, 3, 2, '10/01/2021'),
	(3, 4, 3, '10/01/2021'),
	(4, 2, 3, '10/01/2021'),
	(5, 3, 4, '05/06/2020'),
	(6, 4, 4, '05/06/2020'),
	(7, 2, 1, '05/06/2020'),
	(8, 1, 1, '05/06/2020'),
	(9, 3, 4, '05/06/2020'),
	(10, 1, 4, '05/06/2020'),
	(11, 1, 1, '13/08/2020'),
	(12, 2, 1, '13/08/2020'),
	(13, 3, 2, '13/08/2020'),
	(14, 1, 2, '22/01/2020'),
	(15, 2, 3, '22/01/2020'),
	(16, 3, 3, '22/01/2020'),
	(17, 1, 4, '22/01/2020')
	
--MODULO
INSERT INTO Modulo (materia) VALUES
	('Tech'),
	('Soft'),
	('Analise')

--RH
INSERT INTO RH (qnt_func) VALUES
	(241)

--TURMA
INSERT INTO Turma (id_curso, id_facili, nome, qnt_aluno, horario) VALUES
	(1, 1, 'T12', 54, '18:00'),
	(2, 1, 'T7', 45, '10:00'),
	(3, 2, 'T4', 56, '12:00'),
	(4, 4, 'T8', 40, '11:00'),
	(4, 4, 'T3', 60, '14:00'),
	(1, 1, 'T1', 38, '13:00'),
	(2, 2, 'T9', 57, '12,30'),
	(3, 3, 'T10', 50, '15:00'),
	(2, 2, 'T6', 48, '06:00'),
	(3, 3, 'T5', 39, '07:00')
	
	
	
--------------------------------------- Consultas -----------------------------------------------------------
-- Selecionar a quantidade total de estudantes cadastrados no banco:
SELECT COUNT (*) AS total_estudantes
FROM Aluno

-- Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados:
SELECT Matricula.id_matricula, Aluno.nome as nome_aluno, Curso.nome as nome_curso
FROM Matricula INNER JOIN Aluno ON Matricula.id_aluno = Aluno.id_aluno
INNER JOIN Curso ON Matricula.id_curso = Curso.id_curso
ORDER BY Aluno.nome;

-- Selecionar quais pessoas facilitadoras atuam em mais de uma turma:
SELECT Facilitador.nome, COUNT(Turma.id_facili) AS Quantidade_Turma
FROM Turma
INNER JOIN Facilitador ON Turma.id_facili = Facilitador.id_facili
GROUP BY Facilitador.nome
HAVING COUNT(Turma.id_facili) > 1

-- Exibir Aluno com data de nascimento maior que 1992:
SELECT EXTRACT('Year' FROM dt_nacto), nome
FROM Aluno
Where dt_nacto > '01/01/1992'

-- Exibir todos os cursos, duracao, valor e quantos alunos por curso:
SELECT nome, duracao, valor
FROM Curso

--Listar nome dos alunos matriculados em mais de um curso;
SELECT Aluno.nome, COUNT(Matricula.id_Aluno) AS Quantidade_Curso
FROM Matricula
INNER JOIN Aluno ON Matricula.id_Aluno = Aluno.id_aluno
GROUP BY Aluno.nome
HAVING COUNT(Matricula.id_Aluno) > 1
 
  





