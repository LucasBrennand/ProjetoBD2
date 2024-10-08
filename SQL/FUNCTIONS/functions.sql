DROP FUNCTION IF EXISTS `calculo`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `calculo` (`valor_compra` DECIMAL(10,2)) RETURNS INT DETERMINISTIC BEGIN
    DECLARE pontos INT;
    SET pontos = FLOOR(valor_compra / 10);
    RETURN pontos;
END$$