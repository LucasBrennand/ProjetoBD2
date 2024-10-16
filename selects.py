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