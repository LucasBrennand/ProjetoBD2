# ProjetoBD2
Este projeto é um sistema de gerenciamento de restaurante, desenvolvido em Python e MySQL. O objetivo é fornecer uma ferramenta para gerenciar as vendas, estoque e informações dos pratos e clientes.

<h2>Estrutura do Código</h2>
O código está organizado em diferentes módulos, cada um com uma função específica:

<ul>
    <li>_main.py_: é o ponto de entrada do programa, onde são chamadas as funções principais.
</li>
    <li>_inserts.py_: contém funções para inserir dados no banco de dados.
</li>
    <li>_selects.py_: contém funções para selecionar dados do banco de dados.
</li>
    <li>_procedures.py_: contém funções para executar procedimentos no banco de dados.
</li>
    <li>_views.py_: contém funções para criar e gerenciar views no banco de dados.
</li>
    <li>_createDB.py_: contém funções para criar o banco de dados e suas tabelas.
</li>
    <li>_deleteDB.py_: contém funções para deletar o banco de dados e suas tabelas.
</li>
    <li>_conector.py_: contém funções para conectar ao banco de dados.
</li>
</ul>

<h2>Opções no Main</h2>
No arquivo main.py, há várias opções que podem ser executadas:
<ul>
    <li>main(): é a função principal que chama as outras funções.</li>
    <li>inserts(): chama as funções de inserção de dados.</li>
    <li>selects(): chama as funções de seleção de dados.</li>
    <li>procedures(): chama as funções de procedimentos.</li>
    <li>views(): chama as funções de criação e gerenciamento de views.</li>
    <li>createDB(): chama as funções de criação do banco de dados.</li>
    <li>deleteDB(): chama as funções de deleção do banco de dados.</li>
</ul>

<h2>Banco de Dados</h2>
O banco de dados é criado com as seguintes tabelas:

<ul>
    <li>prato: contém informações sobre os pratos, como nome, descrição, valor e disponibilidade.</li>
    <li>ingrediente: contém informações sobre os ingredientes, como nome, data de validade e quantidade.</li>
    <li>usos: contém informações sobre os usos dos ingredientes nos pratos.</li>
    <li>vendas: contém informações sobre as vendas, como data, hora, valor e quantidade.</li>
    <li>cliente: contém informações sobre os clientes, como nome e pontos.</li>
</ul>

<h2>Procedimentos</h2>
Os procedimentos são usados para executar operações complexas no banco de dados, como:

<ul>
    <li>ingrediente_validade: verifica se um ingrediente está válido e atualiza a disponibilidade do prato.</li>
    <li>atualiza_estoque: atualiza o estoque dos ingredientes após uma venda.</li>
    <li>calcula_pontos: calcula os pontos do cliente após uma venda.</li>
</ul>

<h2>Views</h2>
As views são usadas para criar visões personalizadas do banco de dados, como:
<ul>
    <li>vendas_por_cliente: mostra as vendas por cliente.</li>
    <li>vendas_por_dia: mostra as vendas por dia.</li>
    <li>detalhes_vendas: mostra os detalhes das vendas.</li>
</ul>

<h2>Conclusão</h2>
Este projeto é um sistema de gerenciamento de restaurante que utiliza Python e MySQL para gerenciar as vendas, estoque e informações dos pratos e clientes. O código está organizado em diferentes módulos e há várias opções no main para executar funções específicas. O banco de dados é criado com tabelas para pratos, ingredientes, usos, vendas e clientes, e há procedimentos e views para executar operações complexas e criar visões personalizadas.
