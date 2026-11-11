# 🏥 Banco de Dados - Farmácia Segura (farmacia_seg)

Este projeto contém um script SQL projetado para criar e gerenciar o banco de dados de uma farmácia (`farmacia_seg`). Além de estruturar as tabelas e dados iniciais, o script tem um forte foco em **DCL (Data Control Language)**, demonstrando práticas de **segurança de dados** e **controle de acesso** baseado em perfis no MySQL.

## 📋 Estrutura do Banco de Dados

O banco de dados possui duas tabelas principais, separadas por nível de confidencialidade:

1. **`produto`** (Catálogo)
   * **Campos:** `id`, `nome`, `preco`, `estoque`.
   * **Confidencialidade:** Baixa. Informação pública para todos os funcionários.

2. **`funcionario`** (Recursos Humanos)
   * **Campos:** `id`, `nome`, `cargo`, `salario`.
   * **Confidencialidade:** Alta. Contém dados sensíveis (como o `salario`), exigindo restrição de acesso rigorosa.

## 🔐 Perfis de Acesso e Permissões (Grants)

O script cria dois usuários com diferentes níveis de privilégios para garantir a segurança da informação:

### 👤 Perfil: Atendente (Ex: Luiz)
* **Usuário:** `'atendente'@'localhost'`
* **Acesso:** Restrito.
* **Permissões:** Apenas leitura (`SELECT`).
* **Escopo:** Apenas a tabela `farmacia_seg.produto`. O atendente não consegue visualizar dados de funcionários.

### 👨‍💼 Perfil: Gerente (Ex: Davi Cerimonial)
* **Usuário:** `'gerente'@'localhost'`
* **Acesso:** Amplo.
* **Permissões Iniciais:** Leitura (`SELECT`), Inserção (`INSERT`) e Atualização (`UPDATE`).
* **Escopo:** Todo o banco de dados `farmacia_seg.*` (todas as tabelas).

## ⚙️ Administração e Segurança de Usuários (DCL)

O script também demonstra operações essenciais para o dia a dia de um Administrador de Banco de Dados (DBA) ou responsável pela segurança:

* **Revogação de Permissões (`REVOKE`):** 
  Retira privilégios específicos previamente concedidos. *Exemplo no script: Remove a permissão de `UPDATE` do gerente.*
  
* **Alteração de Senha (`ALTER USER`):** 
  Redefine a senha de um usuário de forma segura. *Exemplo no script: Troca a senha do gerente para `nova@2026`.*
  
* **Bloqueio Temporário (`ACCOUNT LOCK / UNLOCK`):** 
  Suspende temporariamente o acesso de um usuário sem excluí-lo do banco de dados (útil para férias, licenças ou investigações). *Exemplo no script: Bloqueia e desbloqueia o atendente.*
  
* **Exclusão de Usuário (`DROP USER`):** 
  Remove definitivamente o usuário e todos os seus acessos do servidor MySQL. *Exemplo no script: Apaga o usuário do gerente.*

## 🚀 Como Executar

1. É necessário ter um servidor MySQL ou MariaDB instalado e rodando.
2. Acesse o seu SGBD (MySQL Workbench, DBeaver, DBeaver, terminal, etc.) utilizando o usuário **`root`** (ou outro com privilégios de administrador).
3. Execute o script passo a passo, observando as mensagens de sucesso de cada instrução.
4. Para testar a segurança, tente logar com o usuário `atendente` usando a senha `atend@2026` e tente fazer um `SELECT` na tabela de funcionários (o acesso deve ser negado).

## 🛠️ Comandos de Auditoria Integrados

* `SELECT user, host FROM mysql.user;` - Lista todos os usuários cadastrados no SGBD.
* `SELECT current_user();` - Mostra com qual usuário e host você está logado no momento.
* `SHOW GRANTS FOR 'usuario'@'localhost';` - Exibe os privilégios exatos concedidos a uma conta específica.
