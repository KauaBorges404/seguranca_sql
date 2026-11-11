-- Banco da farmácia (rode como root)
CREATE DATABASE farmacia_seg;
USE farmacia_seg;
-- Produtos: todos os funcionários podem ver
CREATE TABLE produto (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
preco DECIMAL(7,2) NOT NULL,
estoque INT NOT NULL
);
-- Funcionários: tem salário, é dado sensível
CREATE TABLE funcionario (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
cargo VARCHAR(30) NOT NULL,
salario DECIMAL(8,2) NOT NULL
);
INSERT INTO produto (nome, preco, estoque) VALUES
  ('Dipirona 500mg', 12.90, 40),
  ('Protetor solar FPS 50', 59.90, 15),
  ('Vitamina C', 24.50, 30),
  ('Álcool em gel', 9.90, 60),
  ('Termômetro digital', 34.00, 8);
 
INSERT INTO funcionario (nome, cargo, salario) VALUES
  ('Renata Lopes', 'Gerente', 6200.00),
  ('Caio Mendes', 'Atendente', 2300.00),
  ('Paula Reis', 'Farmacêutica', 5100.00);
  
  select * from funcionario;
  select * from produto;
  
  -- Verificação de quem está conectado nesse servidor 
  select user, host from mysql.user;
  
  -- Quem sou eu ?
  select current_user();
  
  -- Vamos criar o acesso do atendente Luiz 
  create user 'atendente'@'localhost'
  identified by 'atend@2026';
  
  -- Oque o Luiz consegue fazer ?
  show grants for 'atendente'@'localhost';
  
  -- vamos adicionar algumas permissões para o luiz 
  grant select on farmacia_seg.produto
  to 'atendente'@'localhost';
  
  -- Criar o acesso do Gerente Davi Cerimonial
  create user 'gerente'@'localhost'
  identified by 'geren@2026';
  
  grant select,insert,update 
  on farmacia_seg.*
  to 'gerente'@'localhost';
  
  -- verificar as permissões 
  show grants for 'gerente'@'localhost';
  
  -- Tirar privilegio
  revoke update on farmacia_seg.*
  from 'gerente'@'localhost';

-- trocar senha
alter user 'gerente'@'localhost'
identified by 'nova@2026';

-- bloquear sem apagar 
alter user 'atendente'@'localhost' account lock;

-- voltou
alter user 'atendente'@'localhost' account unlock;

-- Apagar usuario davi 
drop user 'gerente'@'localhost';