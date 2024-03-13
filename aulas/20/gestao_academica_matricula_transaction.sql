-- ADCIONE NA TABELA gestaoacademica.aluno a coluna matriculado
ALTER TABLE gestaoacademica.aluno
ADD COLUMN matriculado BOOL;

-- CRIE UMA TRANSACTION QUE, AO MATRICULAR UM ALUNO EM UM CURSO 
-- MUDE A COLUNA MATRICULADO PARA 'TRUE'

START TRANSACTION;
INSERT INTO gestaoacademica.matricula (aluno_ID, curso_ID, DataMatricula) VALUES (3, 3,'2024-03-12');


update ALUNO SET matriculado = TRUE WHERE Matricula = 3;
COMMIT;


