from inserts import *
from selects import *
from procedures import *
from views import *
from createDB import *

def main(): 
    while True:
        print("O que você gostaria de fazer?")
        print("1 - Inserir dados")
        print("2 - Selecionar dados")
        print("3 - Visualizar views")
        print("4 - Criar banco de dados")
        print("5 - Deletar banco de dados (PERIGO)")
        print("6 - Sair")
        escolha = input("Digite o número da opção: ")
        match escolha:
            case "1":
                print("Inserir dados")
                print("1 - Inserir na tabela cliente")
                print("2 - Inserir na tabela fornecedor")
                print("3 - Inserir na tabela ingredientes")
                print("4 - Inserir na tabela prato")
                print("5 - Inserir na tabela usos")
                print("6 - Inserir na tabela vendas")
                escolha_insert = input("Escolha uma opção: ")
                match escolha_insert:
                    case "1":
                        insert_cliente()
                        print("Inserido com successo")
                    case "2":
                        insert_fornecedor()
                        print("Inserido com successo")
                    case "3":
                        insert_ingredientes()
                        print("Inserido com successo")
                    case "4":
                        insert_prato()
                        print("Inserido com successo")
                    case "5":
                        insert_usos()
                        print("Inserido com successo")
                    case "6":
                        insert_vendas()
                        print("Inserido com successo")
                break
            case "2":
                print("Selecionar dados")
                print("1 - Visualizar a tabela cliente")
                print("2 - Visualizar a tabela fornecedor")
                print("3 - Visualizar a tabela ingredientes")
                print("4 - Visualizar a tabela prato")
                print("5 - Visualizar a tabela usos")
                print("6 - Visualizar a tabela vendas")
                escolha_select = input("Escolha uma opção: ")
                match escolha_select:
                    case "1":
                        select_cliente()
                    case "2":
                        select_fornecedor
                    case "3":
                        select_ingredientes()
                    case "4":
                        select_prato()
                    case "5":
                       select_usos()
                    case "6":
                       select_vendas()
                break
            case "3":
                print("Selecionar Views")
                print("1 - Visualizar a visão de detalhes das vendas")
                print("2 - Visualizar a visão vendas por clientes")
                print("3 - Visualizar a visão de vendas por dia")
                escolha_view = input("Escolha uma opção: ")
                match escolha_view:
                    case "1":
                        break
                    case "2":
                        break
                    case "3":
                        break
            case "4":
                print("Criar banco de dados")
                create_database()
                break
            case "5":
                print("VOCÊ TEM CERTEZA?")
                print("Y - Deletar o banco de dados")
                print("N - Voltar")
                escolha_delete = input("Escolha uma opção: ")
                match escolha_delete:
                    case "Y": break
                    case "N": break
                break
            case "6":
                print("Sair")
                break
            case _:
                print("Opção inválida. Tente novamente.")
    

if __name__ == "__main__":
    main()