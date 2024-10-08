import mysql.connector
import time

def create_database():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="root"
        )
        cursor = connection.cursor()
        print("Conexão ao servidor MySQL estabelecida com sucesso.")
        db_name = input("Digite o nome do novo banco de dados: ")
        cursor.execute(f"CREATE DATABASE {db_name}")
        print(f"Banco de dados '{db_name}' criado com sucesso!")

    except mysql.connector.Error as error:
        print(f"Erro ao criar o banco de dados: {error}")

    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()
