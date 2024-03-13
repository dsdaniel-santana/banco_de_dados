use hotel;
-- CRIAR UMA TRANSACTION QUE, QUANDO O CLIENTE FIZER UMA HOSPEDAGEM
START TRANSACTION;
SET @cafeManhaID = 1;
INSERT INTO hospedagem (codChale, codCliente, dataInicio,dataFim, qtdPessoas, desconto, valorFinal ) VALUES 
(3, 5, '2024-01-01', '2024-03-01', 3, 0, 370.00);
SET @hospedagemID = last_insert_id();
-- AUTMOMATICAMENTE ADCIONE UM CAFÉ DA MANHÃ PARA A SUA HOSPEDAGEM 
INSERT INTO hospedagem_servico
	values(@hospedagemID, @cafeManhaID, '2024-01-01');

COMMIT;
