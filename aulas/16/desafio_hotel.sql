CREATE SCHEMA IF NOT EXISTS DEFYOU;
USE DEFYOU;

CREATE TABLE IF NOT EXISTS CLIENTE(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nomeCliente VARCHAR (50) NOT NULL,
    rgCliente VARCHAR(20),
    bairroCliente VARCHAR (50), 
    cidadeCliente VARCHAR(50),
    estadoCliente VARCHAR (50),
    cepCliente VARCHAR(10),
    nascimentoCliente DATE
);

CREATE TABLE IF NOT EXISTS chale (
    id INT AUTO_INCREMENT PRIMARY KEY,
    localizacao VARCHAR(50),
    capacidade INT,
    valor_alta_estacao INT,
    valor_baixa_estacao INT
);

CREATE TABLE IF NOT EXISTS hospedagem(
	id INT AUTO_INCREMENT PRIMARY KEY,
    chale_id INT,
    estado VARCHAR(20),
    data_inicio DATE,
    data_final DATE,
    qtde_pessoas INT,
    desconto INT, 
    valor_final INT,
	FOREIGN KEY (chale_id) REFERENCES chale(id)
    
);

CREATE TABLE IF NOT EXISTS telefone(
	telefone INT AUTO_INCREMENT PRIMARY KEY,
    codCliente INT,
    tipotelefone VARCHAR(20),
    FOREIGN KEY (codCliente) REFERENCES cliente(id)
);

CREATE TABLE IF NOT EXISTS item(
	nomeItem INT AUTO_INCREMENT PRIMARY KEY,
    descricaoItem VARCHAR (80)
);

CREATE TABLE IF NOT EXISTS chale_item(
	codChale INT, 
    nomeItem INT,
    FOREIGN KEY (codChale) REFERENCES chale(id),
    FOREIGN KEY (nomeItem) REFERENCES item(nomeItem)
);

CREATE TABLE IF NOT EXISTS hospedagem_servico(
codHospedagem INT,
codServico INT,
dataServico INT AUTO_INCREMENT PRIMARY KEY,
FOREIGN KEY (codHospedagem) REFERENCES hospedagem(id),
FOREIGN KEY (codServico) REFERENCES servico(codServico)
);

CREATE TABLE IF NOT EXISTS servico( 
codServico INT AUTO_INCREMENT PRIMARY KEY,
nomeServico VARCHAR (30),
valorServico INT
);

ALTER TABLE hospedagem
	ADD COLUMN  cliente_id  INT,
	ADD FOREIGN KEY (cliente_id)	REFERENCES cliente(id);
