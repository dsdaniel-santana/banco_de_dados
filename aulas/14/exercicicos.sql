Execute o script na raiz desse repositório chamado "gestao_academica.sql" (caso já tenha o banco, drop o schema e crie um novo com base nesse script).

Crie um novo script e cole nele os seguintes comentários:

-- Selecionar todos os alunos
SELECT aluno.nome AS Nome_Aluno
FROM aluno;

-- Selecionar apenas os nomes e CPFs dos alunos
SELECT aluno.nome AS Nome_Aluno, aluno.cpf AS 'Nº CPF'
FROM aluno
INNER JOIN matricula ON aluno.matricula = matricula.aluno_id;


-- Selecionar alunos matriculados após uma data específica
SELECT aluno.nome AS Nome_Aluno, aluno.cpf AS 'NºCPF'
FROM aluno
INNER JOIN matricula ON aluno.matricula = matricula.aluno_id
WHERE matricula.datamatricula = '2024-02-01';


-- Contar quantas disciplinas existem com carga horária maior que X
SELECT nome, horas
FROM disciplina
WHERE horas >50;



-- Contar quantas matrículas existem para cada curso

SELECT COUNT(*)from disciplinas_cursos;

-- Contar quantas disciplinas cada professor leciona


-- Combinar nome do aluno e data da matrícula

-- Combinar nome do curso e nome do aluno
SELECT nome AS Nome_Aluno, Curso_ID
FROM aluno, curso
INNER JOIN matricula ON matricula.aluno_ID = aluno.matricula
;



-- não deu tempo de colocar o segundo inner



-- Contar quantos alunos se matricularam em cada curso


-- Resolva as consultas que conseguir. Para as que não conseguir, adicione comentários informando suas dúvidas e até onde conseguiu evoluir seu código.

-- Envie um commit com a solução para o sue respositório e me encaminhe o link no Teams.