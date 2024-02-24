-- DML(INSERT - UPDATE - DELETE)
USE gestaoacademica;

INSERT INTO aluno (Matricula, nome, cpf) values  
	('4', 'Godinez', '6785101112' ),
	('9', 'Chiquinha', '8739101112' );


SELECT * FROM aluno;

INSERT INTO curso values
(1, 'Ciência Da Computação'),
(2, 'Engenharia Civel'),
(3, 'Administração'),
(4, 'Medicina'), 
(5, 'Arquitetura');

SELECT * FROM curso;

INSERT INTO matricula values
    (5, 2, '2024-02-23');
    
INSERT INTO professor (id, nome) values
	(1, 'Aecio'),
    (2, 'Cristiano'),
    (3, 'Luana'),
    (4, 'Raissa'),
    (5, 'Adilson'),
    (6, 'Kaue');
    
INSERT INTO disciplina (id, nome, horas) values
	(1, 'Programador Front-End', 400),
    (2, 'Programador Back-End', 500),
    (3, 'SEO', 40),
    (4, 'UI', 40);

INSERT INTO disciplina_curso (disciplina_id, curso_id) values
	(1, 1),
    (1, 2),
    (4, 3),
    (4, 4);

