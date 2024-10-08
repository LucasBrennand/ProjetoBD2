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
