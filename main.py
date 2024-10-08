from inserts import *


def main(): 
    while True:
        print("O que você gostaria de fazer?")
        print("1 - Inserir dados")
        print("2 - Selecionar dados")
        print("3 - Criar banco de dados")
        print("4 - Deletar banco de dados")
        print("5 - Sair")
        
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
                # Chamar função para selecionar dados
                break
            case "3":
                print("Criar banco de dados")
                # Chamar função para criar banco de dados
                break
            case "4":
                print("VOCÊ TEM CERTEZA DE DELETAR?")
                print("Y - Deletar o banco de dados")
                print("N - Voltar")
                escolha_delete = input("Escolha uma opção: ")
                match escolha_delete:
                    case "Y": 
                    case "N": break
                # Chamar função para deletar banco de dados
                break
            case "5":
                print("Sair")
                break
            case _:
                print("Opção inválida. Tente novamente.")
    

if __name__ == "__main__":
    main()