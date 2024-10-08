from conector import Manage
import pandas as pd
manager = Manage()

def view_detalhes_venda():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT * FROM detalhes_vendas"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e} \n")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada. \n")

def view_vendas_por_cliente():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT * FROM vendas_por_cliente"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e} \n")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada. \n")

def view_vendas_por_dia():
    connection = Manage()
    if connection is None:
        return

    try:
        sql_query = "SELECT * FROM vendas_por_dia"
        cursor = connection.mycursor
        cursor.execute(sql_query)
        results = cursor.fetchall()
        column_names = [i[0] for i in cursor.description]

        df = pd.DataFrame(results, columns=column_names)
        print(df)

    except Exception as e:
        print(f"An error occurred: {e} \n")

    finally:
        if connection.mybd.is_connected():
            cursor.close()
            connection.mybd.close()
            print("Conexão encerrada. \n")
