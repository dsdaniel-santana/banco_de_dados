USE sistema_vendas;

################## DDL
-- 1. Crie uma tabela chamada Fornecedor para armazenar informações sobre os fornecedores do sistema.
-- id, nome, endereço, telefone, email e uma observação (text)
CREATE TABLE IF NOT EXISTS Fornecedor(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    Observacao TEXT
);

-- 2. Adicione uma coluna chamada CNPJ à tabela Fornecedor para armazenar os números de CNPJ dos fornecedores.
ALTER TABLE sistema_vendas.Fornecedor
ADD COLUMN CNPJ VARCHAR(14); 


-- 3. Adicione uma chave estrangeira à tabela Fornecedor para relacioná-la à tabela Categoria, representando a categoria do fornecedor.

ALTER TABLE sistema_vendas.Fornecedor
ADD COLUMN Fornecedor_Idc INT,
ADD FOREIGN KEY (Fornecedor_Idc) REFERENCES categoria(Id);

-- 4. Modifique o tipo da coluna Telefone na tabela Fornecedor para armazenar números de telefone com no máximo 15 caracteres.
ALTER TABLE sistema_vendas.Fornecedor
CHANGE telefone telfone VARCHAR(15);


-- 5. Remova a coluna Observacao da tabela Fornecedor, pois não é mais necessária.
ALTER TABLE sistema_vendas.Fornecedor
DROP COLUMN observacao;


-- 6. Remova a tabela Fornecedor do banco de dados, se existir.
DROP TABLE sistema_vendas.Fornecedor;


#################### DML
-- 0. Crie ao menos 5 registros para cada tabela, ignorando o gerneciamento de usuários. Um dos clientes deverá ter o seu nome

-- Inserções de exemplo para a tabela "Produto"

-- Inserções de exemplo para a tabela "categoria"
INSERT INTO categoria (Nome, Descricao, UsuarioAtualizacao) VALUES 
('Roupas', 'Categoria destinada a produtos relacionados a vestuário', 1),
('Calçados', 'Categoria destinada a produtos relacionados a calçados', 2),
('Acessórios', 'Categoria destinada a produtos relacionados a acessórios', 3),
('Óculos', 'Categoria destinada a produtos relacionados a óculos', 4),
('Mochilas', 'Categoria destinada a produtos relacionados a mochilas', 5);

INSERT INTO Cliente (Nome, Email, Telefone, UsuarioAtualizacao) VALUES
('João Silva', 'joao@example.com', '123-456-7890', 1),
('Maria Oliveira', 'maria@example.com', '987-654-3210', 2),
('Pedro Santos', 'pedro@example.com', '456-789-0123', 3),
('Ana Souza', 'ana@example.com', NULL, 4),
('Lucas Oliveira', NULL, '111-222-3333', 5);

INSERT INTO Cliente (Nome, Email, Telefone, UsuarioAtualizacao) VALUES
('Daniel San', 'danielsant@ideawebsites.com.br', '999-456-7890', 5);


INSERT INTO FormaPagamento (Nome, descricao, UsuarioAtualizacao) VALUES 
('Cartão de Crédito', 'Pagamento realizado por meio de cartões de crédito das principais bandeiras', 1),
('Boleto Bancário', 'Pagamento realizado por meio de boleto bancário emitido pelo vendedor', 2),
('PIX', 'Pagamento instantâneo utilizando chave PIX', 3),
('Transferência Bancária', 'Pagamento realizado por transferência entre contas bancárias', 4),
('Dinheiro', 'Pagamento realizado em espécie', 5);

-- Inserções de exemplo para a tabela "Pedido"
INSERT INTO Pedido (ClienteID, DataPedido, FormaPagamentoId, Status, UsuarioAtualizacao) VALUES 
(1, '2024-03-14 10:30:00', 1, 'Em processamento', 1),
(2, '2024-03-14 11:45:00', 2, 'Aguardando pagamento', 2),
(3, '2024-03-14 13:20:00', 1, 'Em transporte', 3),
(4, '2024-03-14 14:55:00', 3, 'Entregue', 4),
(5, '2024-03-14 16:10:00', 2, 'Aguardando retirada', 5);

-- Inserção de exemplo para a tabela "ItemPedido"
INSERT INTO ItemPedido (PedidoId, ProdutoId, Quantidade, UsuarioAtualizacao) 
VALUES 
(1, 16, 2, 1), 
(2, 17, 1, 2), 
(3, 18, 3, 3), 
(4, 19, 1, 4), 
(5, 20, 2, 5); 







-- 1. Atualizar o nome de um cliente:
UPDATE sistema_vendas.cliente
SET NOME = 'JOAO'
WHERE ID=1;

-- 2. Deletar um produto:
INSERT INTO Produto (Nome, Descricao, Preco, CategoriaID, UsuarioAtualizacao) VALUES 
('Camiseta', 'Camiseta de algodão branca', 29.99, null, 1);
DELETE FROM produto WHERE Id= 21;

-- 3. Alterar a categoria de um produto:

UPDATE sistema_vendas.produto
SET categoriaId = 3
WHERE ID=1;

-- 4. Inserir um novo cliente:

INSERT INTO Cliente (Nome, Email, Telefone, UsuarioAtualizacao) VALUES
('Chaves do oito', 'issoisso@issoisso', '989-456-7890', 15);

-- 5. Inserir um novo pedido:

INSERT INTO Pedido (ClienteID, DataPedido, FormaPagamentoId, Status, UsuarioAtualizacao) VALUES 
(7, '2024-03-16 11:30:00', 3, 'Em processamento', 15);


-- 6. Atualizar o preço de um produto:
UPDATE sistema_vendas.produto
SET preco = 29.99
WHERE ID=20;


############## DQL - Sem Joins

-- 1. Selecione todos os registros da tabela Produto:
SELECT * FROM produto;

-- 2. Selecione apenas o nome e o preço dos produtos da tabela Produto:
SELECT nome FROM produto;

-- 3. Selecione os produtos da tabela Produto ordenados por preço, do mais barato para o mais caro:
SELECT * FROM produto
ORDER BY preco ASC;

-- 4. Selecione os produtos da tabela Produto ordenados por preço, do mais caro para o mais barato:
SELECT * FROM produto
ORDER BY preco desc;


-- 5. Selecione os nomes distintos das categorias da tabela Categoria:
SELECT DISTINCT NOME  FROM categoria;


-- 6. Selecione os produtos da tabela Produto cujo preço esteja entre $10 e $50:
SELECT * FROM produto
WHERE preco BETWEEN 10 AND 50;


-- 7. Selecione os produtos da tabela Produto, mostrando o nome como "Nome do Produto" e o preço como "Preço Unitário":


SELECT produto.nome AS Nome_do_Produto, produto.preco AS Preco_Unitario FROM produto;


SELECT * FROM produto;

-- 8. Selecione os produtos da tabela Produto, adicionando uma coluna calculada "Preço Total" multiplicando a quantidade pelo preço:


-- 9. Selecione os produtos da tabela Produto, mostrando apenas os 10 primeiros registros:

-- 10. Selecione os produtos da tabela Produto, pulando os primeiros 5 registros e mostrando os 10 seguintes:


############# DQL - Joins
-- 1. Selecione o nome do produto e sua categoria:


-- 2. Selecione o nome do cliente e o nome do produto que ele comprou:


-- 3. Selecione todos os produtos, mesmo aqueles que não têm uma categoria associada:


-- 4. Selecione todos os clientes, mesmo aqueles que não fizeram nenhum pedido:


-- 5. Selecione todas as categorias, mesmo aquelas que não têm produtos associados:


-- 6. Selecione todos os produtos, mesmo aqueles que não foram pedidos:



############### DQL com joins e demais filtros
-- 1. Selecione o nome da categoria e o número de produtos nessa categoria, apenas para categorias com mais de 5 produtos:


-- 2. Selecione o nome do cliente e o total de pedidos feitos por cada cliente:


-- 3. Selecione o nome do produto, o nome da categoria e a quantidade total de vendas para cada produto:


-- 4. Selecione o nome da categoria, o número total de produtos nessa categoria e o número de pedidos para cada categoria:


-- 5. Selecione o nome do cliente, o número total de pedidos feitos por esse cliente e a média de produtos por pedido, apenas para clientes que tenham feito mais de 3 pedidos:


##### Crie uma View qualquer para qualquer um dos joins desenvolvidos

##### Crie uma transaction que cadastra um cliente e faça uma venda
-- Início da transação

-- Inserir um novo cliente


-- Inserir um novo pedido para o cliente


-- Inserir itens no pedido


-- Commit da transação (confirmação das alterações)