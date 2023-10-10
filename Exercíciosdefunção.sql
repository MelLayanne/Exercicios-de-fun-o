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
