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
-- Inserção de categorias
INSERT INTO categoria (Nome, Descricao, UsuarioAtualizacao) VALUES 
    ('Laptops', 'Computadores portáteis', 1),
    ('Fones de Ouvido', 'Dispositivos de áudio para escuta pessoal', 1),
    ('Câmeras', 'Dispositivos para captura de imagens e vídeos', 1),
    ('Impressoras', 'Dispositivos para impressão de documentos', 1),
    ('Roteadores', 'Dispositivos para conexão de rede sem fio', 1);

-- Inserção de formas de pagamento
INSERT INTO FormaPagamento (Nome, Descricao, UsuarioAtualizacao) VALUES 
    ('Transferência Bancária', 'Pagamento via transferência bancária', 1),
    ('Pix', 'Pagamento via sistema Pix', 1),
    ('Boleto Bancário', 'Pagamento via boleto bancário', 1),
    ('Dinheiro', 'Pagamento em espécie', 1),
    ('Cartão de Débito', 'Pagamento via cartão de débito', 1);

-- Inserção de produtos
INSERT INTO Produto (Nome, Descricao, Preco, CategoriaID, UsuarioAtualizacao) VALUES 
    ('MacBook Pro', 'Laptop profissional da Apple', 1999.99, 1, 1),
    ('Sony WH-1000XM4', 'Fone de ouvido com cancelamento de ruído', 299.99, 2, 1),
    ('Canon EOS R5', 'Câmera mirrorless profissional', 3499.99, 3, 1),
    ('HP LaserJet Pro M404dn', 'Impressora laser monocromática', 299.99, 4, 1),
    ('TP-Link Archer C7', 'Roteador Wi-Fi dual-band', 79.99, 5, 1);

-- Inserção de clientes
INSERT INTO Cliente (Nome, Email, Telefone, UsuarioAtualizacao) VALUES 
	('Daniel San', 'daniel@ideawebsites.com.br', '987654321', 1),
    ('Maria Oliveira', 'maria@example.com', '987654321', 1),
    ('Pedro Santos', 'pedro@example.com', '456789123', 1),
    ('Ana Souza', 'ana@example.com', '741852963', 1),
    ('Luiz Silva', 'luiz@example.com', '369258147', 1),
    ('Carla Pereira', 'carla@example.com', '159263748', 1);

-- Inserção de pedidos
INSERT INTO Pedido (ClienteID, DataPedido, FormaPagamentoId, Status, UsuarioAtualizacao) VALUES 
    (2, NOW(), 2, 'Pendente', 1),
    (3, NOW(), 3, 'Em Processamento', 1),
    (4, NOW(), 4, 'Enviado', 1),
    (5, NOW(), 5, 'Entregue', 1),
    (1, NOW(), 1, 'Cancelado', 1);

-- Inserção de itens de pedido
INSERT INTO ItemPedido (PedidoId, ProdutoId, Quantidade, UsuarioAtualizacao) VALUES 
    (1, 1, 2, 1),
    (2, 2, 1, 1),
    (3, 3, 1, 1),
    (4, 4, 1, 1),
    (5, 5, 1, 1);

-- 1. Atualizar o nome de um cliente:
UPDATE sistema_vendas.cliente
SET NOME = 'DS'
WHERE ID=1;

-- 2. Deletar um produto:
INSERT INTO Produto (Nome, Descricao, Preco, CategoriaID, UsuarioAtualizacao) VALUES 
('Camiseta', 'Camiseta de algodão branca', 29.99, null, 1);

DELETE FROM produto WHERE Id= 6;

-- 3. Alterar a categoria de um produto:
UPDATE sistema_vendas.categoria
SET descricao = 'Computadores'
WHERE ID=1;

-- 4. Inserir um novo cliente:
INSERT INTO Cliente (Nome, Email, Telefone, UsuarioAtualizacao) VALUES
('Chaves do oito', 'issoisso@issoisso', '989-456-7890', 15);

-- 5. Inserir um novo pedido:
INSERT INTO Pedido (ClienteID, DataPedido, FormaPagamentoId, Status, UsuarioAtualizacao) VALUES 
(7, '2024-03-16 11:30:00', 3, 'Em processamento', 15);

-- 6. Atualizar o preço de um produto:
UPDATE sistema_vendas.produto
SET preco = 89.99
WHERE ID=5;

############## DQL - Sem Joins
-- 1. Selecione todos os registros da tabela Produto:
SELECT * FROM produto;

-- 2. Selecione apenas o nome e o preço dos produtos da tabela Produto:
SELECT produto.nome, produto.preco  FROM produto;

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
WHERE preco BETWEEN 89.99 AND 299.99;


-- 7. Selecione os produtos da tabela Produto, mostrando o nome como "Nome do Produto" e o preço como "Preço Unitário":
SELECT produto.nome AS "Nome do Produto", produto.preco AS "Preço Unitário"
FROM produto;

-- 8. Selecione os produtos da tabela Produto, adicionando uma coluna calculada "Preço Total" multiplicando a quantidade pelo preço:
SELECT 
    produto.nome AS "Nome do Produto",
    itempedido.quantidade,
    produto.preco,
    itempedido.quantidade * produto.preco AS "Preço Total"
FROM 
    Produto, itempedido;


-- 9. Selecione os produtos da tabela Produto, mostrando apenas os 10 primeiros registros:
SELECT * FROM PRODUTO LIMIT 10;

INSERT INTO Produto (Nome, Descricao, Preco, CategoriaID, UsuarioAtualizacao) VALUES 
	('Samsung Galaxy S21 Ultra', 'Smartphone topo de gama da Samsung', 1199.99, 1, 1),
    ('Dell XPS 13', 'Laptop premium da Dell', 1299.99, 1, 1),
    ('Bose QuietComfort 35 II', 'Fone de ouvido com cancelamento de ruído', 249.99, 2, 1),
    ('Nikon D850', 'Câmera DSLR de alta resolução', 2999.99, 3, 1),
    ('Epson EcoTank ET-4760', 'Impressora multifuncional com tanques de tinta', 399.99, 4, 1),
    ('Google Nest Wifi', 'Sistema de roteador Wi-Fi e extensor de sinal', 149.99, 5, 1),
    ('Apple Watch Series 7', 'Relógio inteligente da Apple', 399.99, 1, 1),
    ('Microsoft Surface Laptop 4', 'Laptop ultraleve e potente', 999.99, 1, 1),
    ('Sony WF-1000XM4', 'Fones de ouvido verdadeiramente sem fio com cancelamento de ruído', 279.99, 2, 1),
    ('Canon EOS-1D X Mark III', 'Câmera DSLR profissional para fotografia e vídeo', 6499.99, 3, 1);

-- 10. Selecione os produtos da tabela Produto, pulando os primeiros 5 registros e mostrando os 10 seguintes:
SELECT * FROM PRODUTO LIMIT 5, 10;

############# DQL - Joins
-- 1. Selecione o nome do produto e sua categoria:
SELECT produto.nome AS 'Produto Nome', categoria.nome AS 'Categoria'
FROM produto
JOIN categoria ON produto.categoriaid = categoria.id;

-- 2. Selecione o nome do cliente e o nome do produto que ele comprou:
SELECT cliente.nome AS 'Cliente Nome', produto.nome AS 'Produto Nome'
FROM cliente
JOIN  pedido ON  pedido.clienteid = cliente.id
JOIN itempedido ON itempedido.pedidoid = pedido.id 
JOIN produto ON itempedido.produtoid = produto.id;

-- 3. Selecione todos os produtos, mesmo aqueles que não têm uma categoria associada:
SELECT * FROM produto;
INSERT INTO Produto (Nome, Descricao, Preco, CategoriaID, UsuarioAtualizacao)
VALUES ('Produto sem categoria', 'Descrição do produto sem categoria', 99.99, NULL, 1);

-- 4. Selecione todos os clientes, mesmo aqueles que não fizeram nenhum pedido:
SELECT * FROM cliente;


-- 5. Selecione todas as categorias, mesmo aquelas que não têm produtos associados:
SELECT * FROM categoria;


-- 6. Selecione todos os produtos, mesmo aqueles que não foram pedidos:
SELECT * FROM pedido;

############### DQL com joins e demais filtros
-- 1. Selecione o nome da categoria e o número de produtos nessa categoria, apenas para categorias com mais de 5 produtos:
SELECT categoria.Nome AS Nome_da_Categoria, COUNT(produto.Id) AS Numero_de_Produtos
FROM categoria
JOIN produto ON categoria.Id = produto.CategoriaID
GROUP BY categoria.Nome
HAVING COUNT(produto.Id) >= 4;

-- 2. Selecione o nome do cliente e o total de pedidos feitos por cada cliente:
SELECT cliente.Nome AS Nome_do_Cliente, 
    COUNT(pedido.id) AS Total_de_Pedidos
FROM cliente 
JOIN pedido ON cliente.Id = pedido.clienteID
GROUP BY cliente.Nome;

-- 3. Selecione o nome do produto, o nome da categoria e a quantidade total de vendas para cada produto:
SELECT produto.nome AS Nome_do_Produto, categoria.Nome AS Nome_da_Categoria, SUM(itempedido.quantidade) AS Quantidade_Total_de_Vendas
FROM produto 
JOIN categoria ON produto.CategoriaID = categoria.id
JOIN ItemPedido ON produto.Id = ItemPedido.ProdutoId
GROUP BY produto.nome;





-- 4. Selecione o nome da categoria, o número total de produtos nessa categoria e o número de pedidos para cada categoria:
SELECT 
    categoria.Nome AS Nome_da_Categoria, 
    COUNT(DISTINCT produto.Id) AS Numero_de_Produtos,
    COUNT(DISTINCT pedido.Id) AS Numero_de_Pedidos
FROM categoria
LEFT JOIN produto ON categoria.Id = produto.CategoriaID
LEFT JOIN itempedido ON produto.Id = itempedido.ProdutoId
LEFT JOIN pedido ON itempedido.PedidoId = pedido.Id
GROUP BY categoria.Nome;



-- 5. Selecione o nome do cliente, o número total de pedidos feitos por esse cliente e a média de produtos por pedido, apenas para clientes que tenham feito mais de 3 pedidos:
SELECT Cliente.Nome AS Nome_do_Cliente,
    COUNT(Pedido.Id) AS Total_de_Pedidos,
    AVG(ItemPedido.Quantidade) AS Media_de_Produtos_por_Pedido
FROM Cliente
JOIN Pedido ON Cliente.Id = Pedido.ClienteID
JOIN ItemPedido ON Pedido.Id = ItemPedido.PedidoId
GROUP BY Cliente.Nome
HAVING COUNT(Pedido.Id) >= 1;

##### Crie uma View qualquer para qualquer um dos joins desenvolvidos
CREATE VIEW Contagem_Categorias AS
SELECT categoria.nome AS Nome_Categoria, 
    COUNT(DISTINCT produto.id) AS Contagem_Produtos,
    COUNT(DISTINCT pedido.id) AS Contagem_Pedidos
FROM categoria
LEFT JOIN produto ON categoria.Id = produto.CategoriaID
LEFT JOIN itempedido ON produto.ID = itempedido.ProdutoId
LEFT JOIN pedido ON itempedido.PedidoId = pedido.Id
GROUP BY categoria.nome;

SELECT * FROM Contagem_Categorias;

##### Crie uma transaction que cadastra um cliente e faça uma venda
-- Início da transação
START TRANSACTION;

-- Inserir um novo cliente
INSERT INTO Cliente (Nome, Email, Telefone, UsuarioAtualizacao)
VALUES ('Novo Cliente', 'novo_cliente@example.com', '123456789', 1);

-- Obter o ID do cliente recém-inserido
SET @clienteId = last_insert_id();

-- Inserir um novo pedido para o cliente
INSERT INTO Pedido (ClienteID, DataPedido, Status, UsuarioAtualizacao)
VALUES (@clienteId, NOW(), 'Pendente', 1);

-- Obter o ID do pedido recém-inserido
SET @pedidoId = last_insert_id();

-- Inserir um item no pedido
INSERT INTO ItemPedido (PedidoId, ProdutoId, Quantidade, UsuarioAtualizacao)
VALUES (@pedidoId, 1, 1, 1); 

-- Commit da transação (confirmação das alterações)
COMMIT;







