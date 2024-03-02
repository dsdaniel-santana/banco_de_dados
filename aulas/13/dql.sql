USE localidades;

# 1
-- FAÇA UMA JUNÇÃO DA TABELA CIDADE E ESTADO, MOSTRANDO:
-- NOME DA CIDADE, SIGLA DO ESTADO
SELECT cidade.nome as Cidade, estado.sigla as UF
FROM cidade
INNER JOIN estado ON cidade.estado_id = estado.id;

# 2 
-- FAÇA UMA JUNÇÃO DA TABELA CIDADE E ESTADO, MOSTRANDO:
-- NOME DA CIDADE, SIGLA DO ESTADO. TODAS AS CIDADES INDEPENDENTE DE TEREM ESTADO
SELECT cidade.nome as Cidade, estado.sigla as UF
FROM  cidade 
LEFT JOIN estado ON cidade.estado_id = estado.id;

# 3
-- FAÇA UMA JUNÇÃO DA TABELA CIDADE E ESTADO, MOSTRANDO:
-- NOME DA CIDADE, SIGLA DO ESTADO. MOSTRE TODOS OS ESTADOS, INDEPENDENTE DE TEREM CIDADES
 SELECT cidade.nome, estado.sigla
 FROM cidade
 RIGHT JOIN estado ON cidade.estado_id = estado.id;
 
 
# 4
-- FAÇA UMA JUNÇÃO DA TABELA CIDADE, ESTADO E PREFEITO:
-- CIDADE.NOME, ESTADO.SIGLA/UF, PREFEITO.NOME, PREFEITO.DATAPOSSE
-- PARA TODAS AS CIDADES QUE TEM PREFEITO

SELECT cidade.nome as Cidade, estado.sigla as UF, prefeito.nome as Prefeito, prefeito.DataPosse
FROM cidade
LEFT JOIN estado ON cidade.estado_id = estado.id
RIGHT JOIN prefeito ON cidade.prefeito_id = prefeito.id;

INSERT INTO estado (Nome, Sigla) VALUES
('Curittiba', 'PR');

INSERT INTO CIDADE(NOME,  PREFEITO_ID) VALUES
('Sydney', 1);



SELECT * FROM cidade;