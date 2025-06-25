-- Script de configuração para o Laboratório de SQL Injection
-- --------------------------------------------------------

-- 1. Cria o banco de dados (se ele não existir)

CREATE DATABSE IF NOT EXISTS sqlinjection;
USE sqlinjection;

-- 2. Cria a tabela de usuários

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INTEGER AUTO_INCREMENT,
    name VARCHAR(250),
    password VARCHAR(250),
    PRIMARY KEY (id)
);

-- 3. Insere os dados iniciais, incluindo a flag

INSERT INTO users (id, name, password) VALUES (1, 'admin', 'admin');
INSERT INTO users (id, name, password) VALUES (2, 'vrsmarcos26', 'gostoudoCTF?');
INSERT INTO users (id, name, password) VALUES (3, 'FLAG', 'FLAG{1NJ3T4ND0_C0NH3C1M3NT0}'); -- Usando uma das flags que sugerimos

-- 4. Cria o usuário específico para a aplicação
-- Nota: Em um ambiente real, NUNCA use 'root'.

CREATE USER IF NOT EXISTS 'sqlinjection'@'localhost' IDENTIFIED BY 'senha@123';

-- 5. Concede as permissões necessárias para o usuário no banco de dados

GRANT ALL PRIVILEGES ON sqlinjection.* TO 'sqlinjection'@'localhost';

-- 6. Atualiza os privilégios

FLUSH PRIVILEGES;

-- --- Fim do Script ---