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

