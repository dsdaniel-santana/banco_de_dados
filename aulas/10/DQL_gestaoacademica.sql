-- ------------------
-- Consultas Báscias
-- ------------------

-- Exemplo: selecionar todos os alunos

SELECT * FROM aluno;

-- SELECT
-- FROM 
-- WHERE
-- ORDER BY

SELECT nome, cpf 
FROM aluno;

SELECT *
FROM aluno
WHERE matricula >= 3;

SELECT *
FROM aluno
WHERE matricula >= 3
Order BY nome;


-- Operadores Matemáticos e Lógicos:

SELECT * FROM disciplina;

SELECT Nome, Horas
FROM disciplina
WHERE horas >=40 AND horas <=50; 

-- Aliases para Melhor Legibilidade
-- NESSE EXEMPLO ESTAMPS RENOMEANDO O NOME DAS COLUNAS
SELECT nome as nome_disciplina, horas AS carga_horaria
FROM disciplina;

-- Exiba da tabela professor, todos os professores por ordem alfabética
-- Onde o professor tenha ID maior que 2 e menor do que 6
-- Não exeibindo a especialização e mudando a coluna "Nome" para "Nome_Professor" 

SELECT id, Nome as Nome_Professor
FROM professor
Where id > 2 and id <6
Order by Nome;

-- Exemplo: Contar quantas disciplinas existem
-- FAZENDO CONTAGEM NAS TABELAS, 'AS' FOI COLOCADO UM NOME MAIS AMIGAVEL, 
-- NO 'WHERE' FOI ADCIONADO UM FILTRO,
SELECT  COUNT(*) AS Quantidade_Disciplinas
FROM disciplina
WHERE horas> 50;

-- Me informe quantas matriculas foram feitas no curso de ID 2

SELECT COUNT(*) AS Quantidade_Matriculas 
FROM matricula
WHERE Curso_ID = 2;

-- Exemplo: Selecionar professor com especialização que envolva Tecnologia
-- CONSULTANDO TEXTOS O 'LIKE' TEM UM PODER DE ESPECIFICAR '%% É O APONTAMENTO' '
SELECT *
FROM professor
WHERE Especializacao LIKE '%Tecnologia%';

-- Exercício: Selecione todos os cursos que terminem com 'medicina' ou comecem com a letra 'D'
SELECT *
FROM curso
WHERE Nome LIKE '%medicina' OR Nome LIKE 'D%';

-- Utilizando o DISTINCT para obter valores distintos
SELECT DISTINCT Especializacao FROM professor;



