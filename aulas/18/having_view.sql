# HAVING

-- SELECIONAR CHALES COM MÉDIA DE CAPACIDADE SUPERIOR A 3

SELECT CodChale, AVG(capacidade) AS capacidade_media
FROM chale
GROUP BY codChale
HAVING capacidade_media >3;
 
 -- Selecione os clientes com mais de uma hospedagem registrada
 
 SELECT * FROM hospedagem;
 -- (codHospedagem,codCliente)
 
SELECT codCliente, COUNT(*) AS qtd_hospedagens 
FROM  hospedagem
GROUP BY codcliente
HAVING qtd_hospedagens > 1 ;

-- Selecionar Servicos com o valor total superior a 40
SELECT hospedagem_servico.codHospedagem, SUM(servico.valorservico) AS total_valor  
FROM hospedagem_servico
JOIN servico ON hospedagem_servico.codservico = servico.codservico
GROUP BY hospedagem_servico.codHospedagem
HAVING total_valor > 40;
 
 -- CRIANDO UMA VIEW
 CREATE VIEW ViewMediaCapacidade AS
 SELECT codCHale, AVG(capacidade) AS media_capacidade
 FROM chale
 GROUP BY codCHale;
 
SELECT * FROM ViewMediaCapacidade; 

-- Crie uma view que informe os dados da hospedagem, com os dados do cliente, incluindo o telefone
SELECT * FROM hospedagem;
-- (codcliente)

CREATE VIEW ViewHospedagemDadosCLiente AS
SELECT hospedagem.*, cliente.nomecliente, telefone.telefone 
FROM hospedagem
LEFT JOIN cliente ON cliente.codcliente = hospedagem.codcliente
INNER JOIN telefone ON cliente.codcliente =  telefone.codcliente;

-- CRIANDO UMA VIEW
SELECT * FROM ViewHospedagemDadosCLiente;

-- criar um indice na coluna codCliente da tabela telefone
CREATE INDEX idx_codCLiente ON telefone(codCliente);

SELECT * FROM telefone ORDER BY codCliente DESC;

