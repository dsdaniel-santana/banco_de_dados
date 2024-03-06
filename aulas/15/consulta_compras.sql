-- SELECT TUDO DA TABELA X 
SELECT * FROM pedido;

-- SELECT COM CONTAGEM DE REGISTROS
SELECT COUNT(*) AS Total_Pedidos
FROM pedido;

-- DISTINCT UNIFICA OS DADOS REPETIDOS, NÃO É POSSIVEL UTLIZAR O COUNT
SELECT DISTINCT clienteID
FROM pedido;

-- GROUP BY - AGRUPA OS DADOS, DESTA FORMA É POSSIVEL UTLIZAR O COUNT, SELECT QUANTOS PEDIDOS CADA CLIENTE FEZ
SELECT ClienteID, COUNT(*)
FROM pedido
GROUP BY ClienteID;

-- SELECIONAR O TOTAL DE PRODUTOS
SELECT pedidoId, COUNT(*) AS ProdutosPorPedido
FROM itenspedido
GROUP BY pedidoId;

SELECT * FROM itenspedido;

-- SELECIONAR PRODUTOS MAIS VENDIDOS
SELECT produtoId, SUM(quantidade) AS MaisVendidos
FROM ItensPedido
GROUP BY produtoId
ORDER BY Maisvendidos DESC;

-- LISTE OS CLIENTES INFORMANDO: TOTAL GASTO, MEDIA DE PRODUTOS DATA DO PRIMEIRO E ÚLTIMO PEDIDO
SELECT 
	cliente.nome,
    COUNT(*) AS NumPedidos,
    SUM(produto.preco * itenspedido.quantidade) AS TotalGasto,
    AVG (itenspedido.quantidade) AS MediaProdutosPorPedido,
    MIN(pedido.dataPedido) AS PrimeiroPedido,
    MAX(pedido.dataPedido) AS UltimoPedido 
FROM pedido
JOIN cliente ON cliente.id = pedido.clienteid
JOIN itenspedido ON pedido.id = itenspedido.pedidoId
JOIN produto ON itenspedido.produtoId = produto.id
GROUP BY pedido.clienteId;

SELECT * FROM CLIENTE;
    

