import mysql.connector
import time

def delete_database():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root"
        )
        cursor = connection.cursor()
        print("Conexão ao servidor MySQL estabelecida com sucesso.")
        db_name = input("Digite o nome do banco de dados: ")
        cursor.execute(f"DROP DATABASE {db_name}")
        print(f"Banco de dados '{db_name}' excluído com sucesso!") 

    except mysql.connector.Error as error:
        print(f"Erro ao excluir o banco de dados: {error}")