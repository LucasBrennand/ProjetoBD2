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

DROP TABLE IF EXISTS `detalhes_vendas`;

DROP VIEW IF EXISTS `detalhes_vendas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalhes_vendas`  AS SELECT `v`.`id` AS `venda_id`, `c`.`nome` AS `cliente_nome`, `p`.`nome` AS `prato_nome`, `v`.`quantidade` AS `quantidade`, `v`.`dia` AS `dia`, `v`.`hora` AS `hora`, `v`.`valor` AS `valor` FROM ((`vendas` `v` join `cliente` `c` on((`v`.`id_cliente` = `c`.`id`))) join `prato` `p` on((`v`.`id_prato` = `p`.`id`))) ;



DROP VIEW IF EXISTS `vendas_por_cliente`;
CREATE TABLE IF NOT EXISTS `vendas_por_cliente` (
`cliente_id` int
,`cliente_nome` varchar(50)
,`total_vendas` bigint
,`total_gasto` double
);

DROP TABLE IF EXISTS `vendas_por_cliente`;

DROP VIEW IF EXISTS `vendas_por_cliente`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vendas_por_cliente`  AS SELECT `c`.`id` AS `cliente_id`, `c`.`nome` AS `cliente_nome`, count(`v`.`id`) AS `total_vendas`, sum(`v`.`valor`) AS `total_gasto` FROM (`cliente` `c` join `vendas` `v` on((`c`.`id` = `v`.`id_cliente`))) GROUP BY `c`.`id`, `c`.`nome` ;

DROP VIEW IF EXISTS `vendas_por_dia`;
CREATE TABLE IF NOT EXISTS `vendas_por_dia` (
`data_venda` date
,`total_vendas` bigint
,`total_gasto` double
);

DROP TABLE IF EXISTS `vendas_por_dia`;

DROP VIEW IF EXISTS `vendas_por_dia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vendas_por_dia`  AS SELECT `v`.`dia` AS `data_venda`, count(`v`.`id`) AS `total_vendas`, sum(`v`.`valor`) AS `total_gasto` FROM `vendas` AS `v` GROUP BY `v`.`dia` ;




