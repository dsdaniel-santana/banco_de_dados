-- Listar Usuários do sistema
SELECT User, Host FROM mysql.user;

-- Criação de um Usúario de Aplicação
CREATE USER 'aplicacao'@'localhost'
IDENTIFIED BY 'Aplicacao@123';

-- Crie um usuario "Administrador" com permissao de acesso
-- de qualquer lugar, com a nossa senha padrao

CREATE USER 'Administrador'@'%'
IDENTIFIED BY 'Administrador@123';

-- Mudar senha de usuário
SET PASSWORD FOR 'aplicacao'@'localhost' = PASSWORD ('Aplicacao@321');

-- mudar o host do usuario
RENAME USER 'aplicacao'@'localhost' TO 'aplicacao'@'%';

-- Remover usuário
DROP USER 'aplicacao'@'%';

-- Conceder perimissoões necessárias para o usuário acessar o BD desejado
-- GRANT tipo_de_permissao ON nome_do_banco_da_tabela TO 'usuario'@'lugar';
GRANT ALL PRIVILEGES ON gestaoacademica.* TO 'aplicacao'@'localhost'; 

GRANT SELECT ON compras.pedido TO 'aplicacao'@'localhost';

SHOW GRANTS FOR 'aplicacao'@'localhost';

-- Revogar Permissões
-- REVOKE tipo_permissao ON banco.tabela FROM 'usuario'@'localhost';

REVOKE SELECT ON compras.pedido FROM 'aplicacao'@'localhost';
REVOKE ALL PRIVILEGES ON gestaoacademica.* FROM 'aplicacao'@'localhost';
