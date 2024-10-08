from conector import Manage
manager = Manage()

def insert_cliente():
    nome = input("Digite o nome do cliente: ")
    sexo = input("Digite o sexo do cliente (M/F): ")
    idade = input("Digite a idade do cliente: ")
    nascimento = input("Digite o nascimento do cliente (Ano-Mes-Dia): ")
    pontos = input("Digite quantos pontos o cliente tem: ")

    data = [
        nome,
        sexo,
        idade,
        nascimento,
        pontos
    ]

    sql = """
        INSERT INTO cliente (nome, sexo, idade, nascimento, pontos)
        VALUES (%s,%s,%s,%s,%s)
    """ #Segurança contra SQL injection
    response = manager.execute_query(sql,data)

    return response

def insert_fornecedor():
    nome = input("Digite o nome do fornecedor: ")
    estado_origem = input("Digite o estado origem: ")

    data = [
        nome,
        estado_origem
    ]

    sql = """
        INSERT INTO fornecedor (nome, estado_origem)
        VALUES (%s,%s)
    """ #Segurança contra SQL injection
    response = manager.execute_query(sql,data)

    return response

def insert_ingredientes():
    nome = input("Digite o nome do ingrediente: ")
    data_f = input("Digite a data de fabricação (Ano-Mes-Dia): ")
    data_v = input("Digite a data de validade (Ano-Mes-Dia): ")
    qtd = input("Digite a quantidade de ingrediente: ")
    observacao = input("Digite uma observação do ingrediente: ")

    data = [
        nome,
        data_f,
        data_v,
        qtd,
        observacao
    ]

    sql = """
        INSERT INTO ingredientes (nome, data_fabricacao, data_validade, quantidade, observacao)
        VALUES (%s,%s,%s,%s,%s)
    """ #Segurança contra SQL injection
    response = manager.execute_query(sql,data)

    return response

def insert_prato():
    nome = input("Digite o nome do prato: ")
    desc = input("Digite uma descrição do prato: ")
    valor = input("Digite o valor do prato: ")
    disponibilidade = input("Digite se o prato está disponível (0 = False / 1 = True): ")

    data = [
        nome,
        desc,
        valor,
        disponibilidade
    ]

    sql = """
        INSERT INTO prato (nome, descricao, valor, disponibilidade)
        VALUES (%s,%s,%s,%s)
    """ #Segurança contra SQL injection
    response = manager.execute_query(sql,data)

    return response

def insert_usos():
    id_prato = input("Digite o ID do prato: ")
    id_ingrediente = input("Digite o ID do ingrediente: ")

    data = [
        id_prato,
        id_ingrediente
    ]

    sql = """
        INSERT INTO usos (id_prato, id_ingrediente)
        VALUES (%s,%s)
    """ #Segurança contra SQL injection
    response = manager.execute_query(sql,data)

    return response

def insert_vendas():
    id_cliente = input("Digite o ID do cliente: ")
    id_prato = input("Digite o ID do prato: ")
    qtd = input("Digite a quantidade de vendas: ")
    dia = input("Digite o dia da venda: (Ano -  Mes - Dia): ")
    hora = input("Digite a hora da venda (00:00:00): ")
    valor = input("Digite o valor da venda: ")

    data = [
        id_cliente,
        id_prato,
        qtd,
        dia,
        hora,
        valor
    ]

    sql = """
        INSERT INTO vendas (id_cliente, id_prato, quantidade, hora, valor)
        VALUES (%s,%s)
    """ #Segurança contra SQL injection
    response = manager.execute_query(sql,data)

    return response