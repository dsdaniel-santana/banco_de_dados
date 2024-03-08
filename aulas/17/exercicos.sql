# Consultas sem JOINS
-- Consulte todos os clientes de São Paulo (SP)
SELECT * 
FROM cliente
WHERE estadoCliente = 'SP'; 

-- Selecionar hospedagens com mais de 3 pessoas e desconto igual a 0

SELECT *
FROM hospedagem
WHERE hospedagem.qtdPessoas > 3 AND hospedagem.desconto =0;

-- Selecionar telefones de clientes com ID 1 ou 2, limitando a 2 resultados

SELECT *
FROM telefone
WHERE codCLiente IN (1,2)
LIMIT 2;

-- Selecionar chalés com capacidades entre 4 e 6, ordenaos por valor em alta estação
SELECT *
FROM chale
WHERE capacidade BETWEEN 4 AND 6
ORDER BY valoraltaestacao DESC;


-- Selecione todos os itens que contenham "de" na descrição, pulando os 2 primeiros resultados
SELECT * 
FROM ITEM
WHERE descricaoItem LIKE '%de%'
LIMIT 10
OFFSET 2 ;

# Consultas com JOINS
-- Selecioar detalhes da hospedagem, incluindo informações do cliente

SELECT hospedagem.*, cliente.nomeCliente
FROM hospedagem
JOIN cliente ON cliente.codCLiente = hospedagem.codCliente;


-- codHospedagem,codChale,codCliente,dataInicio,dataFim,qtdPessoas,desconto,valorFinal


-- Selecionar chalés com os itens associados


SELECT  *
FROM CHALE_ITEM
LEFT JOIN chale ON chale.codchale = chale_item.codchale
LEFT JOIN ITEM ON item.nomeItem = chale_item.nomeItem;  


-- Selecionar serviços utilizados em uma hospedagem


SELECT * FROM hospedagem_servico
JOIN servico ON servico.codServico = hospedagem_servico.codServico 
WHERE hospedagem_servico.codHospedagem = 2;

-- Consultar os clientes com seus telefones
SELECT * FROM cliente;


SELECT * FROM cliente
LEFT JOIN telefone on cliente.codCliente= telefone.codCliente;

-- Selecionar chalés ocupados em uma data específica
SELECT * FROM chale;
-- (codChale)
SELECT * FROM hospedagem;
-- (codChale,dataFim)

SELECT * FROM hospedagem
JOIN chale ON chale.codChale = hospedagem.codChale
WHERE '2024-03-07' BETWEEN hospedagem.dataInicio AND hospedagem.dataFim;
