
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

NSERT INTO `vendas` (`id`, `id_cliente`, `id_prato`, `quantidade`, `dia`, `hora`, `valor`) VALUES
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

