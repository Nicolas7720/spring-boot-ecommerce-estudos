CREATE TABLE cliente(
    id VARCHAR(36) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE categoria(
    id VARCHAR(36) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL

);
CREATE TABLE endereco(
    id VARCHAR(36) PRIMARY KEY,
    rua VARCHAR(255) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(25) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    cliente_id VARCHAR(36) NOT NULL,

    FOREIGN KEY (cliente_id)
        REFERENCES cliente(id)

);
CREATE TABLE pedido(
    id VARCHAR(36) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    categoria_id VARCHAR(36) NOT NULL,

    FOREIGN KEY (categoria_id)
        REFERENCES categoria(id)
);
CREATE TABLE produto(
    id VARCHAR(36) PRIMARY KEY,
    data_pedido DATETIME,
    status VARCHAR(200) NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,

    cliente_id VARCHAR(36) NOT NULL,

    FOREIGN KEY (cliente_id)
        REFERENCES cliente(id)

);

CREATE TABLE item_pedido(
    id VARCHAR(36) PRIMARY KEY,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    pedido_id VARCHAR(36) NOT NULL,
    produto_id VARCHAR(36) NOT NULL,

    FOREIGN KEY (pedido_id)
        REFERENCES pedido(id),

    FOREIGN KEY (produto_id)
        REFERENCES produto(id)
);