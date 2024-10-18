from inserts import *
from selects import *
from procedures import *
from views import *
from createDB import *
from deleteDB import *

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
        while escolha != 6:
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
                        print("Inserido com successo \n")
                    case "2":
                        insert_fornecedor()
                        print("Inserido com successo \n")
                    case "3":
                        insert_ingredientes()
                        print("Inserido com successo \n")
                    case "4":
                        insert_prato()
                        print("Inserido com successo \n")
                    case "5":
                        insert_usos()
                        print("Inserido com successo \n")
                    case "6":
                        insert_vendas()
                        print("Inserido com successo \n")
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
                        while True:
                            print("Caso deseje visualizar os valores de uma só coluna")
                            print("1 - nome")
                            print("2 - sexo")
                            print("3 - idade")
                            print("4 - nascimento")
                            print("5 - pontos")
                            print("6 - Sair")
                            escolha_coluna = input("Escolha uma opção: ")
                            match escolha_coluna:
                                case "1":
                                    select_nome_cliente()
                                    break
                                case "2":
                                    select_sexo_cliente()
                                    break
                                case "3":
                                    select_idade_cliente()
                                    break
                                case "4":
                                    select_nascimento_cliente()
                                    break
                                case "5":
                                    select_pontos_cliente()
                                    break
                                case "6":
                                    print("Sair")
                                    break
                                case _:
                                    print("Opção inválida. Tente novamente. \n")
                                    break                  
                        break
                    case "2":
                        select_fornecedor()
                        while True:
                            print("Caso deseje visualizar os valores de uma só coluna")
                            print("1 - nome")
                            print("2 - estado_origem")
                            print("3 - Sair")
                            escolha_coluna = input("Escolha uma opção: ")
                            match escolha_coluna:
                                case "1":
                                    select_nome_fornecedor()
                                    break
                                case "2":
                                    select_estadoOrigem_fornecedor()
                                    break
                                case "3":
                                    print("Sair")
                                    break
                                case _:
                                    print("Opção inválida. Tente novamente. \n")
                        break
                    case "3":
                        select_ingredientes()
                        while True:
                            print("Caso deseje visualizar os valores de uma só coluna")
                            print("1 - nome")
                            print("2 - data_fabricacao")
                            print("3 - data_validade")
                            print("4 - quantidade")
                            print("5 - observacao")
                            print("6 - Sair")
                            escolha_coluna = input("Escolha uma opção: ")
                            match escolha_coluna:
                                case "1":
                                    select_nome_ingredientes()
                                    break
                                case "2":
                                    select_dataF_ingredientes()
                                    break
                                case "3":
                                    select_dataVal_ingredientes()
                                    break
                                case "4":
                                    select_quantidade_ingredientes()
                                    break
                                case "5":
                                    select_observacao_ingredientes()
                                    break
                                case "6":
                                    print("Sair")
                                    break
                                case _:
                                    print("Opção inválida. Tente novamente. \n")
                                    break                  
                        break
                    case "4":
                        select_prato()
                        while True:
                            print("Caso deseje visualizar os valores de uma só coluna")
                            print("1 - nome")
                            print("2 - descricao")
                            print("3 - valor")
                            print("4 - disponibilidade")
                            print("5 - Sair")
                            escolha_coluna = input("Escolha uma opção: ")
                            match escolha_coluna:
                                case "1":
                                    select_nome_prato()
                                    break
                                case "2":
                                    select_descricao_prato()
                                    break
                                case "3":
                                    select_valor_prato()
                                    break
                                case "4":
                                    select_disponibilidade_prato()
                                    break
                                case "5":
                                    print("Sair")
                                    break
                                case _:
                                    print("Opção inválida. Tente novamente. \n")
                                    break
                        break
                    case "5":
                       select_usos()
                       break
                    case "6":
                       select_vendas()
                       break
                break
            case "3":
                print("Selecionar Views")
                print("1 - Visualizar a visão de detalhes das vendas")
                print("2 - Visualizar a visão vendas por clientes")
                print("3 - Visualizar a visão de vendas por dia")
                escolha_view = input("Escolha uma opção: ")
                match escolha_view:
                    case "1":
                        view_detalhes_venda()
                        break
                    case "2":
                        view_vendas_por_cliente()
                        break
                    case "3":
                        view_vendas_por_dia()
                        break
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
                    case "Y": 
                        delete_database()
                        break
                    case "N": 
                        break
                break
            case "6":
                print("Sair")
                exit()
                break
            case _:
                print("Opção inválida. Tente novamente. \n")
                break
    

if __name__ == "__main__":
    main()