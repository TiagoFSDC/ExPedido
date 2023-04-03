create database ExPedido1;

create table Cliente(
    CodCli int NOT NULL,
    NomeCli varchar(50) NOT NULL,
    CONSTRAINT PK_Cliente primary key(CodCli)
);

create table Pedido(
    NoPed int not null,
    DataPed Date NOT NULL,
    CodCli int NOT NULL,

    CONSTRAINT PK_Pedido primary key(NoPed),
    constraint FK_Pedido_Cliente foreign key(CodCli) REFERENCES Cliente(CodCli)
);


create table Pedido_Fone(
    NoPedido int NOT NULL,
    NoTel int NOT NULL,

    CONSTRAINT PK_Pedido_Fone primary key(NoPedido,NoTel),
    constraint FK_Pedido_Fone_Pedido foreign key(NoPedido) REFERENCES Pedido(NoPed)
);

create table Especificacao_Peca(
    CodPecaEsp int NOT NULL,
    descPeca int NOT NULL,

    CONSTRAINT PK_Especificacaco_Peca primary key(CodPecaEsp),
);

create table Item_Pedido(
    NPed int NOT NULL,
    CodPeca int NOT NULL,
    QuantPeca int NOT NULL,

    constraint PK_Peca primary key(NPed,CodPeca),
    constraint FK_Peca_Pedido foreign key(NPed) REFERENCES Pedido(NoPed),
    constraint FK_Item_Pedido_Esp_Peca foreign key(CodPeca) REFERENCES Especificacao_Peca(CodPecaEsp)
);