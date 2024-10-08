from conector import Manage
manager = Manage()

def select_cliente():
    sql = """SELECT * FROM cliente"""
    is_select_query = manager.execute_query(sql)
    if is_select_query:
        response = manager.fetch_all()
        if response:
            for row in response:
                print(row)
        else:
            print("Nenhum resultado encontrado na tabela cliente.")
    else:
        print("A consulta não retornou resultados.")
