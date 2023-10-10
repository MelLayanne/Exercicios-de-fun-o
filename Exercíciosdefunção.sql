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

--3. Funções de Data:

CREATE TABLE eventos (
  data_evento DATE
);

INSERT INTO eventos (data_evento) VALUES
    ('2006-06-29 '),
    ('2005-07-24 ');

INSERT INTO eventos (data_evento)
VALUES (NOW());


SELECT DATEDIFF('2006-06-29', '2005-07-24') AS diasdatas;


SELECT DAYNAME(data_evento) AS diasemana
FROM eventos;

--4. Funções de Controle de Fluxo:

SELECT
    produto,
    quantidade,
    IF(quantidade > 0, 'Em estoque', 'Fora de estoque') AS estoque
FROM produtos;

SELECT
    produto,
    CASE
        WHEN preco < 20 THEN 'Barato'
        WHEN preco >= 20 AND preco <= 50 THEN 'Médio'
        ELSE 'Caro'
    END AS catpreco
FROM produtos;






