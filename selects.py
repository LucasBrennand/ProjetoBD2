from conector import Manage
import pandas as pd

manager = Manage()

def select_cliente():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT * FROM cliente"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_fornecedor():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT * FROM fornecedor"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_ingredientes():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT * FROM ingredientes"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")          
            
def select_prato():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT * FROM prato"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")  

def select_usos():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT * FROM usos"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")  

def select_vendas():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT * FROM vendas"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_vendas():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT * FROM vendas"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")    

# SELECT individual para cada coluna:
# Tabela cliente

def select_nome_cliente():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT nome FROM cliente"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_sexo_cliente():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT sexo FROM cliente"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_idade_cliente():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT idade FROM cliente"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_nascimento_cliente():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT nascimento FROM cliente"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_pontos_cliente():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT pontos FROM cliente"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

# Tabela fornecedor

def select_nome_fornecedor():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT nome FROM fornecedor"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_estadoOrigem_fornecedor():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT estado_origem FROM fornecedor"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

# Tabela ingredientes

def select_nome_ingredientes():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT nome FROM ingredientes"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_dataF_ingredientes():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT data_fabricacao FROM ingredientes"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_dataVal_ingredientes():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT data_validade FROM ingredientes"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_quantidade_ingredientes():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT quantidade FROM ingredientes"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_observacao_ingredientes():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT observacao FROM ingredientes"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

# Tabela prato

def select_nome_prato():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT nome FROM prato"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_descricao_prato():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT descricao FROM prato"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_valor_prato():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT valor FROM prato"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_disponibilidade_prato():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT disponibilidade FROM prato"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

# Tabela vendas

def select_quantidade_vendas():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT quantidade FROM vendas"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_dia_vendas():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT dia FROM vendas"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_hora_vendas():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT hora FROM vendas"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")

def select_valor_vendas():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT valor FROM vendas"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e}")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada.")
