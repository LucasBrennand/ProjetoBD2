-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 08/10/2024 às 13:46
-- Versão do servidor: 8.0.39
-- Versão do PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `restaurante`
--

DELIMITER $$
--
-- Procedimentos
--
DROP PROCEDURE IF EXISTS `estatisticas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `estatisticas` ()   BEGIN
    DECLARE produto_mais_vendido INT;
    DECLARE vendedor_mais_vendido INT;
    DECLARE produto_menos_vendido INT;
    DECLARE valor_produto_mais_vendido DECIMAL(10, 2);
    DECLARE valor_produto_menos_vendido DECIMAL(10, 2);
    DECLARE mes_mais_vendas INT;
    DECLARE mes_menos_vendas INT;
    
    SELECT v.id_prato, SUM(v.quantidade) AS total_vendido
    INTO produto_mais_vendido
    FROM venda v
    GROUP BY v.id_prato
    ORDER BY total_vendido DESC
    LIMIT 1;

    SELECT v.id_cliente
    INTO vendedor_mais_vendido
    FROM venda v
    WHERE v.id_prato = produto_mais_vendido
    GROUP BY v.id_cliente
    ORDER BY SUM(v.quantidade) DESC
    LIMIT 1;

    SELECT v.id_prato, SUM(v.quantidade) AS total_vendido
    INTO produto_menos_vendido
    FROM venda v
    GROUP BY v.id_prato
    ORDER BY total_vendido ASC
    LIMIT 1;

    SELECT SUM(v.valor) INTO valor_produto_mais_vendido
    FROM venda v
    WHERE v.id_prato = produto_mais_vendido;

    SELECT MONTH(v.dia) AS mes, COUNT(*) AS total_vendas
    INTO mes_mais_vendas
    FROM venda v
    WHERE v.id_prato = produto_mais_vendido
    GROUP BY mes
    ORDER BY total_vendas DESC
    LIMIT 1;

    SELECT MONTH(v.dia) AS mes, COUNT(*) AS total_vendas
    INTO mes_menos_vendas
    FROM venda v
    WHERE v.id_prato = produto_mais_vendido
    GROUP BY mes
    ORDER BY total_vendas ASC
    LIMIT 1;
    
    SELECT SUM(v.valor) INTO valor_produto_menos_vendido
    FROM venda v
    WHERE v.id_prato = produto_menos_vendido;

    SELECT produto_mais_vendido AS 'Produto mais vendido', 
           vendedor_mais_vendido AS 'Vendedor Associado',
           produto_menos_vendido AS 'Produto menos vendido',
           valor_produto_mais_vendido AS 'Valor do produto mais vendido',
           mes_mais_vendas AS 'Mês de maior vendas do produto mais vendido',
           mes_menos_vendas AS 'Mês de menor vendas do produto mais vendido',
           valor_produto_menos_vendido AS 'Valor do produto menos vendido';
END$$

DROP PROCEDURE IF EXISTS `gastar_pontos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `gastar_pontos` (`cliente_id` INT, `prato_id` INT, `quantidade` INT)   BEGIN
    DECLARE valor_prato DECIMAL(10, 2);
    DECLARE pontos_disponiveis INT;
    DECLARE total_gasto DECIMAL(10, 2);
    DECLARE pontos_usados INT;

    SELECT valor INTO valor_prato
    FROM prato
    WHERE id = prato_id;

    SET total_gasto = valor_prato * quantidade;

    SELECT pontos INTO pontos_disponiveis
    FROM cliente
    WHERE id = cliente_id;

    IF pontos_disponiveis >= CEIL(total_gasto) THEN
        SET pontos_usados = CEIL(total_gasto);
        UPDATE cliente
        SET pontos = pontos - pontos_usados
        WHERE id = cliente_id;

        INSERT INTO vendas (id_cliente, id_prato, quantidade, dia, hora, valor)
        VALUES (cliente_id, prato_id, quantidade, CURDATE(), CURTIME(), total_gasto);
    ELSE
        SET pontos_usados = pontos_disponiveis;
        SET total_gasto = pontos_usados;
        UPDATE cliente
        SET pontos = 0
        WHERE id = cliente_id;

        INSERT INTO vendas (id_cliente, id_prato, quantidade, dia, hora, valor)
        VALUES (cliente_id, prato_id, quantidade, CURDATE(), CURTIME(), total_gasto);
    END IF;
END$$

DROP PROCEDURE IF EXISTS `reajuste`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `reajuste` (`percentual` DECIMAL(5,2))   BEGIN
    UPDATE prato
    SET valor = valor + (valor * (percentual / 100));
END$$

DROP PROCEDURE IF EXISTS `sorteio`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sorteio` ()   BEGIN
    DECLARE cliente_sorteado INT;
    SELECT id INTO cliente_sorteado
    FROM cliente
    ORDER BY RAND()
    LIMIT 1;

    UPDATE cliente
    SET pontos = pontos + 100
    WHERE id = cliente_sorteado;
END$$

--
-- Funções
--
DROP FUNCTION IF EXISTS `calculo`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `calculo` (`valor_compra` DECIMAL(10,2)) RETURNS INT DETERMINISTIC BEGIN
    DECLARE pontos INT;
    SET pontos = FLOOR(valor_compra / 10);
    RETURN pontos;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sexo` char(1) NOT NULL,
  `idade` int NOT NULL,
  `nascimento` date NOT NULL,
  `pontos` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `sexo`, `idade`, `nascimento`, `pontos`) VALUES
(1, 'Lucas Brennand', 'm', 34, '2002-08-15', 126),
(2, 'Ana Oliveira', 'f', 28, '1996-07-10', 85),
(3, 'João Souza', 'm', 40, '1984-03-15', 200),
(4, 'Mariana Costa', 'f', 22, '2002-09-05', 50),
(5, 'Roberto Lima', 'm', 45, '1979-11-23', 350),
(6, 'Fernanda Pereira', 'f', 30, '1994-12-30', 90),
(7, 'Paulo Santos', 'm', 27, '1997-08-11', 75),
(8, 'Isabela Ferreira', 'f', 33, '1991-04-02', 150),
(9, 'Ricardo Alves', 'm', 38, '1986-06-19', 220),
(10, 'Laura Martins', 'f', 25, '1999-01-17', 60),
(11, 'Lucas', 'M', 22, '2002-08-15', 90),
(12, 'Adila', 'F', 19, '2004-12-22', 90);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `detalhes_vendas`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `detalhes_vendas`;
CREATE TABLE IF NOT EXISTS `detalhes_vendas` (
`venda_id` int
,`cliente_nome` varchar(50)
,`prato_nome` varchar(50)
,`quantidade` int
,`dia` date
,`hora` time
,`valor` double
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE IF NOT EXISTS `fornecedor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `estado_origem` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id`, `nome`, `estado_origem`) VALUES
(1, 'Agro Alimentos LTDA', 'São Paulo'),
(2, 'Sabor do Campo', 'Minas Gerais'),
(3, 'Distribuidora Verde', 'Paraná'),
(4, 'Frutas Tropicais', 'Bahia'),
(5, 'Laticínios Frescos', 'Santa Catarina'),
(6, 'Peixe do Mar', 'Rio de Janeiro'),
(7, 'Carne Bovina Premium', 'Mato Grosso do Sul'),
(8, 'Grãos do Cerrado', 'Goiás'),
(9, 'Alimentos Naturais', 'Ceará'),
(10, 'Produtores Orgânicos', 'Rio Grande do Sul');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
CREATE TABLE IF NOT EXISTS `ingredientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `data_fabricacao` date NOT NULL,
  `data_validade` date NOT NULL,
  `quantidade` int NOT NULL,
  `observacao` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `nome`, `data_fabricacao`, `data_validade`, `quantidade`, `observacao`) VALUES
(1, 'Farinha de Trigo', '2024-01-10', '2025-01-10', 100, 'Armazenar em local seco'),
(2, 'Leite Integral', '2024-08-01', '2024-12-01', 50, 'Manter refrigerado'),
(3, 'Açúcar Refinado', '2023-12-05', '2025-12-05', 200, 'Armazenar em recipiente fechado'),
(4, 'Arroz Integral', '2024-03-15', '2025-03-15', 120, 'Produto orgânico'),
(5, 'Sal Marinho', '2024-02-20', '2026-02-20', 300, 'Não expor à umidade'),
(6, 'Óleo de Soja', '2024-04-25', '2025-04-25', 60, 'Manter em temperatura ambiente'),
(7, 'Tomate Fresco', '2024-09-25', '2024-10-05', 80, 'Produto perecível'),
(8, 'Peito de Frango', '2024-10-01', '2024-10-15', 40, 'Manter congelado'),
(9, 'Manteiga Sem Sal', '2024-07-15', '2024-11-15', 70, 'Conservar em geladeira'),
(10, 'Fermento Biológico', '2024-05-10', '2025-05-10', 30, 'Armazenar em local fresco');

--
-- Acionadores `ingredientes`
--
DROP TRIGGER IF EXISTS `ingrediente_validade`;
DELIMITER $$
CREATE TRIGGER `ingrediente_validade` AFTER UPDATE ON `ingredientes` FOR EACH ROW BEGIN
  IF NEW.data_validade < CURDATE() THEN
    UPDATE prato
    SET disponibilidade = 0
    WHERE id IN (SELECT id_prato FROM usos WHERE id_ingrediente = NEW.id);
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `prato`
--

DROP TABLE IF EXISTS `prato`;
CREATE TABLE IF NOT EXISTS `prato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` text NOT NULL,
  `valor` double NOT NULL,
  `disponibilidade` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `prato`
--

INSERT INTO `prato` (`id`, `nome`, `descricao`, `valor`, `disponibilidade`) VALUES
(1, 'Feijoada Completa', 'Feijoada tradicional brasileira com acompanhamentos', 35.9, 1),
(2, 'Strogonoff de Frango', 'Frango ao molho cremoso com champignon e batata palha', 28.5, 1),
(3, 'Lasanha Bolonhesa', 'Lasanha recheada com carne moída ao molho bolonhesa', 32, 1),
(4, 'Moqueca de Peixe', 'Moqueca capixaba com peixe fresco e temperos típicos', 45, 1),
(5, 'Filé à Parmegiana', 'Filé de carne bovina empanado, coberto com molho e queijo', 39.9, 1),
(6, 'Pizza Margherita', 'Pizza tradicional italiana com molho de tomate, queijo e manjericão', 42.5, 1),
(7, 'Risoto de Camarão', 'Risoto cremoso preparado com camarão e temperos frescos', 48, 1),
(8, 'Salmão Grelhado', 'Salmão grelhado servido com legumes ao vapor', 55, 1),
(9, 'Hambúrguer Artesanal', 'Hambúrguer gourmet com carne bovina, queijo e bacon', 22, 1),
(10, 'Spaghetti Carbonara', 'Macarrão spaghetti ao molho carbonara com bacon e parmesão', 30, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usos`
--

DROP TABLE IF EXISTS `usos`;
CREATE TABLE IF NOT EXISTS `usos` (
  `id_prato` int DEFAULT NULL,
  `id_ingrediente` int DEFAULT NULL,
  KEY `id_prato` (`id_prato`),
  KEY `id_ingrediente` (`id_ingrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `usos`
--

INSERT INTO `usos` (`id_prato`, `id_ingrediente`) VALUES
(1, 1),
(1, 7),
(2, 2),
(2, 8),
(3, 1),
(3, 6),
(4, 7),
(5, 9),
(6, 1),
(6, 5),
(4, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

DROP TABLE IF EXISTS `vendas`;
CREATE TABLE IF NOT EXISTS `vendas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_prato` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `dia` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_prato` (`id_prato`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`id`, `id_cliente`, `id_prato`, `quantidade`, `dia`, `hora`, `valor`) VALUES
(1, 1, 1, 2, '2024-10-01', '12:30:00', 71.8),
(2, 2, 2, 1, '2024-10-02', '13:00:00', 28.5),
(3, 3, 3, 3, '2024-10-03', '19:45:00', 96),
(4, 4, 4, 1, '2024-10-04', '12:15:00', 45),
(5, 5, 5, 4, '2024-10-05', '20:00:00', 159.6),
(6, 6, 6, 1, '2024-10-06', '18:30:00', 42.5),
(7, 7, 7, 2, '2024-10-07', '13:15:00', 96),
(8, 8, 8, 1, '2024-10-08', '12:00:00', 55),
(9, 9, 9, 3, '2024-10-09', '14:45:00', 66),
(10, 10, 10, 1, '2024-10-10', '19:00:00', 30),
(11, 1, 3, 2, '2024-10-11', '12:45:00', 64);

--
-- Acionadores `vendas`
--
DROP TRIGGER IF EXISTS `atualiza_estoque`;
DELIMITER $$
CREATE TRIGGER `atualiza_estoque` AFTER INSERT ON `vendas` FOR EACH ROW BEGIN
  DECLARE id_ingrediente INT;
  DECLARE cursor_ingredientes CURSOR FOR 
  SELECT id_ingrediente FROM usos WHERE id_prato = NEW.id_prato;
  
  OPEN cursor_ingredientes;
  read_loop: LOOP
    FETCH cursor_ingredientes INTO id_ingrediente;
    UPDATE ingredientes
    SET quantidade = quantidade - NEW.quantidade
    WHERE id = id_ingrediente;
    IF NOT FOUND THEN
      LEAVE read_loop;
    END IF;
  END LOOP;
  CLOSE cursor_ingredientes;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `calcula_pontos`;
DELIMITER $$
CREATE TRIGGER `calcula_pontos` AFTER INSERT ON `vendas` FOR EACH ROW BEGIN
  DECLARE pontos_ganhos INT;
  SET pontos_ganhos = FLOOR(NEW.valor / 10);

  UPDATE cliente
  SET pontos = pontos + pontos_ganhos
  WHERE id = NEW.id_cliente;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `verifica_disponibilidade`;
DELIMITER $$
CREATE TRIGGER `verifica_disponibilidade` BEFORE INSERT ON `vendas` FOR EACH ROW BEGIN
  DECLARE disponibilidade_prato TINYINT;
  SELECT disponibilidade INTO disponibilidade_prato
  FROM prato
  WHERE id = NEW.id_prato;
  
  IF disponibilidade_prato = 0 THEN
    SIGNAL SQLSTATE '75002'
           SET MESSAGE_TEXT = 'Esse prato está indisponível';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vendas_por_cliente`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `vendas_por_cliente`;
CREATE TABLE IF NOT EXISTS `vendas_por_cliente` (
`cliente_id` int
,`cliente_nome` varchar(50)
,`total_vendas` bigint
,`total_gasto` double
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vendas_por_dia`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `vendas_por_dia`;
CREATE TABLE IF NOT EXISTS `vendas_por_dia` (
`data_venda` date
,`total_vendas` bigint
,`total_gasto` double
);

-- --------------------------------------------------------

--
-- Estrutura para view `detalhes_vendas`
--
DROP TABLE IF EXISTS `detalhes_vendas`;

DROP VIEW IF EXISTS `detalhes_vendas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalhes_vendas`  AS SELECT `v`.`id` AS `venda_id`, `c`.`nome` AS `cliente_nome`, `p`.`nome` AS `prato_nome`, `v`.`quantidade` AS `quantidade`, `v`.`dia` AS `dia`, `v`.`hora` AS `hora`, `v`.`valor` AS `valor` FROM ((`vendas` `v` join `cliente` `c` on((`v`.`id_cliente` = `c`.`id`))) join `prato` `p` on((`v`.`id_prato` = `p`.`id`))) ;

-- --------------------------------------------------------

--
-- Estrutura para view `vendas_por_cliente`
--
DROP TABLE IF EXISTS `vendas_por_cliente`;

DROP VIEW IF EXISTS `vendas_por_cliente`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vendas_por_cliente`  AS SELECT `c`.`id` AS `cliente_id`, `c`.`nome` AS `cliente_nome`, count(`v`.`id`) AS `total_vendas`, sum(`v`.`valor`) AS `total_gasto` FROM (`cliente` `c` join `vendas` `v` on((`c`.`id` = `v`.`id_cliente`))) GROUP BY `c`.`id`, `c`.`nome` ;

-- --------------------------------------------------------

--
-- Estrutura para view `vendas_por_dia`
--
DROP TABLE IF EXISTS `vendas_por_dia`;

DROP VIEW IF EXISTS `vendas_por_dia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vendas_por_dia`  AS SELECT `v`.`dia` AS `data_venda`, count(`v`.`id`) AS `total_vendas`, sum(`v`.`valor`) AS `total_gasto` FROM `vendas` AS `v` GROUP BY `v`.`dia` ;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `usos`
--
ALTER TABLE `usos`
  ADD CONSTRAINT `usos_ibfk_1` FOREIGN KEY (`id_prato`) REFERENCES `prato` (`id`),
  ADD CONSTRAINT `usos_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id`);

--
-- Restrições para tabelas `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `vendas_ibfk_2` FOREIGN KEY (`id_prato`) REFERENCES `prato` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- --------------------------------------------------------

--
-- Estrutura para `users`
--
-- Criar o usuário Administrador e concedor todas permissões
CREATE USER 'admin'@'localhost';
GRANT ALL PRIVILEGES ON restaurante.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

-- Criar o usuário Gerente e conceder permissões de busca, apagar e edição
CREATE USER 'gerente'@'localhost';
GRANT SELECT, UPDATE, DELETE ON restaurante.* TO 'gerente'@'localhost';
FLUSH PRIVILEGES;

-- Criar o usuário Funcionário e conceder permissões de adição de novos registros e consulta de vendas
CREATE USER 'funcionario'@'localhost';
GRANT INSERT, SELECT ON restaurante.venda TO 'funcionario'@'localhost';
GRANT INSERT ON restaurante.* TO 'funcionario'@'localhost';
FLUSH PRIVILEGES;
-- --------------------------------------------------------