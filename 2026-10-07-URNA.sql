-- 
-- -- -- -- -- -- -- -- 07/10/26 -- -- -- -- -- 
-- -- Sistema de Urna --
-- 
-- 
-- SET FOREIGN_KEY_CHECKS = 0;
-- 
-- DROP TABLE IF EXISTS resultados;
-- DROP TABLE IF EXISTS votos;
-- DROP TABLE IF EXISTS eleitores;
-- DROP TABLE IF EXISTS candidatos;
-- DROP TABLE IF EXISTS secoes;
-- DROP TABLE IF EXISTS zonas;
-- DROP TABLE IF EXISTS eleicoes;
-- DROP TABLE IF EXISTS localidades;
-- DROP TABLE IF EXISTS cargos;
-- DROP TABLE IF EXISTS partidos;
-- 
-- SET FOREIGN_KEY_CHECKS = 1;
-- 
-- -- \\\ PARTIDOS ///
-- 
-- CREATE TABLE partidos (
--     id         INT             PRIMARY KEY AUTO_INCREMENT,
--     nome     VARCHAR(40) NOT NULL UNIQUE,
--     sigla     VARCHAR(12) NOT NULL UNIQUE,
--     numero     CHAR(2)         NOT NULL UNIQUE
-- );
-- 
-- 
-- -- \\\ CARGOS ///
-- 
-- CREATE TABLE cargos (
--     id                         INT             PRIMARY KEY AUTO_INCREMENT,
--     nome_cargo             VARCHAR(40) NOT NULL UNIQUE,
--     quantidade_digitos     INT             NOT NULL
-- );
-- 
-- 
-- -- \\\ LOCALIDADES ///
-- 
-- CREATE TABLE localidades (
--     id         INT             PRIMARY KEY AUTO_INCREMENT,
--     uf         CHAR(2)         NOT NULL,
--     cidade     VARCHAR(60) NOT NULL,
--     regiao     VARCHAR(20) NOT NULL
-- );
-- 
-- 
-- -- \\\ ELEIÇÕES ///
-- 
-- CREATE TABLE eleicoes (
--     id         INT             PRIMARY KEY AUTO_INCREMENT,
--     ano         INT             NOT NULL,
--     tipo     VARCHAR(30) NOT NULL
-- );
-- 
-- 
-- -- \\\ ZONAS ///
-- 
-- CREATE TABLE zonas (
--     id                     INT PRIMARY KEY AUTO_INCREMENT,
--     numero                 INT NOT NULL,
--     localidade_id     INT NOT NULL,
-- 
--     FOREIGN KEY (localidade_id) REFERENCES localidades(id)
-- );
-- 
-- 
-- -- \\\ SEÇÕES ///
-- 
-- CREATE TABLE secoes (
--     id             INT PRIMARY KEY AUTO_INCREMENT,
--     numero         INT NOT NULL,
--     zona_id     INT NOT NULL,
-- 
--     FOREIGN KEY (zona_id) REFERENCES zonas(id)
-- );
-- 
-- 
-- -- \\\ CANDIDATOS ///
-- 
-- CREATE TABLE candidatos (
--     id                 INT             PRIMARY KEY AUTO_INCREMENT,
--     nome             VARCHAR(70) NOT NULL,
--     numero             VARCHAR(12) NOT NULL,
--     partido_id     INT             NOT NULL,
--     cargo_id         INT             NOT NULL,
-- 
--     FOREIGN KEY (partido_id) REFERENCES partidos(id),
--     FOREIGN KEY (cargo_id) REFERENCES cargos(id)
-- );
-- 
-- 
-- -- \\\ ELEITORES ///
-- 
-- CREATE TABLE eleitores (
--     id                     INT             PRIMARY KEY AUTO_INCREMENT,
--     nome                 VARCHAR(70) NOT NULL,
--     cpf                     CHAR(11)     NOT NULL UNIQUE,
--     titulo                 CHAR(12)     NOT NULL UNIQUE,
--     data_nascimento  DATE             NOT NULL,
--     secao_id             INT             NOT NULL,
--     votou                 BOOLEAN         NOT NULL DEFAULT FALSE,
-- 
--     FOREIGN KEY (secao_id) REFERENCES secoes(id)
-- );
-- 
-- 
-- -- \\\ VOTOS ///
-- 
-- CREATE TABLE votos (
--     id                             INT PRIMARY KEY AUTO_INCREMENT,
--     eleicao_id                 INT NOT NULL,
--     candidato_id                 INT NOT NULL,
--     localidade_id             INT NOT NULL,
--     quantidade_votos         INT NOT NULL,
-- 
--     FOREIGN KEY (eleicao_id) REFERENCES eleicoes(id),
--     FOREIGN KEY (candidato_id) REFERENCES candidatos(id),
--     FOREIGN KEY (localidade_id) REFERENCES localidades(id)
-- );
-- 
-- 
-- -- \\\ RESULTADOS ///
-- 
-- CREATE TABLE resultados (
--     id                      INT PRIMARY KEY AUTO_INCREMENT,
--     eleicao_id          INT NOT NULL,
--     cargo_id              INT NOT NULL,
--     localidade_id      INT NOT NULL,
--     votos_validos      INT NOT NULL,
--     votos_brancos      INT NOT NULL,
--     votos_nulos          INT NOT NULL,
--     votos_invalidados INT NOT NULL,
-- 
--     FOREIGN KEY (eleicao_id) REFERENCES eleicoes(id),
--     FOREIGN KEY (cargo_id) REFERENCES cargos(id),
--     FOREIGN KEY (localidade_id) REFERENCES localidades(id)
-- );
-- 
-- -- =========================
-- -- TRIGGERS
-- -- =========================
-- 
-- DROP TRIGGER IF EXISTS verifica_numero_candidato;
-- DROP TRIGGER IF EXISTS verifica_quantidade_votos;
-- 
-- 
-- DELIMITER $$
-- 
-- CREATE TRIGGER verifica_numero_candidato
-- BEFORE INSERT ON candidatos
-- FOR EACH ROW
-- BEGIN
--     DECLARE qtd INT;
-- 
--     SELECT quantidade_digitos
--     INTO qtd
--     FROM cargos
--     WHERE id = NEW.cargo_id;
-- 
--     IF LENGTH(NEW.numero) <> qtd THEN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Número do candidato inválido para este cargo';
--     END IF;
-- END$$
-- 
-- DELIMITER ;
-- 
-- 
-- DELIMITER $$
-- 
-- CREATE TRIGGER verifica_quantidade_votos
-- BEFORE INSERT ON votos
-- FOR EACH ROW
-- BEGIN
--     IF NEW.quantidade_votos < 0 THEN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'A quantidade de votos não pode ser negativa';
--     END IF;
-- END$$
-- 
-- DELIMITER ;
-- 
-- 
-- -- =========================
-- -- INSERTS
-- -- =========================
-- 
-- INSERT INTO partidos (nome, sigla, numero) VALUES
-- ('Partido A', 'PA', '10'),
-- ('Partido B', 'PB', '20'),
-- ('Partido C', 'PC', '30');
-- 
-- 
-- INSERT INTO cargos (nome_cargo, quantidade_digitos) VALUES
-- ('Presidente', 2),
-- ('Governador', 2),
-- ('Senador', 3),
-- ('Deputado Federal', 4),
-- ('Deputado Estadual', 5),
-- ('Vereador', 5);
-- 
-- 
-- INSERT INTO localidades (uf, cidade, regiao) VALUES
-- ('RS', 'Novo Hamburgo', 'Sul'),
-- ('RS', 'Porto Alegre', 'Sul'),
-- ('SC', 'Florianópolis', 'Sul');
-- 
-- 
-- INSERT INTO eleicoes (ano, tipo) VALUES
-- (2026, 'Geral'),
-- (2028, 'Municipal');
-- 
-- 
-- INSERT INTO zonas (numero, localidade_id) VALUES
-- (1, 1),
-- (2, 1),
-- (3, 2),
-- (4, 3);
-- 
-- 
-- INSERT INTO secoes (numero, zona_id) VALUES
-- (1, 1),
-- (2, 1),
-- (1, 2),
-- (1, 3),
-- (1, 4);
-- 
-- 
-- INSERT INTO candidatos (nome, numero, partido_id, cargo_id) VALUES
-- ('João Silva', '10', 1, 1),
-- ('Carlos Souza', '20', 2, 1),
-- ('Pedro Santos', '30', 3, 1),
-- 
-- ('Lucas Oliveira', '11', 1, 2),
-- ('Marcos Lima', '22', 2, 2),
-- 
-- ('Ana Costa', '101', 1, 3),
-- ('Bruno Alves', '202', 2, 3),
-- 
-- ('Gabriel Rocha', '1010', 1, 4),
-- ('Felipe Gomes', '2020', 2, 4),
-- 
-- ('Rafael Dias', '12345', 1, 5),
-- ('Mateus Pereira', '23456', 2, 5),
-- 
-- ('Gustavo Martins', '11111', 1, 6),
-- ('Ricardo Fernandes', '22222', 2, 6);
-- 
-- 
-- INSERT INTO eleitores (
--     nome,
--     cpf,
--     titulo,
--     data_nascimento,
--     secao_id,
--     votou
-- ) VALUES
-- ('Guilherme Silva', '11111111111', '123456789001', '2005-06-10', 1, FALSE),
-- ('Lucas Pereira', '22222222222', '123456789002', '2004-03-15', 1, FALSE),
-- ('Mariana Costa', '33333333333', '123456789003', '2006-08-20', 2, FALSE),
-- ('João Martins', '44444444444', '123456789004', '2003-11-05', 3, FALSE),
-- ('Ana Oliveira', '55555555555', '123456789005', '2005-01-25', 4, FALSE);
-- 
-- 
-- INSERT INTO votos (
--     eleicao_id,
--     candidato_id,
--     localidade_id,
--     quantidade_votos
-- ) VALUES
-- (1, 1, 1, 150),
-- (1, 2, 1, 120),
-- (1, 3, 1, 80),
-- (1, 4, 1, 130),
-- (1, 5, 1, 100),
-- (1, 6, 1, 90),
-- (1, 7, 1, 70),
-- (1, 8, 1, 200),
-- (1, 9, 1, 150);



-- -- -- -- --

-- SET GLOBAL log_bin_trust_function_creators = 1;
-- DROPS
DROP TABLE IF EXISTS CANDIDATOS;
DROP TABLE IF EXISTS ELEITORES;
DROP TABLE IF EXISTS VOTOS; -- VAMOVÊ SE PRECISA ISSO

-- TABELA CANDIDATOS
CREATE TABLE IF NOT EXISTS CANDIDATOS (
     ID         INT             NOT NULL PRIMARY KEY AUTO_INCREMENT
    ,NUMERO     INT             NOT NULL UNIQUE
    ,NOME       VARCHAR(70)     NOT NULL 
    ,SIGLA      VARCHAR(32)     NOT NULL
    ,FOTO       BLOB                NULL
);
-- TABELA ELEITORES
CREATE TABLE IF NOT EXISTS ELEITORES (
     ID         INT             NOT NULL PRIMARY KEY AUTO_INCREMENT
    ,CPF        CHAR(11)        NOT NULL UNIQUE 
    ,NOME       VARCHAR(70)     NOT NULL
    ,DIGITAIS   BLOB                NULL
    ,VOTOU      BOOL            NOT NULL DEFAULT FALSE
);
-- TABELA VOTOS
CREATE TABLE IF NOT EXISTS VOTOS (
     ID             INT         NOT NULL PRIMARY KEY AUTO_INCREMENT
    ,NUMERO         INT         NOT NULL 
);
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- T R I G G E R S 
-- TRIGGER PARA DEFINIR SE O VOTO É VÁLIDO, BRANCO OU NULO
DROP   TRIGGER IF     EXISTS VOTOS_BEFORE_INSERT;
DELIMITER $$
CREATE TRIGGER IF NOT EXISTS VOTOS_BEFORE_INSERT
BEFORE INSERT
ON VOTOS FOR EACH ROW 
BEGIN
    SET NEW.NUMERO = IF(NEW.NUMERO='0', '1', NEW.NUMERO);
    SET @EXISTE = '0';
    SELECT '1' INTO @EXISTE FROM CANDIDATOS WHERE NUMERO=NEW.NUMERO;
    SET NEW.NUMERO = IF(@EXISTE='1', NEW.NUMERO, '2');
END $$
DELIMITER ;
-- FUNÇÕES
-- COMPUTA VOTO
DROP FUNCTION IF EXISTS VOTAR;
DELIMITER $$
CREATE FUNCTION VOTAR(PCANDIDATONUMERO INT, PELEITORCPF CHAR(11)) RETURNS VARCHAR(128) 
BEGIN
    DECLARE LCANDIDATONUMERO INT;
    DECLARE LELEITORCPF      CHAR(11);
    DECLARE LVOTOU           BOOL;
    -- VALIDAR SE O CANDIDATO EXISTE
    SELECT NUMERO INTO LCANDIDATONUMERO FROM CANDIDATOS WHERE NUMERO=PCANDIDATONUMERO;
    IF COALESCE(LCANDIDATONUMERO, 0) = 0 THEN 
        RETURN 'ESTE CANDIDATO NÃO EXISTE. VOTO NÃO COMPUTADO.';
    END IF; 
    -- VALIDAR SE O ELEITOR EXISTE
    SELECT CPF INTO LELEITORCPF FROM ELEITORES WHERE CPF=PELEITORCPF;
    IF COALESCE(LELEITORCPF, 0) = 0 THEN 
        RETURN 'ESTE ELEITOR NÃO EXISTE. VOTO NÃO COMPUTADO.';
    END IF; 
    -- VALIDAR SE O ELEITOR JÁ VOTOU
    SELECT VOTOU INTO LVOTOU FROM ELEITORES WHERE CPF=PELEITORCPF;
    IF COALESCE(LVOTOU, FALSE) = TRUE THEN 
        RETURN 'ESTE ELEITOR JÁ VOTOU. VOTO NÃO COMPUTADO.';
    END IF; 
    -- COMPUTAR O VOTO
    UPDATE ELEITORES SET VOTOU=TRUE WHERE CPF=PELEITORCPF;
    INSERT INTO VOTOS (NUMERO) VALUES (PCANDIDATONUMERO);
    RETURN 'VOTO COMPUTADO COM SUCESSO.';
END$$
DELIMITER ;
-- ENSAIOS
INSERT INTO CANDIDATOS (NUMERO, NOME, SIGLA) VALUES ('666', 'ADOLF'  , 'SS'    );
INSERT INTO CANDIDATOS (NUMERO, NOME, SIGLA) VALUES ('171', 'BENITO' , 'MUS'   );
INSERT INTO CANDIDATOS (NUMERO, NOME, SIGLA) VALUES ('266', 'MAO TSE', 'TUNG'  );
INSERT INTO CANDIDATOS (NUMERO, NOME, SIGLA) VALUES ('1'  , 'BRANCO' , 'BRANCO');
INSERT INTO CANDIDATOS (NUMERO, NOME, SIGLA) VALUES ('2'  , 'NULO'   , 'NULO'  );
INSERT INTO ELEITORES (CPF, NOME) VALUES ('12312312387', 'PAULA INSIDE');  -- 1
INSERT INTO ELEITORES (CPF, NOME) VALUES ('44556677889', 'ALAN BRADO'  );  -- 2
INSERT INTO ELEITORES (CPF, NOME) VALUES ('87875454547', 'OSCAR BELUDO');  -- 3
SELECT 
    VOTAR('87686', '12312312387') V1
   ,VOTAR('666'  , '12312312387') V21
   ,VOTAR('266'  , '12312312387') V22
   ,VOTAR('666'  , '876876') V3;
SELECT * FROM VOTOS;