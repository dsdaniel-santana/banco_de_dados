# Contexto Inicial: Sistema de Gestão Acadêmica em uma Instituição de Ensino

## Parte 1 - Modelo Conceitual

Em uma instituição de ensino inovadora, é essencial desenvolver um Sistema de Gestão Acadêmica para facilitar a administração eficiente de cursos, alunos, professores, disciplinas e matrículas. Este sistema visa proporcionar uma experiência mais fluida para todos os envolvidos no processo educacional.

Neste contexto, a instituição oferece diversos cursos, cada um composto por disciplinas ministradas por professores especializados. Os alunos têm a opção de se matricular em diferentes cursos, e cada curso pode conter um número variável de alunos. Além disso, um professor pode lecionar várias disciplinas, e uma disciplina pode ser ministrada por diferentes professores ao longo do tempo.

Exercício:

Com base no contexto apresentado, identifique as entidades e seus relacionamentos. Em seguida, elabore um modelo conceitual que represente as relações entre essas entidades.

Entidades:
(listar aqui)
<!-- CURSO -->
<!-- ALUNO -->
<!-- PROFESSORE -->
<!-- DISCIPLINA -->
<!-- MATRICULA -->

Relacionamentos
- Um ALUNO se matricula em um ou mais CURSO.
- Um CURSO pode conter vários ALUNOS.
- UM CURSO é composto por várias DISCIPLINAS.
- UMA DISCIPLINA pode pertencer a diferentes CURSOS.
- Um PROFESSOR leciona uma ou mais DISCIPLINAS.
- Uma DISCIPLINA pode ser lecionada por um ou mais PROFESSORES.
- Um ALUNO realiza uma ou mais MATRÍCULAS.
- Uma MATRÍCULA está associada a um ALUNO e um CURSO

<!-- CURSO: pode ter N disciplinas, pode ter N professores, pode ter N alunos -->
<!-- ALUNO: pode estudar N cursos, pode estudar N disciplinas -->
<!-- PROFESSOR:  lecionar N disciplinas em N Cursos -->
<!-- DISCIPLINA:  podem fazer parte de N cursos, pode ter N professores e N alunos -->
<!-- MATRICULA: pode ter N alunos, N Cursos-->

(listar aqui)

Agora, com base nessas entidades e relacionamentos, desenvolva um modelo conceitual no DrawIO representando visualmente a estrutura e as interações entre esses elementos.

## Parte 2 - Modelo Lógico

A transição do modelo conceitual para o modelo lógico envolve a representação mais específica das entidades, atributos, relacionamentos e chaves no contexto de um Sistema de Gestão Acadêmica.

Tabelas:
(listar)
-Curso: ID(PK), Nome
-Aluno: ID(PK), Nome
-Professor: ID(PK), Nome 
-Disciplina: ID(PK,), Nome, ID_CURSO(FK)
-Disciplina_Professor: ID_PROFESSOR(FK), ID_DISCIPLINA(FK)
-Matrícula ID_ALUNO, ID_CURSO(FK)

Disciplina Professor

Chaves Primárias e Estrangeiras:
(listar)

Agora, com base nessas entidades e relacionamentos, desenvolva um modelo lógico no DrawIO representando visualmente a estrutura completas e as interações entre esses elementos, com seus campos chave refletindo essas interações e seus atributos definidos.


## Parte 3 - SQL

(Reservado para a Aula 06 - Introdução a SQL)