CREATE TABLE pedido (
    vbeln          VARCHAR(10) PRIMARY KEY,
    werks          VARCHAR(4) NOT NULL,
    data_criacao   DATE NOT NULL,
    status         VARCHAR(20)
);

CREATE TABLE etapa (
    id_etapa       INT PRIMARY KEY,
    descricao      VARCHAR(40) NOT NULL,
    area           VARCHAR(20)
);

CREATE TABLE maquina (
    cod_barras     VARCHAR(20) PRIMARY KEY,
    werks          VARCHAR(4) NOT NULL,
    descricao      VARCHAR(60) NOT NULL,
    ativo          BOOLEAN NOT NULL,
    id_etapa       INT NOT NULL,

    CONSTRAINT fk_maquina_etapa
        FOREIGN KEY (id_etapa)
        REFERENCES etapa(id_etapa)
);

CREATE TABLE tracking (
    vbeln          VARCHAR(10) NOT NULL,
    id_etapa       INT NOT NULL,
    cod_barras     VARCHAR(20),
    werks          VARCHAR(4) NOT NULL,
    data_hora      TIMESTAMP NOT NULL,
    usuario        VARCHAR(12),
    status         CHAR(1) NOT NULL,

    CONSTRAINT pk_tracking
        PRIMARY KEY (vbeln, id_etapa),

    CONSTRAINT fk_tracking_pedido
        FOREIGN KEY (vbeln)
        REFERENCES pedido(vbeln),

    CONSTRAINT fk_tracking_etapa
        FOREIGN KEY (id_etapa)
        REFERENCES etapa(id_etapa),

    CONSTRAINT fk_tracking_maquina
        FOREIGN KEY (cod_barras)
        REFERENCES maquina(cod_barras)
);