-- -------
-- DDL - Criação de Banco de Dados
-- -------

CREATE SCHEMA IF NOT EXISTS gestaoacademica;
USE gestaoacademica;

-- -------
-- DDL - Criação de Tabelas
-- -------

CREATE TABLE IF NOT EXISTS gestaoacademica.aluno(
	Matricula INT AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Cpf VARCHAR(11) NOT NULL UNIQUE,
   PRIMARY KEY (Matricula) 
);

CREATE TABLE IF NOT EXISTS gestaoacademica.curso(
	Id INT AUTO_INCREMENT,
    Nome VARCHAR(50) NULL DEFAULT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS gestaoacademica.disciplina(
	Id  INT AUTO_INCREMENT,
    Nome VARCHAR(50) NULL DEFAULT NULL,
    Horas INT NOT NULL DEFAULT 0,
    PRIMARY KEY (Id)    
);

CREATE TABLE IF NOT EXISTS gestaoacademica.professor (
	ID INT AUTO_INCREMENT,
    Nome VARCHAR(100) NULL DEFAULT NULL,    
    Especialiacao VARCHAR(50) NULL DEFAULT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS gestaoacademica.matricula(
	Aluno_ID INT,
    Curso_ID INT,
    Data_Matricula DATE,
    PRIMARY KEY (ALUNO_Id, CURSO_Id),
    FOREIGN KEY (Aluno_Id) REFERENCES Aluno(Matricula),
    FOREIGN KEY (Curso_Id) REFERENCES Curso(Id)
);

CREATE TABLE IF NOT EXISTS gestaoacademica.disciplinas_cursos(
	Disciplina_ID INT, 
    Curso_ID INT,
    PRIMARY KEY (Disciplina_ID, Curso_ID),
    FOREIGN KEY (Disciplina_ID) REFERENCES Disciplina(Id),
    FOREIGN KEY (Curso_ID) REFERENCES Curso(Id)
);

CREATE TABLE IF NOT EXISTS gestaoacademica.professores_disciplinas(
	Professor_ID INT,
    Disciplina_ID INT,
    PRIMARY KEY(Professor_ID, Disciplina_ID),
    FOREIGN KEY(Professor_id) REFERENCES Professor(Id),
    FOREIGN KEY (Disciplina_Id) REFERENCES Disciplina(Id)
);


-- -------
-- DML - Inserção de Dados nas Tabelas (Insert, update, delete)
-- -------

INSERT INTO Aluno (Nome, Cpf) VALUES 
	('Chaves do 8', '12345678901'),
    ('Chiquinha', '23456789012'),
    ('Buxa do 71', '34567890123'),
    ('Kiko', '456789012345');

INSERT INTO Curso (Nome) VALUES
	('Ciência Da Computação'),
    ('Engenharia Civil'),
    ('Administação'),
    ('Medicina'),
    ('Arquitetura');
    
INSERT INTO Matricula(Aluno_ID, Curso_id, Data_Matricula) VALUES
	(1, 2, '2024-02-01'),
    (1, 5, '2024-02-02'),
    (2, 2, '2024-01-02'),
    (3, 2, '2024-01-15'),
    (3, 5, '2024-01-29');


INSERT INTO Professor (Nome, Especialiacao) VALUES
	('Huginho', 'Tecnologia'),
    ('Zezinho', 'Idiomas'),
    ('Luizinho', 'Cálculo'),
    ('Tico', 'Tecnologia'),
    ('Teco', 'Idiomas');
    
INSERT INTO Disciplina (Nome, Horas) VALUES
	('Matemática "Avançada" II', 40),
    ('Inglês Técnico', 50),
    ('Linguagem de Programação', 45);
    
INSERT INTO Professores_Disciplinas (Professor_ID, Disciplina_ID) VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2);
    
INSERT INTO Disciplinas_Cursos(Disciplina_ID, Curso_ID) VALUES
	(1, 1),
    (2, 2),
    (3, 3);
    
    




