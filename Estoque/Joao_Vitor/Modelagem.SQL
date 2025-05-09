--  Criando Banco
create database Estoque_do_Jojo;

-- Usando Banco
use Estoque_do_Jojo;

-- Tabela Usuario
create table Usuario(
Id_Usuario INT primary key,
Nome Varchar(200),
CPF Varchar (11),
Data_de_Nascimento Date,
Email Varchar (100),
Codigo_de_Acesso int(7),
Senha_de_Acesso int(8)
);

-- Tabela Produto Vestuario
create table Produto_Vestuario(
Id_Produto_Vestuario INT primary key,
Nome_Produto Varchar(200),
Codigo_Produto int(13),
Categoria varchar(100),
Quantidade_Tamanho_P int,
Quantidade_Tamanho_M int,
Quantidade_Tamanho_G int,
Preco real
);

-- Tabela Produto Alimenticio
create table Produto_Alimenticio(
Id_Produto INT primary key,
Nome_Produto_Alimenticio Varchar(200),
Codigo_Produto int(13),
Categoria varchar(100),
KG int,
Quantidade int,
Preco real
);

-- Tabela Produto Eletronico
create table Produto_Eletronico(
Id_Produto_Eletronico INT primary key,
Nome_Produto Varchar(200),
Codigo_Produto int(13),
Categoria varchar(100),
Peso int,
Quantidade int,
Preco real
);

-- tabela Profissão

create table Profissao(
Id_Profisaao int AUTO_INCREMENT primary key,
Setor Varchar(200),
Funcao varchar(200)
);




