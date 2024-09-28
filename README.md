# Desafio Delphi | WK Technology

[Teste Delphi - 2024.pdf](https://github.com/user-attachments/files/17174157/Teste.Delphi.-.2024.pdf)

----------------------------------------------------------------------------

# - Solução proposta:

Foi desenvolvido um sistema de Gerenciamento de pedidos

Fluxograma da solução disponivel em 'src/images' 

![Diagrama de fluxo](https://github.com/user-attachments/assets/18f36b1f-801a-429f-af91-88a917213c5b)

Composto por:
- Telas de Login, 
- Cadastro de usuario, 
- Gerenciamento de Pedidos, 


Configuração

Para rodar a aplicação é necerio ter um arquivo ini ```config.ini``` configurado no mesmo diretório que o executavel

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

Banco de dados

O SGBD utilizado nesta aplicação foi o MySQL 5.7.29 

Os Scripts para criação do banco de dados com exemplo estão disponiveis em 'src/database'

Para melhor organização do projeto a dll  ```libmysql.dll``` deve estar na no diretorio do executável e caminho especidicado no arquivo ```config.ini```
