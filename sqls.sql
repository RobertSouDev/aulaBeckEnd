
CREATE TABLE usuarios(
    id serial PRIMARY KEY,
    nome varchar(100) NOT NULL,
    login varchar(100) UNIQUE NOT NULL,
    senha varchar(200) NOT NULL,
    criado_em timestamp default(current_timestamp) NOT NULL,
    alterado_em timestamp default(current_timestamp) NOT NULL
);

CREATE TABLE produtos(
    id serial PRIMARY KEY,
    nome varchar(100) not null,
    descricao text,
    valor DECIMAL(10, 2) not null,
    criado_em timestamp default(current_timestamp) not null,
    alterado_em timestamp default(current_timestamp) not null
);


CREATE TABLE pedidos(
    id serial PRIMARY KEY,
    data timestamp NOT NULL,
    usuario_id integer NOT NULL,
    criado_em timestamp default(current_timestamp) not null,
    alterado_em timestamp default(current_timestamp) not null,
    FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE itens_pedidos(
    id serial PRIMARY KEY,
    produto_id integer NOT NULL,
    pedido_id integer NOT NULL,
    valor DECIMAL(10, 2) not null,
    quantidade integer NOT NULL,

    criado_em timestamp default(current_timestamp) not null,
    alterado_em timestamp default(current_timestamp) not null,

    FOREIGN KEY(produto_id) REFERENCES produtos(id),
    FOREIGN KEY(pedido_id) REFERENCES pedidos(id)
);