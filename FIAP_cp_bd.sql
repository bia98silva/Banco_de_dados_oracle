CREATE TABLE Produtos (
    id_produto NUMBER(5) not null,
    nome_produto VARCHAR(100) not null ,
    preco DECIMAL(10, 2) not null ,
    quantidade_estoque INT 
);

ALTER TABLE Produtos ADD CONSTRAINT pk_produtos PRIMARY KEY ( id_produto);
ALTER TABLE Produtos ADD  descricao Varchar(100);

CREATE TABLE Clientes (
    id_cliente number(5) not null,
    nome_cliente VARCHAR2(100) not null,
    endereco VARCHAR2(255),
    email VARCHAR2(100) not null,
    telefone VARCHAR2(20)
);

ALTER TABLE Clientes ADD CONSTRAINT pk_Clientes PRIMARY KEY ( id_cliente);
ALTER TABLE Clientes ADD CONSTRAINT Clientes UNIQUE (email);
ALTER TABLE Clientes MODIFY telefone VARCHAR2(10);

CREATE TABLE Pedidos (
    id_pedido number(5) not null,
    id_cliente number(5) not null ,
    data_pedido DATE not null,
    status_pedido VARCHAR2(50) not null
    
);

ALTER TABLE Pedidos ADD CONSTRAINT pk_Pedidos PRIMARY KEY ( id_pedido);
ALTER TABLE Pedidos ADD CONSTRAINT fk_Pedidos_Clientes FOREIGN KEY ( id_cliente ) REFERENCES Clientes(id_Cliente);

CREATE TABLE Descontos (
    id_desconto NUMBER(5),
    nome_desconto VARCHAR2(100),
    tipo_desconto VARCHAR2(50),
    valor_desconto DECIMAL(10, 2),
    data_inicio DATE,
    data_fim DATE
);

ALTER TABLE Descontos ADD CONSTRAINT pk_Descontos PRIMARY KEY (id_desconto);
ALTER TABLE Descontos ADD CONSTRAINT ck_Descontos_data_inicio CHECK (data_inicio <= data_fim);
ALTER TABLE Descontos ADD CONSTRAINT ck_Descontos_data_fim CHECK (data_fim >= data_inicio);
ALTER TABLE Descontos ADD CONSTRAINT un_Descontos_nome UNIQUE (nome_desconto);
ALTER TABLE Descontos RENAME COLUMN nome_desconto TO nome_promocao;


CREATE TABLE ItensPedido (
    id_item NUMBER(5) NOT NULL,
    id_pedido NUMBER(5) NOT NULL,
    id_produto NUMBER(5) NOT NULL,
    quantidade NUMBER(10) NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL
    
);
ALTER TABLE ItensPedido ADD CONSTRAINT fk_ItensPedido_Pedidos FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido);
ALTER TABLE ItensPedido ADD CONSTRAINT fk_ItensPedido_Produtos FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto);

