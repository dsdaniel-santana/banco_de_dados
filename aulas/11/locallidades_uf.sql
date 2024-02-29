-- Criação e uso do Schema
CREATE SCHEMA LOCALIDADES;
use localidades;

CREATE TABLE IF NOT EXISTS localidades.estado(
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR (20) NOT NULL,
    Uf VARCHAR (2) NOT NULL	
);


CREATE TABLE IF NOT EXISTS localidades.cidade(
	Id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
    Nome VARCHAR(20) NOT NULL,
    ID_Estado INT,
    FOREIGN KEY(ID_Estado) REFERENCES Estado(id)
); 

-- INSERÇÃi DE DADOS REAIS
INSERT INTO Estado (Nome, UF) VALUES
	('Rio de Janeiro', 'RJ'),
    ('São Paulo', 'SP'),
    ('Bahia', 'BA');
    
SELECT * FROM CIDADE

INSERT INTO CIDADE (Nome, ID_Estado) VALUES
	('Barueri', 2),
    ('Osaco', 2),
    ('Niteroi', 1),
    ('Feira de Santana', 3);
    
INSERT INTO CIDADE (Nome, ID_EsTADO) VALUES
	('Sydney', NULL),
    ('Melbourne', NULL),
    ('Springfild', NULL);
	

