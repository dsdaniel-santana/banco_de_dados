CREATE DATABASE hotel;
USE hotel;

CREATE TABLE IF NOT EXISTS cliente(
	codCliente INT PRIMARY KEY AUTO_INCREMENT,
    nomeCliente VARCHAR (100) NOT NULL,
    rgCliente VARCHAR(15) NOT NULL,
    enderecoCliente VARCHAR (100) NOT NULL,
    bairroCliente VARCHAR (50) NOT NULL,
    cidadeCliente VARCHAR (50) NOT NULL,
    estadoCliente CHAR (2) NOT NULL,
    CEPcliente CHAR (8) NOT NULL,
    nascimentoCliente DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS telefone(
	telefone INT PRIMARY KEY,
    codCliente INT,
    tipoTelefone VARCHAR(50) NOT NULL,
    FOREIGN KEY (codCliente) REFERENCES cliente(codCliente)
);

CREATE TABLE IF NOT EXISTS Chale(
	codChale INT PRIMARY KEY AUTO_INCREMENT,
    localizacao VARCHAR(100) NOT NULL,
    capacidade INT DEFAULT 1,
    valorAltaEstacao DECIMAL (10,2) NOT NULL,
    valorBaixaEstacao DECIMAL (10,2) NOT NULL
);

CREATE TABLE Hospedagem(
	codHospedagem INT PRIMARY KEY AUTO_INCREMENT,
    codCliente INT,
    codChale INT, 
    dataInicio DATE NOT NULL, 
    dataFim DATE,
	qtdePessoas INT DEFAULT 1,
    desconto DECIMAL (10,2) DEFAULT 0.0,
    valorFinal DECIMAL (10,2),
    FOREIGN KEY (codChale) REFERENCES chale(codChale),
    FOREIGN KEY (codCliente) REFERENCES cliente(codCliente)
);

CREATE TABLE Item(
	nomeItem VARCHAR (255) PRIMARY KEY,
    descricaoItem VARCHAR(255) NOT NULL
);

CREATE TABLE Servico(
	codServico INT PRIMARY KEY AUTO_INCREMENT,
    nomeServico VARCHAR (255) NOT NULL,
    valorServico DECIMAL (10,2) NOT NULL
);

CREATE TABLE Hospedagem_Servico(
	codHospedagem INT,
    codServico INT,
    dataServico DATE NOT NULL,
    PRIMARY KEY (codHospedagem, codServico),
    FOREIGN KEY(codHospedagem) REFERENCES Hospedagem(codHospedagem),
    FOREIGN KEY (codServico) REFERENCES Servico(codServico)
    );

CREATE TABLE Chale_Item(
	codChale INT,
    nomeItem VARCHAR(255),
    PRIMARY KEY (codChale, nomeItem),
    FOREIGN KEY (codChale) REFERENCES chale(codChale),
	FOREIGN KEY (nomeItem) REFERENCES Item(nomeItem)
    );
