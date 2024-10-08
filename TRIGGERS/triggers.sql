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