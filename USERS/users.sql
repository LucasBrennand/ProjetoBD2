CREATE USER 'admin'@'localhost';
GRANT ALL PRIVILEGES ON restaurante.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER 'gerente'@'localhost';
GRANT SELECT, UPDATE, DELETE ON restaurante.* TO 'gerente'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'funcionario'@'localhost';
GRANT INSERT, SELECT ON restaurante.venda TO 'funcionario'@'localhost';
GRANT INSERT ON restaurante.* TO 'funcionario'@'localhost';
FLUSH PRIVILEGES;