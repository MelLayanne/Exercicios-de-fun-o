# Exercicios-de-fun-o

--Função de String

CREATE TABLE nomes (
    nome VARCHAR(50)
);

INSERT INTO nomes (nome) VALUES
    ('Roberta'),
    ('Roberto'),
    ('Maria Clara'),
    ('João');

SELECT UPPER(nome) FROM nomes;

SELECT nome, LENGTH(nome) AS tam_nome FROM nomes;

SELECT
    CASE
        WHEN RIGHT(nome, 1) = 'o' THEN CONCAT('Sr. ', nome)
        ELSE CONCAT('Sra. ', nome)
    END AS nome_modificado
FROM nomes;

--2. Funções Numéricas:
CREATE TABLE produtos (
    produto VARCHAR(50),
    preco DECIMAL(10, 2),
    quantidade INT
);

INSERT INTO produtos (produto, preco, quantidade) VALUES
    ('Capinha', 9.997, 7),
    ('toalha', 49.999, 3),
    ('sapato', 99.998, 0);

SELECT produto, ROUND(preco, 2) AS preco_novo FROM produtos;

SELECT produto, ABS(quantidade) AS quantidade_abs FROM produtos;

SELECT AVG(preco) AS mediapreco FROM produtos;

