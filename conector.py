import mysql.connector
import time

class Manage():
    def __init__(self):
        self.mybd = None
        self.mycursor = None
        self.connect()

    def connect(self):
        try:
            self.mybd = mysql.connector.connect(
                host="localhost",
                user="root",
                password="root",
                database="restaurante",
            )
            self.mycursor = self.mybd.cursor()
            print("Conexão sucesso \n")
        except mysql.connector.Error as error:
            print(f"Conexão deu erro {error} \n")
            time.sleep(5)
            self.connect()


    def execute_query(self, sql, data=None):
        try:
            if data is not None:
                self.mycursor.execute(sql, data)
            else:
                self.mycursor.execute(sql)
            self.mybd.commit()
        except mysql.connector.Error as error:
            print(f"Conexão deu erro {error} \n")
            time.sleep(5)
            self.connect()
        return "Consulta executada com sucesso! \n"

    def fetch_all(self):
        return self.mycursor.fetchall()
