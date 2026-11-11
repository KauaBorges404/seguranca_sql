# Projeto: Banco de Dados - Farmácia Segura (farmacia_seg)

Este projeto contém um script SQL inicial para a criação e gerenciamento do banco de dados de uma farmácia (`farmacia_seg`). O foco principal do script, além de estruturar os dados, é demonstrar a aplicação de **segurança de dados** e **controle de acesso** baseado em perfis de usuários no MySQL.

## 📋 Estrutura do Banco de Dados

O banco de dados é composto por duas tabelas principais:

1. **`produto`**: Armazena o catálogo da farmácia.
   * **Campos:** `id`, `nome`, `preco`, `estoque`.
   * **Nível de Acesso:** Informação pública para todos os funcionários da farmácia.
   
2. **`funcionario`**: Armazena as informações do quadro de funcionários.
   * **Campos:** `id`, `nome`, `cargo`, `salario`.
   * **Nível de Acesso:** Restrito. Contém **dados sensíveis** (salário), não devendo ser acessado por qualquer usuário.

## 🔐 Controle de Acesso e Permissões (Grants)

O script cria dois perfis de usuários com diferentes níveis de privilégios para garantir a segurança da informação:

### 1. Perfil: Atendente
* **Usuário:** `atendente` (ex: Luiz)
* **Permissões:** Acesso restrito apenas para leitura (`SELECT`).
* **Escopo:** Apenas a tabela `produto`.
* **Objetivo:** Garantir que o atendente possa consultar preços e estoque, mas sem acesso à tabela de funcionários ou permissão para alterar dados.

### 2. Perfil: Gerente
* **Usuário:** `gerente` (ex: Davi Cerimonial)
* **Permissões:** Leitura (`SELECT`), Inserção (`INSERT`) e Atualização (`UPDATE`).
* **Escopo:** Todo o banco de dados `farmacia_seg` (todas as tabelas).
* **Objetivo:** Permitir que a gerência atualize estoques, cadastre novos produtos e visualize ou altere informações da equipe.

## 🚀 Como Executar

1. É necessário ter um servidor MySQL (ou MariaDB) instalado.
2. Acesse o seu SGBD (ex: MySQL Workbench, DBeaver, ou via terminal) com um usuário administrador (**ROOT**).
   * *Atenção: A criação de usuários e atribuição de permissões exige privilégios administrativos.*
3. Copie o conteúdo do script SQL fornecido.
4. Execute o script na íntegra para criar a base, inserir os dados de teste e configurar os usuários.
5. Para testar a segurança, faça logout do root e tente conectar com os usuários criados (`atendente` e `gerente`) usando suas respectivas senhas.

## 🛠️ Comandos de Verificação Úteis
O script inclui comandos práticos de auditoria e verificação no final:
* `select user, host from mysql.user;` - Lista os usuários cadastrados no servidor.
* `select current_user();` - Mostra qual usuário está logado no momento.
* `show grants for 'usuario'@'localhost';` - Exibe as permissões ativas de um usuário específico.
