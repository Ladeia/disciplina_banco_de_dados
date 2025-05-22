--  Criando Banco
create database Estoque_do_Jojo;

-- Usando Banco
use Estoque_do_Jojo;

-- tabela Profissão

create table Cargo(
Id_Cargo int AUTO_INCREMENT primary key,
Hierarquia varchar(200),
Setor Varchar(200),
Funcao varchar(200),

);

-- tabela Categoria
create table Categoria(
Id_Categoria int AUTO_INCREMENT primary key,
Categoria varchar(100) 
);


-- Tabela Usuario
create table Usuario(
Id_Usuario int AUTO_INCREMENT primary key,
Nome_Usuario Varchar(200),
CPF Varchar (11),
Data_de_Nascimento Date,
Email Varchar (100),
Codigo_de_Acesso int(8),
Senha_de_Acesso int(10),
Id_Cargo int,
foreign key (Id_Cargo) references Cargo(Id_Cargo)
);

-- Tabela Produto Vestuario
create table Produto_Vestuario(
Id_Produto_Vestuario int AUTO_INCREMENT primary key,
Nome_Produto Varchar(200),
Codigo_Produto int(13),
Id_Categoria int,
foreign key (Id_Categoria) references Categoria(Id_Categoria), 
Quantidade_Tamanho_P int,
Quantidade_Tamanho_M int,
Quantidade_Tamanho_G int,
Preco real,
Id_Usuario int,
foreign key (Id_Usuario) references Cargo(Id_Usuario)
);

-- Tabela Produto Alimenticio
create table Produto_Alimenticio(
Id_Produto int AUTO_INCREMENT primary key,
Nome_Produto_Alimenticio Varchar(200),
Codigo_Produto int(13),
KG int,
Id_Categoria int,
foreign key (Id_Categoria) references Categoria(Id_Categoria), 
Quantidade int,
Preco real,
Id_Usuario int,
foreign key (Id_Usuario) references Cargo(Id_Usuario)
);

-- Tabela Produto Eletronico
create table Produto_Eletronico(
Id_Produto_Eletronico int AUTO_INCREMENT primary key,
Nome_Produto Varchar(200),
Codigo_Produto int(13),
Peso int,
Id_Categoria int,
foreign key (Id_Categoria) references Categoria(Id_Categoria),  
Quantidade int,
Preco real,
Id_Usuario int,
foreign key (Id_Usuario) references Cargo(Id_Usuario)
);

-- tabela Historico de Acoes: Acoes relizadas nos produtos
create table Historico_de_Acoes(
Id_Historico_de_Acoes int AUTO_INCREMENT primary key,
Nome Varchar(200),
Codigo_de_Acesso int(8),
Modificao_ao_Produto varchar(200),
acao varchar(1000),
Data timestamp default current_timestamp
);

-- trigger usado para criar um gatinho no sistema onde no meu codigo se aplica em caso o usuario realizar X acao vai salva que acao ele realizou no sitema e de que produto se trata


    																			-- tabela vestuario  ----------------------------------------------------------------------------------------- 
												-- inserir									
create trigger after_insert_produto_vestuario
after insert on Produto_Vestuario
for each row
begin
	insert into Historico_de_Acoes (Nome_Usuario, Codigo_de_Acesso, Modificao_ao_Produto, Acao)
    select U.Nome, U.Codigo_de_Acesso, 'Inseriu um novo produto de vestuario', NEW.Nome_Produto
    from Usuario U
    where U.Id_Usuario = NEW.Id_Usuario
    end$$
    DELIMITER ;
    
												-- Editar
create trigger after_update_produto_vestuario
after update on Produto_Vestuario
for each row
begin
	insert into Historico_de_Acoes (Nome_Usuario, Codigo_de_Acesso, Modificao_ao_Produto, Acao)
    select U.Nome, U.Codigo_de_Acesso, 'Atualizou um produto de vestuario', NEW.Nome_Produto
    from Usuario U
    where U.Id_Usuario = NEW.Id_Usuario
    end$$
    DELIMITER ;
    
												-- Excluir
create trigger after_delete_produto_vestuario
after delete on Produto_Vestuario
for each row
begin
	insert into Historico_de_Acoes (Nome_Usuario, Codigo_de_Acesso, Modificao_ao_Produto, Acao)
    select U.Nome, U.Codigo_de_Acesso, 'Deletou um produto de vestuario', NEW.Nome_Produto
    from Usuario U
    where U.Id_Usuario = NEW.Id_Usuario
    end$$
    DELIMITER ;
    
    																			-- tabela Alimenticio  ---------------------------------------------------------------------------------------
												-- inserir
create trigger after_insert_produto_alimenticio
after insert on Produto_Alimenticio
for each row
begin
	insert into Historico_de_Acoes (Nome_Usuario, Codigo_de_Acesso, Modificao_ao_Produto, Acao)
    select U.Nome, U.Codigo_de_Acesso, 'Inseriu um novo produto alimenticio', NEW.Nome_Produto
    from Usuario U
    where U.Id_Usuario = NEW.Id_Usuario
    end$$
    DELIMITER ;
    
												-- Editar
create trigger after_update_produto_alimenticio
after update on Produto_Alimenticio
for each row
begin
	insert into Historico_de_Acoes (Nome_Usuario, Codigo_de_Acesso, Modificao_ao_Produto, Acao)
    select U.Nome, U.Codigo_de_Acesso, 'Atualizou um produto alimenticio', NEW.Nome_Produto
    from Usuario U
    where U.Id_Usuario = NEW.Id_Usuario
    end$$
    DELIMITER ;
    
												-- Excluir
create trigger after_delete_produto_alimenticio
after delete on Produto_Alimenticio
for each row
begin
	insert into Historico_de_Acoes (Nome_Usuario, Codigo_de_Acesso, Modificao_ao_Produto, Acao)
    select U.Nome, U.Codigo_de_Acesso, 'Deletou um produto alimenticio', NEW.Nome_Produto
    from Usuario U
    where U.Id_Usuario = NEW.Id_Usuario
    end$$
    DELIMITER ;
    
       																			-- tabela Eletronico  ---------------------------------------------------------------------------------------
												-- inserir
create trigger after_insert_produto_eletronico
after insert on Produto_Eletronico
for each row
begin
	insert into Historico_de_Acoes (Nome_Usuario, Codigo_de_Acesso, Modificao_ao_Produto, Acao)
    select U.Nome, U.Codigo_de_Acesso, 'Inseriu um novo produto Eletronico', NEW.Nome_Produto
    from Usuario U
    where U.Id_Usuario = NEW.Id_Usuario
    end$$
    DELIMITER ;
    
												-- Editar
create trigger after_update_produto_eletronico
after update on Produto_letronico
for each row
begin
	insert into Historico_de_Acoes (Nome_Usuario, Codigo_de_Acesso, Modificao_ao_Produto, Acao)
    select U.Nome, U.Codigo_de_Acesso, 'Atualizou um produto Eletronico', NEW.Nome_Produto
    from Usuario U
    where U.Id_Usuario = NEW.Id_Usuario
    end$$
    DELIMITER ;
    
												-- Excluir
create trigger after_delete_produto_eletronico
after delete on Produto_Eletronico
for each row
begin
	insert into Historico_de_Acoes (Nome_Usuario, Codigo_de_Acesso, Modificao_ao_Produto, Acao)
    select U.Nome, U.Codigo_de_Acesso, 'Deletou um produto Eletronico', NEW.Nome_Produto
    from Usuario U
    where U.Id_Usuario = NEW.Id_Usuario
    end$$
    DELIMITER ;

-- drop database Estoque_do_Jojo;
