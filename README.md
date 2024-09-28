# Desafio Delphi | WK Technology

[Teste Delphi - 2024.pdf](https://github.com/user-attachments/files/17174157/Teste.Delphi.-.2024.pdf)

----------------------------------------------------------------------------

# - Solução proposta:

Foi desenvolvido um sistema de Gerenciamento de pedidos

Fluxograma da solução disponivel em 'src/images' 

![Diagrama de fluxo](https://github.com/user-attachments/assets/0f90d9f2-8c53-4c8c-8e3c-99701a62cbc3)

## Composto por:
- Telas de Login, 
- Cadastro de usuario, 
- Controle de Pedidos, 

## Configuração

Para rodar a aplicação é necessário ter um arquivo ini ```config.ini``` configurado no mesmo diretório que o executavel

Exemplo:

```
[ACCESS]
DATABASE = db_wktechnology
USERNAME = root
SERVER = localhost
PORT = 3306
PASSWORD = root
PATH_DLL = C:\libmysql.dll 

```

Para melhor organização do projeto a dll  ```libmysql.dll``` deve estar no diretorio do executável e o caminho especificado no arquivo ```config.ini```

Se algum erro de configuração for encontrado será exibida a mensagem abaixo:

![001](https://github.com/user-attachments/assets/736f3181-6b02-4045-ada2-764296b9b6c5)

### Banco de dados

O SGBD utilizado nesta aplicação foi o MySQL 5.7.29 

Os Scripts para criação do banco de dados com exemplo estão disponiveis em 'src/database'


## Orientações de utilização:

Após o login na tela de Controle de Pedidos ao digitar o código do cliente é realizado uma pesquisa e listados todos os pedidos caso houver, e será habilitado o botão 'Inserir novo pedido'

![003](https://github.com/user-attachments/assets/2dc17d6b-698f-4a92-91bd-9f8ebc9bb9ba)


Caso nada for digitado neste campo será apresentado a mensagem:

![002](https://github.com/user-attachments/assets/17916010-02a0-4bb3-a79f-948c22dadf72)



E o Usuario poderá efetuar a pesquisa pelo código do pedido

![007](https://github.com/user-attachments/assets/71999dbe-aeef-4977-b9e4-2518b9e51b6f)




