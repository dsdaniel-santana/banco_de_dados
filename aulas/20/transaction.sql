USE compras;

SELECT * FROM pedido;
-- 0 INICIANDO A TRANSAÇÃO
START TRANSACTION;


-- 1 INSERINDO UM NOVO PEDIDO

INSERT INTO pedido (clienteId, dataPedido) VALUES	(1, '2024-03-12');
SET @novoPedidoId = last_insert_id(); 

-- INSERINDO OS ITENS DO PEDIDO
INSERT INTO itenspedido (pedidoId, produtoId, quantidade)
	VALUES(@novoPedidoId, 4, 6);
    


UPDATE produto SET quantidade = quantidade - 6 WHERE ID = 4;

-- DESFAZENDO A TRANSAÇÃO
COMMIT;