-- Alunos: KAilane Brito e João Vitor 


--  Criando Banco
create database Estoque_do_Jojo;

-- Usando Banco
use Estoque_do_Jojo;


-- tabela Profissão

create table Cargo(
Id_Cargo int AUTO_INCREMENT primary key,
Hierarquia varchar(200),
Setor Varchar(200),
Funcao varchar(200)
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
Codigo_de_Acesso int,
Senha_de_Acesso Varchar(200),
Id_Cargo int,
foreign key (Id_Cargo) references Cargo(Id_Cargo)
);



-- Tabela Produto Vestuario
create table Produto_Vestuario(
Id_Produto_Vestuario int AUTO_INCREMENT primary key,
Nome_Produto Varchar(200),
Codigo_Produto bigint,
Id_Categoria int,
foreign key (Id_Categoria) references Categoria(Id_Categoria), 
Quantidade_Tamanho_P int,
Quantidade_Tamanho_M int,
Quantidade_Tamanho_G int,
Preco real,
Id_Usuario int,
foreign key (Id_Usuario) references Usuario(Id_Usuario)
);

-- Tabela Produto Alimenticio
create table Produto_Alimenticio(
Id_Produto int AUTO_INCREMENT primary key,
Nome_Produto_Alimenticio Varchar(200),
Codigo_Produto bigint,
KG int,
Id_Categoria int,
foreign key (Id_Categoria) references Categoria(Id_Categoria), 
Quantidade int,
Preco real,
Id_Usuario int,
foreign key (Id_Usuario) references Usuario(Id_Usuario)
);

-- Tabela Produto Eletronico
create table Produto_Eletronico(
Id_Produto_Eletronico int AUTO_INCREMENT primary key,
Nome_Produto Varchar(200),
Codigo_Produto bigint,
Peso int,
Id_Categoria int,
foreign key (Id_Categoria) references Categoria(Id_Categoria),  
Quantidade int,
Preco real,
Id_Usuario int,
foreign key (Id_Usuario) references Usuario(Id_Usuario)
);

-- tabela Historico de Acoes: Acoes relizadas nos produtos
create table Historico_de_Acoes(
Id_Historico_de_Acoes int AUTO_INCREMENT primary key,
Nome Varchar(200),
Codigo_de_Acesso int,
Modificao_ao_Produto varchar(200),
acao varchar(1000),
Data timestamp default current_timestamp
);

INSERT INTO Cargo (Hierarquia, Setor, Funcao) VALUES
('Gerente', 'Administrativo', 'Gestão de Estoque'),
('Supervisor', 'Almoxarifado', 'Controle de Produtos'),
('Analista', 'Compras', 'Solicitação de Produtos'),
('Auxiliar', 'Vendas', 'Atendimento ao Cliente'),
('Técnico', 'TI', 'Manutenção de Sistema'),
('Gerente', 'RH', 'Gestão de Pessoas'),
('Operador', 'Logística', 'Movimentação de Estoque'),
('Coordenador', 'Financeiro', 'Controle de Gastos'),
('Assistente', 'Financeiro', 'Lançamentos'),
('Estagiário', 'Administrativo', 'Apoio Geral');

INSERT INTO Categoria (Categoria) VALUES
('Camisetas'),
('Calças'),
('Sapatos'),
('Bebidas'),
('Frios'),
('Enlatados'),
('Smartphones'),
('Notebooks'),
('Acessórios'),
('Periféricos');

INSERT INTO Categoria (Categoria) VALUES
('Refrigerantes'),     
('Carnes');            



INSERT INTO Usuario (Nome_Usuario, CPF, Data_de_Nascimento, Email, Codigo_de_Acesso, Senha_de_Acesso, Id_Cargo) VALUES
('João Silva', '12345678901', '1990-01-01', 'joao@email.com', 11111111, 'senha123', 1),
('Maria Santos', '23456789012', '1985-05-15', 'maria@email.com', 22222222, 'senha123', 2),
('Carlos Souza', '34567890123', '1992-03-20', 'carlos@email.com', 33333333, 'senha123', 3),
('Ana Costa', '45678901234', '1988-07-10', 'ana@email.com', 44444444, 'senha123', 4),
('Bruno Lima', '56789012345', '1995-11-25', 'bruno@email.com', 55555555, 'senha123', 5),
('Juliana Rocha', '67890123456', '1993-02-17', 'juliana@email.com', 66666666, 'senha123', 6),
('Pedro Almeida', '78901234567', '1991-09-09', 'pedro@email.com', 77777777, 'senha123', 7),
('Renata Vieira', '89012345678', '1989-06-06', 'renata@email.com', 88888888, 'senha123', 8),
('Tiago Martins', '90123456789', '1994-12-12', 'tiago@email.com', 99999999, 'senha123', 9),
('Fernanda Lopes', '01234567890', '1996-04-04', 'fernanda@email.com', 12341234, 'senha123', 10);

INSERT INTO Produto_Vestuario (Nome_Produto, Codigo_Produto, Id_Categoria, Quantidade_Tamanho_P, Quantidade_Tamanho_M, Quantidade_Tamanho_G, Preco, Id_Usuario) VALUES
('Camiseta Preta', 1000000000001, 1, 10, 20, 15, 49.90, 1),
('Calça Jeans', 1000000000002, 2, 5, 10, 8, 89.90, 2),
('Tênis Branco', 1000000000003, 3, 4, 6, 10, 129.90, 3),
('Camiseta Branca', 1000000000004, 1, 12, 15, 10, 39.90, 4),
('Calça Social', 1000000000005, 2, 6, 9, 11, 99.90, 5),
('Tênis Preto', 1000000000006, 3, 7, 5, 6, 139.90, 6),
('Jaqueta Jeans', 1000000000007, 2, 3, 4, 2, 199.90, 7),
('Camisa Polo', 1000000000008, 1, 15, 18, 10, 59.90, 8),
('Bermuda', 1000000000009, 2, 8, 12, 9, 69.90, 9),
('Sandália', 1000000000010, 3, 5, 5, 5, 49.90, 10);

INSERT INTO Produto_Alimenticio (Nome_Produto_Alimenticio, Codigo_Produto, KG, Id_Categoria, Quantidade, Preco, Id_Usuario) VALUES
('Arroz Branco', 3000000000001, 5, 6, 20, 25.00, 1),
('Feijão Carioca', 3000000000002, 1, 6, 30, 7.50, 2),
('Leite Integral', 3000000000003, 1, 4, 50, 4.20, 3),
('Presunto', 3000000000004, 1, 5, 25, 9.90, 4),
('Queijo Mussarela', 3000000000005, 1, 5, 18, 12.00, 5),
('Refrigerante Cola', 3000000000006, 2, 11, 40, 6.50, 6),
('Suco de Laranja', 3000000000007, 1, 11, 35, 5.99, 7),
('Carne Moída', 3000000000008, 2, 12, 15, 29.99, 8),
('Frango Congelado', 3000000000009, 5, 12, 10, 34.90, 9),
('Macarrão Espaguete', 3000000000010, 1, 6, 60, 3.99, 10);


INSERT INTO Produto_Eletronico (Nome_Produto, Codigo_Produto, Peso, Id_Categoria, Quantidade, Preco, Id_Usuario) VALUES
('Smartphone Galaxy', 4000000000001, 500, 7, 10, 1499, 1),
('Notebook Dell', 4000000000002, 2000, 8, 5, 3200, 2),
('Mouse Gamer', 4000000000003, 200, 10, 25, 129, 3),
('Teclado Mecânico RGB', 4000000000004, 800, 10, 15, 350, 4),
('Smartwatch Fit', 4000000000005, 250, 9, 20, 399, 5),
('Headset Bluetooth', 4000000000006, 600, 9, 18, 249, 6),
('Monitor 24"', 4000000000007, 3000, 8, 12, 899, 7),
('Notebook Gamer', 4000000000008, 2500, 8, 4, 4200, 8),
('Roteador Wi-Fi 6', 4000000000009, 500, 9, 10, 299, 9),
('Webcam Full HD', 4000000000010, 300, 9, 14, 199, 10);


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
after update on Produto_eletronico
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


drop table Historico_de_Solicitacoes;

-- tabela Historico de Solicitacoes: Solicitacoes relizadas no do funcionario para o seu superior
create table Historico_de_Solicitacoes(
Id_Historico_de_Solicitacoes int AUTO_INCREMENT primary key,
Nome_Usuario Varchar(200),
Codigo_de_Acesso int,
Status_Da_Solicitacao varchar(200),
Solicitacao varchar(10000),
Data timestamp default current_timestamp
);

CREATE TABLE Solicitacoes_Pendentes (
    Id_Solicitacao INT AUTO_INCREMENT PRIMARY KEY,
    Id_Usuario INT,
    Solicitacao VARCHAR(10000),
    FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
);


--  trigger usado para criar um gatinho onde a solicitacao em pendente vai para o historico de solicitacoes o seu lider faz a aprovacao ou negacao da solcitacao
DELIMITER $$

CREATE TRIGGER after_insert_solicitacao
AFTER INSERT ON Solicitacoes_Pendentes
FOR EACH ROW
BEGIN
    DECLARE v_Nome_Usuario VARCHAR(200);
    DECLARE v_Codigo_de_Acesso INT;

-- Pegando as informações do usuário que fez a solicitação
    SELECT Nome_Usuario, Codigo_de_Acesso
    INTO v_Nome_Usuario, v_Codigo_de_Acesso
    FROM Usuario
    WHERE Id_Usuario = NEW.Id_Usuario;

-- Inserindo da tabela de histórico de solicitações
    INSERT INTO Historico_de_Solicitacoes (
        Nome_Usuario,
        Codigo_de_Acesso,
        Status_Da_Solicitacao,
        Solicitacao
    ) VALUES (
        v_Nome_Usuario,
        v_Codigo_de_Acesso,
        'Pendente',
        NEW.Solicitacao
    );
END$$

DELIMITER ;


-- tabela de avaria

CREATE TABLE Avaria_de_Produto (
    Id_Avaria INT AUTO_INCREMENT PRIMARY KEY,
    Tipo_Produto VARCHAR(50),               -- 'Vestuário', 'Alimentício', 'Eletrônico'
    Id_Produto INT,                         -- Id do produto na respectiva tabela
    Nome_Produto VARCHAR(200),
    Id_Categoria INT,
    Descricao_Avaria VARCHAR(1000),
    Quantidade_Avariada INT,
    Id_Usuario INT,
    Data_Registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (Id_Categoria) REFERENCES Categoria(Id_Categoria),
    FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario)
);

DELIMITER $$

CREATE TRIGGER after_insert_avaria
AFTER INSERT ON Avaria_de_Produto
FOR EACH ROW
BEGIN
    DECLARE v_Nome_Usuario VARCHAR(200);
    DECLARE v_Codigo_de_Acesso INT;

    -- Pega dados do usuário
    SELECT Nome_Usuario, Codigo_de_Acesso
    INTO v_Nome_Usuario, v_Codigo_de_Acesso
    FROM Usuario
    WHERE Id_Usuario = NEW.Id_Usuario;

    -- Insere na tabela de histórico de ações
    INSERT INTO Historico_de_Acoes (
        Nome,
        Codigo_de_Acesso,
        Modificao_ao_Produto,
        Acao
    ) VALUES (
        v_Nome_Usuario,
        v_Codigo_de_Acesso,
        CONCAT('Avaria registrada em produto ', NEW.Tipo_Produto),
        CONCAT('Produto: ', NEW.Nome_Produto, ' | Categoria ID: ', NEW.Id_Categoria, ' | Descrição: ', NEW.Descricao_Avaria)
    );
END$$

DELIMITER ;

-- PROCEDURE ----------------------------------------------------------------------------------------------------------------------
DELIMITER $$

create procedure Inserir_Produto_Vestuario (                                               -- inserir um novo produto vestuario 
    IN p_Nome_Produto VARCHAR(200),
    IN p_Codigo_Produto INT,
    IN p_Id_Categoria INT,
    IN p_Qtd_P INT,
    IN p_Qtd_M INT,
    IN p_Qtd_G INT,
    IN p_Preco REAL,
    IN p_Id_Usuario INT
)
begin
    insert into Produto_Vestuario (   -- Inserindo os dados na tabela
        Nome_Produto,
        Codigo_Produto,
        Id_Categoria,
        Quantidade_Tamanho_P,
        Quantidade_Tamanho_M,
        Quantidade_Tamanho_G,
        Preco,
        Id_Usuario
    ) values (
        p_Nome_Produto,
        p_Codigo_Produto,
        p_Id_Categoria,
        p_Qtd_P,
        p_Qtd_M,
        p_Qtd_G,
        p_Preco,
        p_Id_Usuario
    );
END$$

DELIMITER ;

--  Exemplo de um inserção com PROCEDURE __ CALL Inserir_Produto_Vestuario('Camiseta Estampada', 1234567890123, 1, 10, 20, 15, 59.99, 1 );


DELIMITER $$                                                                                

create procedure Inserir_Produto_Alimenticio(                                                     -- Inserir produto alimenticio 
    IN p_Nome_Produto_Alimenticio VARCHAR(200),
    IN p_Codigo_Produto INT,
    IN p_KG INT,
    IN p_Id_Categoria INT,
    IN p_Quantidade INT,
    IN p_Preco REAL,
    IN p_Id_Usuario INT
)
begin
    insert into Produto_Alimenticio (
        Nome_Produto_Alimenticio,
        Codigo_Produto,
        KG,
        Id_Categoria,
        Quantidade,
        Preco,
        Id_Usuario
    ) values (
        p_Nome_Produto_Alimenticio,
        p_Codigo_Produto,
        p_KG,
        p_Id_Categoria,
        p_Quantidade,
        p_Preco,
        p_Id_Usuario
    );
END$$

DELIMITER ;

DELIMITER $$

create procedure Inserir_Produto_Eletronico(                                           -- Inserir Produto Eletronico
 IN p_Nome_Produto_Eletronico VARCHAR(200),
 IN P_Codigo_Produto INT,
 IN p_Peso INT,
 In p_id_Categoria INT,
 IN p_Quantidade INT,
 IN p_Preco INT,
 IN p_id_Usuario INT
)
begin 
     insert into Produto_eletronico(
         Nome_Produto_Eletronico,
         Codigo_Produto,
         Peso,
         Id_categoria,
         Quantidade,
         Preco,
         Id_Usuario
	  )values(
      p_Nome_Produto_Eletronico,
      p_Codigo_Produto,
      p_Peso,
      p_id_Categoria,
      p_Quantidade,
      p_Preco,
      p_id_Usuario
   );

END$$     

DELIMITER; 

DELIMITER $$

create procedure Registrar_Solicitacao (                                             -- Registrar a solicitação do funcionario 
    IN p_Id_Usuario INT, -- quem fez a solicitação
    IN p_Solicitacao TEXT  -- texto da solicitação
)
begin
     insert into Solicitacoes_Pendentes (          -- inserindo a solicitação na tabela de pendentes 
        Id_Usuario,
        Solicitacao
    ) values (
        p_Id_Usuario,
        p_Solicitacao
    );
END$$

DELIMITER ;       

 -- call Registrar_Solicitacao(1, 'Solicito reposição de camisetas tamanho M');


DELIMITER $$

create procedure Atualizar_Status_Solicitacao (                        -- Procedure para aprovar ou rejeitar a solicitação
    IN p_Id_Solicitacao INT,   -- Atualizar o status da solicitação (aprovada ou rejeitada)
    IN p_Status VARCHAR(200)
)
begin     -- atualizando o histórico com o novo status
    update Historico_de_Solicitacoes
    set Status_Da_Solicitacao = p_Status
    where Id_Historico_de_Solicitacoes = p_Id_Solicitacao;
     
    delete from Solicitacoes_Pendentes  -- Removendo a solicitação da lista de pendentes
    where Id_Solicitacao = p_Id_Solicitacao;
END$$

DELIMITER ; -- exemplo__ call Atualizar_Status_Solicitacao(1, 'Aprovada' );

DELIMITER $$

create procedure Registrar_Avaria (                                 -- Para registrar avaria 
    IN p_Tipo_Produto VARCHAR(50),
    IN p_Id_Produto INT,
    IN p_Nome_Produto VARCHAR(200),
    IN p_Id_Categoria INT,
    IN p_Descricao_Avaria VARCHAR(1000),
    IN p_Quantidade_Avariada INT,
    IN p_Id_Usuario INT
)
begin
     insert into Avaria_de_Produto (
        Tipo_Produto,
        Id_Produto,
        Nome_Produto,
        Id_Categoria,
        Descricao_Avaria,
        Quantidade_Avariada,
        Id_Usuario
    ) values (
        p_Tipo_Produto,
        p_Id_Produto,
        p_Nome_Produto,
        p_Id_Categoria,
        p_Descricao_Avaria,
        p_Quantidade_Avariada,
        p_Id_Usuario
    );
END$$

DELIMITER ;




 
 drop database Estoque_do_Jojo;
