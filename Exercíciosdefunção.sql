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

--5. Função Personalizada

DELIMITER //

CREATE FUNCTION TOTAL_VALOR (PRECO DECIMAL(10,2), QUANTIDADE INT) 
RETURNS DECIMAL(10,2) 
DETERMINISTIC
BEGIN 
    DECLARE total_valor DECIMAL(10,2);   
    SET total_valor = PRECO * QUANTIDADE;   
    RETURN total_valor; 
END;

//

DELIMITER ;

SELECT produto, TOTAL_VALOR(preco, quantidade) AS valortotal FROM produtos;

--6. Funções de Agregação:

SELECT COUNT(*) AS totalprodutos FROM produtos;

SELECT produto, preco FROM produtos WHERE preco = (SELECT MAX(preco) FROM produtos);

SELECT produto, preco FROM produtos WHERE preco = (SELECT MIN(preco) FROM produtos);

SELECT SUM(IF(quantidade > 0, preco * quantidade, 0)) AS valoremestoque FROM produtos;

--7. Criando funções:
DELIMITER //

CREATE FUNCTION Fatorial(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE result INT DEFAULT 1;
    DECLARE m INT DEFAULT 1;
    
    WHILE m <= n DO
        SET result = result * m;
        SET m = m + 1;
    END WHILE;
    
    RETURN result;
END;

//

DELIMITER ;

SELECT Fatorial(7);
SELECT Fatorial(2);

DELIMITER //

CREATE FUNCTION Exponencial(base DECIMAL, expoente INT)
RETURNS DECIMAL
DETERMINISTIC
BEGIN
    DECLARE resultado DECIMAL DEFAULT 1;
    DECLARE num INT DEFAULT 1;
    
    WHILE num <= expoente DO
        SET resultado = resultado * base;
        SET num = num + 1;
    END WHILE;
    
    RETURN resultado;
END;

//

DELIMITER ;

SELECT Exponencial(4,8);
SELECT Exponencial(10,7);


DELIMITER //
CREATE FUNCTION Palindromo(palavra VARCHAR(255)) RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE tamanho INT;
  DECLARE pa INT;
  
  SET tamanho = LENGTH(palavra);
  SET pa = 1;
  
  WHILE pa <= tamanho/2 DO
    IF SUBSTRING(palavra, pa, 1) != SUBSTRING(palavra, tamanho - pa + 1, 1) THEN
      RETURN 0;
    END IF;
    
    SET pa = pa + 1;
  END WHILE;
  
  RETURN 1;
END;
//
DELIMITER ;

SELECT Palindromo('Escola'); 
SELECT Palindromo('Arara');





