USE gestao_academica; 
CREATE TABLE IF NOT EXISTS Matricula(
    Aluno_ID INT,
    Curso_ID INT,
    Data_Matricula DATE,
    PRIMARY KEY(Aluno_ID, Curso_ID),
    FOREIGN KEY (Aluno_ID) REFERENCES Aluno(ra),
    FOREIGN KEY (Curso_ID) REFERENCES Curso(ID)
);

CREATE TABLE if NOT EXISTS Profesor_Disciplina(
    Profesor_ID INT,
    Disciplina_ID INT,
    PRIMARY KEY(Profesor_ID, Disciplina_ID),
    FOREIGN KEY(Profesor_ID) REFERENCES Profesor(ID),
    FOREIGN KEY(Disciplina_ID) REFERENCES Disciplina(ID)
    
);

CREATE TABLE IF NOT EXISTS Disciplina_Curso(
    Disciplina_ID INT,
    Curso_ID INT,
    PRIMARY KEY(Disciplina_ID, Curso_ID),
    FOREIGN KEY(Disciplina_ID) REFERENCES Disciplina(ID),
    FOREIGN KEY(Curso_ID) REFERENCES Curso(ID)
);