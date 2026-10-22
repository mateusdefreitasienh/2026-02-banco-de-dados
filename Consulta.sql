-- DROP TABLE IF EXISTS CLIENTES;

-- CREATE TABLE CLIENTES (
-- 	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
-- 	,NOME VARCHAR(70) NOT NULL DEFAULT ''
-- 	,CPF CHAR(11) NOT NULL DEFAULT ''
-- 	,IDADE INT NOT NULL DEFAULT '0'
-- 	,ALTURA DECIMAL(3,2) DEFAULT '0'
-- );


-- INSERT INTO CLIENTES (NOME, CPF, IDADE, ALTURA) 
-- VALUES ('MATEUS DE FREITAS', '17770459087', '27', '1.66'); 
-- 
-- INSERT INTO CLIENTES (NOME, CPF, IDADE, ALTURA) 
-- VALUES ('JOAO DE FREITAS', '27770459087', '28', '1.99'); 
-- 
-- 
-- UPDATE CLIENTES SET NOME = 'JOAO CARLOS' WHERE CPF = '27770459087';
-- 
-- DELETE FROM CLIENTES WHERE CPF = '27770459087';
-- 
-- SELECT * FROM CLIENTES;


-- TABELA CEMITERIO


-- DROP TABLE IF EXISTS CEMITERIO;
-- 
-- CREATE TABLE CEMITERIO (
-- 	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
-- 	,TIPO VARCHAR(7) NOT NULL DEFAULT ''
-- 	,LOTE VARCHAR(20) NOT NULL DEFAULT ''
-- 	,CPF CHAR(11) DEFAULT ''
-- 	,DATAMORTE DATE DEFAULT NULL
-- 	,DATANASCIMENTO DATE DEFAULT NULL
-- 	,VALORALUGUEL DECIMAL(10,2) NOT NULL DEFAULT 0.00
-- 	,NOMEMORTO VARCHAR(70) DEFAULT ''
-- );
-- 
-- 
-- INSERT INTO CEMITERIO (TIPO, LOTE, CPF, DATAMORTE, DATANASCIMENTO, VALORALUGUEL, NOMEMORTO)
-- VALUES ('TUMULO', 'L1C2', '17770459087', '2026-08-26', '2007-09-11', 100.78, 'JORGE');
-- 
-- INSERT INTO CEMITERIO (TIPO, LOTE, VALORALUGUEL)
-- VALUES ('GAVETA', 'L3G4', 100.78);
-- 
-- SELECT * FROM cemiterio;
-- 
-- -- 01/09/2026
-- 
-- DROP TABLE IF EXISTS jogadores, clubes;
-- 
-- CREATE TABLE CLUBES (
-- 	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
-- 	,NOME VARCHAR(70) NOT NULL UNIQUE
-- 	,DATACRIACAO DATE NOT NULL
-- 	,NOMEPRESIDENTE VARCHAR(70) NULL 
-- 	,ESTADIO VARCHAR(70) NULL
-- 	,VALORFOLHA DECIMAL(13,2) NOT NULL DEFAULT '0.00'
-- );
-- 
-- 
-- CREATE TABLE JOGADORES (
-- 	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
-- 	,IDCLUBE INT NULL
-- 	,NOME VARCHAR(70) NOT NULL
-- 	,SALARIO DECIMAL(10,2) NULL DEFAULT '0.0'
-- 	,DATANASCIMENTO DATE NOT NULL
-- 	,DATACONTRATACAO DATE
-- 	,FOREIGN KEY (IDCLUBE) REFERENCES clubes(ID) ON DELETE CASCADE ON UPDATE CASCADE
-- );
-- 
-- INSERT INTO CLUBES (NOME, DATACRIACAO, NOMEPRESIDENTE, ESTADIO, VALORFOLHA)
-- VALUES ('Esporte Clube Novo Hamburgo', '1911-05-01', 'Jerônimo Freitas', 'Estádio do Vale', '180000');
-- 
-- SELECT * FROM CLUBES;
-- 
-- INSERT INTO JOGADORES (IDCLUBE, NOME, SALARIO, DATANASCIMENTO, DATACONTRATACAO)
-- VALUES (1, 'Breno Boeno', '1621', '2002-04-17', '2025-04-14');
-- 
-- SELECT * FROM JOGADORES;
-- 
-- SELECT C.NOME, J.IDCLUBE, J.NOME, J.SALARIO FROM JOGADORES J INNER JOIN CLUBES C ON J.IDCLUBE = C.ID;
-- 
-- -- 02/09/2026
-- 
-- INSERT INTO clubes 
-- 	(ID, NOME, DATACRIACAO, NOMEPRESIDENTE, ESTADIO, VALORFOLHA)
-- VALUES
-- 	(NULL, 'GREMIO-GRE', '1912-03-12', 'JOAO PAULO', 'OLIMPICO', '1545678,00'),
-- 	(NULL, 'INTERNACIONAL-INT', '1908-07-11', 'MARIO CERTA', 'BEIRA RIO', '25678,00');
-- 	
-- SELECT * FROM CLUBES;
-- 
-- INSERT INTO jogadores 
-- 	(IDCLUBE, NOME, SALARIO, DATANASCIMENTO, DATACONTRATACAO)
-- VALUES 
-- 	(1, 'Breno Boeno', '1621', '2002-04-17', '2025-04-14'),
-- 	(1, 'Pedro Paulo', '33621', '2000-02-27', '2022-02-12'),
-- 	(2, 'Cesar Augusto', '4458', '2004-04-14', '2024-06-17'),
-- 	(2, 'Antonio Moraes', '12458', '1999-09-19', '2024-09-19'),
-- 	(3, 'José Carlos', '22358', '1998-08-18', '2022-09-19'),
-- 	(3, 'Calos Marques', '42358', '2003-03-13', '2023-09-19');
-- 	
-- SELECT * FROM jogadores;
-- 
-- DELETE FROM jogadores WHERE ID = 4;
-- 
-- 
-- 
-- -- 08/09/2026
-- 
-- -- limpar tabelas
-- 
-- DELETE FROM jogadores WHERE IDCLUBE IN (1, 2, 3);
-- 
-- DELETE FROM clubes WHERE 1=1;
-- 
-- SELECT * FROM clubes;
-- 
-- SELECT * FROM jogadores;
-- 
-- 
-- -- Copiar tabela basileirao
-- 
-- -- USA O SEU DATABASE
-- USE a151570; 
-- 
-- -- DELETA A TABELA TEMPORARIA TBRAS, CASO EXISTIR
-- DROP TEMPORARY TABLE IF EXISTS TBRAS; 
-- 
-- -- CRIA UMA COPIA TEMPORARIA DA TABELA DO BRASILEIRAO
-- CREATE TEMPORARY TABLE TBRAS LIKE REFERENCIAS.BRASILEIRAO2018; 
-- 
-- -- INSERE TODOS OS REGISTROS DA TABELA ORIGINAL, NA NOVA TABELA
-- INSERT INTO TBRAS SELECT * FROM REFERENCIAS.BRASILEIRAO2018; 
-- 
-- SELECT * FROM TBRAS;
-- 
-- 
-- -- SABER SE TEM ALGUMA VANTAGEM EM SER MANDANTE
-- -- QUANTOS TIMES GANHARAM SENDO MANDANTE E QUANTOS GANHARAM SENDO VISITANTE
-- 
-- SELECT COUNT(*) MANDANTEGANHOU FROM TBRAS WHERE MANDANTEGOLS > VISITANTEGOLS;
-- 
-- SELECT COUNT(*) VISITANTEGANHOU FROM TBRAS WHERE MANDANTEGOLS < VISITANTEGOLS;
-- 
-- 
-- -- VARIAVEIS DE SEÇÃO
-- SELECT COUNT(*) INTO @MANDANTEGANHOU FROM TBRAS WHERE MANDANTEGOLS > VISITANTEGOLS;
-- SELECT COUNT(*) INTO @VISITANTEGANHOU FROM TBRAS WHERE MANDANTEGOLS < VISITANTEGOLS;
-- 
-- SELECT @MANDANTEGANHOU, @VISITANTEGANHOU, (@MANDANTEGANHOU / @VISITANTEGANHOU) PROPORCAO;
-- 
-- 
-- 
-- -- 09/09/2026
-- 
-- 
-- -- SOMAR TODOS OS PONTOS
-- 
-- -- 1. Cria a tabela acumuladora
-- DROP TEMPORARY TABLE IF EXISTS TMP_PONTUACAO;
-- CREATE TEMPORARY TABLE TMP_PONTUACAO (
--     CLUBE VARCHAR(100),
--     PONTOS INT
-- );
-- 
-- -- 2. Insere os pontos dos mandantes
-- INSERT INTO TMP_PONTUACAO
-- SELECT 
--     MANDANTE,
--     CASE 
--         WHEN MANDANTEGOLS > VISITANTEGOLS THEN 3
--         WHEN MANDANTEGOLS = VISITANTEGOLS THEN 1
--         ELSE 0
--     END
-- FROM TBRAS;
-- 
-- -- 3. Insere os pontos dos visitantes
-- INSERT INTO TMP_PONTUACAO
-- SELECT 
--     VISITANTE,
--     CASE 
--         WHEN VISITANTEGOLS > MANDANTEGOLS THEN 3
--         WHEN VISITANTEGOLS = MANDANTEGOLS THEN 1
--         ELSE 0
--     END
-- FROM TBRAS;
-- 
-- -- 4. Agrupa o resultado final
-- SELECT 
--     CLUBE, 
--     SUM(PONTOS) AS TOTAL_PONTOS
-- FROM TMP_PONTUACAO
-- GROUP BY CLUBE
-- ORDER BY TOTAL_PONTOS DESC;
-- 
-- 
-- 
-- 
-- -- SELECT COM 2 ORDERBY
-- SELECT * FROM TBRAS ORDER BY MANDANTEGOLS DESC, VISITANTEGOLS ASC;
-- 
-- 
-- -- SALDO DE GOLS DO MANDANTE
-- SELECT MANDANTE, (MANDANTEGOLS - VISITANTEGOLS) AS SG FROM TBRAS ORDER BY SG DESC;
-- 
-- 
-- -- SALDO DE GOLS DO VISITANTE
-- SELECT VISITANTE, (VISITANTEGOLS - MANDANTEGOLS) AS SG FROM TBRAS ORDER BY SG DESC;
-- 
-- 
-- -- QUAIS VISITANTES QUE FIZERAM MAIOR DIFERENÇA DE GOLS EM UM UNICO JOGO
-- SELECT * FROM TBRAS ORDER BY (VISITANTEGOLS - MANDANTEGOLS) DESC;
-- 
-- 
-- 
-- 
-- -- TIRAR 3 PTS DO CORINTHIANS - SP E DAR 3 PRONTOS PARA PALMEIRAS - SP
-- 
-- SELECT * FROM TBRAS WHERE MANDANTE = 'CORINTHIANS - SP' AND VISITANTE = 'PALMEIRAS - SP';
-- 
-- SELECT * FROM TBRAS WHERE VISITANTE = 'CORINTHIANS - SP' AND MANDANTE = 'PALMEIRAS - SP';
-- 
-- UPDATE TBRAS SET MANDANTEGOLS = 0, VISITANTEGOLS = 1 WHERE JOGO = 47;
-- 
-- SELECT * FROM TBRAS WHERE JOGO = 47;
-- 
-- 
-- -- TIRAR 3 PTS DO ATLÉTICO - MG E DAR 3 PTS PRO CRUZEIRO - MG
-- 
-- SELECT * FROM TBRAS WHERE MANDANTE = 'ATLÉTICO - MG' AND VISITANTE = 'CRUZEIRO - MG';
-- 
-- UPDATE TBRAS SET MANDANTEGOLS = 0, VISITANTEGOLS = 1 WHERE JOGO = 51;
-- 
-- SELECT * FROM TBRAS WHERE JOGO = 51;
-- 
-- 
-- -- QUANTIDADE DE JOGOS EM CADA ESTÁDIO
-- 
-- SELECT 
--     LOCAL, 
--     COUNT(*) AS TOTAL_JOGOS
-- FROM TBRAS
-- GROUP BY LOCAL
-- ORDER BY TOTAL_JOGOS DESC;
-- 
-- 
-- -- QUANTIDADE MÉDIA DE GOL EM CADA ESTÁDIO
-- 
-- SELECT 
--     LOCAL, 
--     COUNT(*) AS TOTAL_JOGOS,
--     AVG(MANDANTEGOLS + VISITANTEGOLS) AS MEDIA_GOLS
-- FROM TBRAS
-- GROUP BY LOCAL
-- ORDER BY MEDIA_GOLS DESC;
-- 
-- -- DESVIO PADRAO DE GOL EM CADA ESTÁDIO
-- 
-- SELECT 
--     LOCAL, 
--     COUNT(*) AS TOTAL_JOGOS,
--     AVG(MANDANTEGOLS + VISITANTEGOLS) AS MEDIA_GOLS,
--     STD(MANDANTEGOLS + VISITANTEGOLS) AS DESVIO_PADRAO
-- FROM TBRAS
-- GROUP BY LOCAL
-- ORDER BY DESVIO_PADRAO DESC;
-- 
-- 
-- 
-- 
-- 
-- 
-- -- 15/09/2026
-- 
-- 
-- -- QUAL CLUBE FEZ MAIS GOL COMO VISITANTE
-- 
-- SELECT 
-- 	VISITANTE,
-- 	SUM(VISITANTEGOLS) AS GOLS_VISITANTE
-- FROM TBRAS
-- GROUP BY VISITANTE
-- ORDER BY GOLS_VISITANTE DESC
-- LIMIT 1;	
-- 
-- 
-- -- QUAL CLUBE FEZ MAIS GOL COMO MANDANTE
-- 
-- SELECT 
-- 	MANDANTE,
-- 	SUM(MANDANTEGOLS) AS GOLS_MANDANTE
-- FROM TBRAS
-- GROUP BY MANDANTE
-- ORDER BY GOLS_MANDANTE DESC
-- LIMIT 1;	
-- 
-- 
-- -- QUAL CLUBE FEZ MAIS GOL COMO AMBOS
-- 
-- DROP TEMPORARY TABLE IF EXISTS TB;
-- CREATE TEMPORARY TABLE TB (
-- 	CLUBE VARCHAR(100) NOT NULL DEFAULT ''
-- 	,GOLS INT 			 NOT NULL DEFAULT 0
-- );
-- INSERT INTO TB SELECT VISITANTE, VISITANTEGOLS FROM TBRAS;
-- INSERT INTO TB SELECT MANDANTE, MANDANTEGOLS FROM TBRAS;
-- 
-- SELECT
-- 	CLUBE,
-- 	SUM(GOLS)
-- FROM TB
-- GROUP BY CLUBE
-- ORDER BY SUM(GOLS) DESC;
-- 	
-- -- UNION ALL COM A TABELA ORIGINAL
-- SELECT CLUBE, SUM(GOLS) FROM (
-- 	SELECT MANDANTE AS CLUBE, MANDANTEGOLS AS GOLS FROM REFERENCIAS.brasileirao2018
-- 	UNION ALL
-- 	SELECT VISITANTE AS CLUBE, VISITANTEGOLS AS GOLS FROM REFERENCIAS.brasileirao2018
-- ) AS SUBBRAS
-- GROUP BY CLUBE
-- ORDER BY SUM(GOLS) DESC;
-- 
-- -- QUANTIDADE DE GOLS POR RODADA
-- 
-- SELECT * FROM TBRAS WHERE RODADA = 1;
-- 
-- SELECT RODADA, SUM(MANDANTEGOLS + VISITANTEGOLS) FROM TBRAS GROUP BY RODADA ORDER BY RODADA;
-- 
-- 
-- 
-- 
-- 
-- -- 22/09/2026
-- 
-- 
-- DROP TABLE IF EXISTS CLIENTES;
-- CREATE TABLE CLIENTES (
-- 	 ID 	INT 				NOT NULL AUTO_INCREMENT PRIMARY KEY
-- 	,NOME VARCHAR(100)   NOT NULL
-- 	,CPF 	CHAR(11)    		 NULL
-- 	,CNPJ CHAR(14)   			 NULL
-- )
-- COLLATE='UTF8MB4_0900_AI_CI' -- Para aceitar todos os caracteres. CI (ignora case sesetive) AI (ignora busca por acentos)
-- ENGINE=INNODB;
-- 
-- INSERT INTO clientes ( NOME,  	CPF, 				CNPJ)
-- VALUES					('ANA', 		'17770459087', NULL),
-- 							('ZÉ' , 		'12312312312', NULL),
-- 							('DEFREITAS' , NULL, 		'11223344556677');
-- 							
-- 
-- 
-- 
-- 
-- DROP TABLE IF EXISTS FORNECEDORES;
-- CREATE TABLE FORNECEDORES (
-- 	 ID 	INT 				NOT NULL AUTO_INCREMENT PRIMARY KEY
-- 	,NOME VARCHAR(150) 	NOT NULL DEFAULT ''
-- 	,CPF 	CHAR(11) 		    NULL
-- 	,CNPJ CHAR(14)   			 NULL
-- )
-- COLLATE='UTF8MB4_0900_AI_CI' -- Para aceitar todos os caracteres. CI (ignora case sesetive) AI (ignora busca por acentos)
-- ENGINE=INNODB;
-- 
-- INSERT INTO FORNECEDORES ( NOME,  		CPF, 	CNPJ)
-- VALUES					('3M' , 			NULL, '22223344556633'),
-- 							('WEG' , 		NULL, '44223344556655'),
-- 							('DEFREITAS', 	NULL, '11223344556677');
-- 
-- 
-- 
-- 
-- DROP TABLE IF EXISTS PRODUTOS;
-- CREATE TABLE PRODUTOS (
-- 	 ID 				INT 				NOT NULL AUTO_INCREMENT PRIMARY KEY
-- 	,NOME 			VARCHAR(100)   NOT NULL
-- 	,EAN13 			CHAR(13)   			 NULL
-- 	,UNIDADEMEDIDA CHAR(2)			NOT NULL DEFAULT 'UN'
-- )
-- COLLATE='UTF8MB4_0900_AI_CI' -- Para aceitar todos os caracteres. CI (ignora case sesetive) AI (ignora busca por acentos)
-- ENGINE=INNODB; -- Melhor engine usada por padrão
-- 
-- INSERT INTO PRODUTOS (NOME, 	 EAN13,			 	UNIDADEMEDIDA)
-- VALUES					('MOUSE', '0000000000001',	'UN'),
-- 							('TELA' , '0000000000002',	'UN'),
-- 							('RAM'  , '0000000000003',	'UN');
-- 							
-- 
-- 
-- 
-- 
-- DROP TABLE IF EXISTS ESTOQUE;
-- CREATE TABLE ESTOQUE (
-- 	 ID 				INT 				NOT NULL AUTO_INCREMENT PRIMARY KEY
-- 	,IDPRODUTO 		INT 				NOT NULL
-- 	,IDCLIENTE 		INT					 NULL
-- 	,IDFORNECEDOR	INT					 NULL
-- 	,QUANTIDADE		DECIMAL (10,4)
-- 	,DATAMOVIMENTO DATE				NOT NULL DEFAULT (CURRENT_DATE)
-- )
-- COLLATE='UTF8MB4_0900_AI_CI' -- Para aceitar todos os caracteres. CI (ignora case sesetive) AI (ignora busca por acentos)
-- ENGINE=INNODB; -- Melhor engine usada por padrão
-- 
-- INSERT INTO ESTOQUE
-- 				(IDPRODUTO, IDCLIENTE, IDFORNECEDOR, QUANTIDADE, DATAMOVIMENTO)
-- VALUES 		('1', 		NULL, 	  '2', 			'10', 		 '2026-01-01'),
-- 				('2', 		NULL, 	  '1', 			'7' ,			 '2026-01-05'),
-- 				('3', 		NULL, 	  '3', 			'1' , 		 '2026-06-05'),
-- 				('3', 		'1', 	     NULL, 			'2' ,  		 '2026-06-07'),
-- 				('1', 		'2', 	     NULL, 			'1' , 		 '2026-09-23'),
-- 				('2', 		'3', 	     NULL, 			'3' ,			 '2026-09-23'),
-- 				('2', 		'1', 	     NULL, 			'6' ,			 '2026-09-19');
-- 
-- 
-- -- SABER A QUANTIDADE DE VENDAS
-- SELECT 
-- 	E.QUANTIDADE
-- 	,P.NOME AS PRODUTO
-- 	,C.NOME AS CLIENTE
-- FROM 
-- 	estoque E
-- JOIN 
-- 	produtos P ON (E.IDPRODUTO = P.ID)
-- JOIN
-- 	clientes C ON (E.IDCLIENTE = C.ID)
-- WHERE 
-- 	IDCLIENTE IS NOT NULL;
-- 
-- -- ajustar a estrutura para gerar um relatório de compras e vendas por mês
-- 
-- SELECT 
-- 	SUM(E.QUANTIDADE) SOMA
-- 	,P.UNIDADEMEDIDA UN
-- 	,P.NOME AS PRODUTO
-- 	,MONTH(E.DATAMOVIMENTO) MES
-- FROM 
-- 	estoque E
-- JOIN 
-- 	produtos P ON (E.IDPRODUTO = P.ID)
-- JOIN
-- 	clientes C ON (E.IDCLIENTE = C.ID)
-- WHERE 
-- 	E.IDCLIENTE IS NOT NULL
-- GROUP BY MES, P.NOME;


-- -- -- -- -- -- -- -- -- 29-09-2026 -- -- -- -- -- -- -- -- --

-- REMOVE AS TABELAS
-- PRECISA DESATIVAR O CHECK DOS FK PARA PODER DROPAR
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS CLIENTES;
DROP TABLE IF EXISTS FORNECEDORES;
DROP TABLE IF EXISTS PRODUTOS;
DROP TABLE IF EXISTS ESTOQUE;
DROP TABLE IF EXISTS HISTORICO;
SET FOREIGN_KEY_CHECKS=1;


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- H I S T O R I C O 
CREATE TABLE HISTORICO (
     ID         INT             NOT NULL PRIMARY KEY AUTO_INCREMENT
    ,TABELA     VARCHAR(64)     NOT NULL DEFAULT ''
    ,ACAO       VARCHAR(32)     NOT NULL DEFAULT ''
    ,USUARIO    VARCHAR(32)     NOT NULL DEFAULT (CURRENT_USER)
    ,DATAHORA   DATETIME        NOT NULL DEFAULT (CURRENT_TIMESTAMP)
    ,CONTEUDO   JSON                NULL 
)
COLLATE='UTF8MB4_0900_AI_CI'    -- UNICODE ACCENT INSENSITIVE, CASE INSENSITIVE
ENGINE=INNODB;     


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- C L I E N T E S 

-- CRIA A TABELA SE ELA NÃO EXISTIR
CREATE TABLE CLIENTES (
     ID      INT             NOT NULL PRIMARY KEY AUTO_INCREMENT
    ,NOME    VARCHAR(70)     NOT NULL DEFAULT ''    -- NOME OU RAZÃO SOCIAL
    ,CPF     CHAR(11)            NULL UNIQUE        -- OBRIGATÓRIO PARA PESSOA FÍSICA, SENÃO NULL
    ,CNPJ    CHAR(14)            NULL UNIQUE        -- OBRIGATÓRIO PARA PESSOA JURÍDIA, SENÃO NULL
)
COLLATE='UTF8MB4_0900_AI_CI'    -- UNICODE ACCENT INSENSITIVE, CASE INSENSITIVE
ENGINE=INNODB;                  -- ENGINE INNODB (ACID COMPLIANCE)

-- ENSAIO
INSERT INTO CLIENTES ( ID ,  NOME   ,  CPF         ,  CNPJ)     
            VALUES   (  1 , 'ANA'   , '12312312387',  NULL);
INSERT INTO CLIENTES ( ID ,  NOME   ,  CPF         ,  CNPJ)
            VALUES   (  2 , 'ZÉ'    , '32132132154',  NULL);
INSERT INTO CLIENTES ( ID ,  NOME   ,  CPF         ,  CNPJ)
            VALUES   (  3 , 'SIMAS' ,  NULL        , '12123123000187');

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- F O R N E C E D O R E S 

-- CRIA A TABELA SE ELA NÃO EXISTIR
CREATE TABLE FORNECEDORES (
     ID      INT             NOT NULL PRIMARY KEY AUTO_INCREMENT
    ,NOME    VARCHAR(70)     NOT NULL DEFAULT ''
    ,CPF     CHAR(11)            NULL UNIQUE 
    ,CNPJ    CHAR(14)            NULL UNIQUE 
)
COLLATE='UTF8MB4_0900_AI_CI'
ENGINE=INNODB;

-- ENSAIO
INSERT INTO FORNECEDORES ( ID ,  NOME   ,  CPF         ,  CNPJ)
            VALUES       (  1 , '3M'    ,  NULL        , '01123456000188');
INSERT INTO FORNECEDORES ( ID ,  NOME   ,  CPF         ,  CNPJ)
            VALUES       (  2 , 'BASF'  ,  NULL        , '45123787000174');
INSERT INTO FORNECEDORES ( ID ,  NOME   ,  CPF         ,  CNPJ)
            VALUES       (  3 , 'GORDO' , '78945612355',  NULL);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- P R O D U T O S 

-- CRIA A TABELA SE ELA NÃO EXISTIR
CREATE TABLE PRODUTOS (
     ID             INT             NOT NULL PRIMARY KEY AUTO_INCREMENT
    ,NOME           VARCHAR(70)     NOT NULL DEFAULT ''
    ,EAN13          CHAR(13)            NULL
    ,UNIDADEMEDIDA  CHAR(2)         NOT NULL DEFAULT 'UN'
    ,VALOR          DECIMAL(10,2)   NOT NULL DEFAULT '0'    -- VALOR ATUAL DO PRODUTO
)
COLLATE='UTF8MB4_0900_AI_CI'
ENGINE=INNODB;

-- ENSAIO 
INSERT INTO PRODUTOS ( ID ,  NOME      ,  EAN13 ,  UNIDADEMEDIDA ,  VALOR  )
            VALUES   (  1 , 'LEXOTAN'  ,   NULL , 'CX'           , '23.45' );
INSERT INTO PRODUTOS ( ID ,  NOME      ,  EAN13 ,  UNIDADEMEDIDA ,  VALOR  )
            VALUES   (  2 , 'GARDENAL' ,   NULL , 'UN'           ,  '9.99' );
INSERT INTO PRODUTOS ( ID ,  NOME      ,  EAN13 ,  UNIDADEMEDIDA ,  VALOR  )
            VALUES   (  3 , 'DISQUETE' ,   NULL , 'UN'           , '99.99' );
INSERT INTO PRODUTOS ( ID ,  NOME      ,  EAN13 ,  UNIDADEMEDIDA ,  VALOR  )
            VALUES   (  4 , 'PÓLVORA'  ,   NULL , 'KG'           ,  '2.00' );


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- E S T O Q U E

-- CRIA A TABELA SE ELA NÃO EXISTIR
CREATE TABLE ESTOQUE (
     ID             INT             NOT NULL PRIMARY KEY AUTO_INCREMENT
    ,IDPRODUTO      INT             NOT NULL
    ,IDCLIENTE      INT                 NULL
    ,IDFORNECEDOR   INT                 NULL
    ,QUANTIDADE     DECIMAL(10,4)   NOT NULL DEFAULT '0'
    ,VALOR          DECIMAL(10,2)   NOT NULL DEFAULT '0'                   -- VALOR DO PRODUTO NO MOMENTO DO CADASTRO
    ,DATAMOVIMENTO  DATE                NULL
    ,CONSTRAINT FKIDPRODUTO FOREIGN KEY (IDPRODUTO) REFERENCES PRODUTOS(ID)
)
COLLATE='UTF8MB4_0900_AI_CI'
ENGINE=INNODB;


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- T R I G G E R S 

-- TRIGGER PARA DEFINIR O VALOR DO PRODUTO E A DATA DE MOVIMENTO
DROP   TRIGGER IF     EXISTS ESTOQUE_BEFORE_INSERT;
DELIMITER $$
CREATE TRIGGER IF NOT EXISTS ESTOQUE_BEFORE_INSERT
BEFORE INSERT
ON ESTOQUE FOR EACH ROW 
BEGIN
    SET @J = JSON_ARRAY(
         JSON_OBJECT('ID'            , NEW.ID            )
        ,JSON_OBJECT('IDPRODUTO'     , NEW.IDPRODUTO     )
        ,JSON_OBJECT('IDCLIENTE'     , NEW.IDCLIENTE     )
        ,JSON_OBJECT('IDFORNECEDOR'  , NEW.IDFORNECEDOR  )
        ,JSON_OBJECT('QUANTIDADE'    , NEW.QUANTIDADE    )
        ,JSON_OBJECT('DATAMOVIMENTO' , NEW.DATAMOVIMENTO )
    );      
    SET NEW.VALOR = (SELECT VALOR FROM PRODUTOS WHERE ID=NEW.IDPRODUTO);
    SET NEW.DATAMOVIMENTO = IF(NEW.DATAMOVIMENTO IS NULL, DATE(NOW()), NEW.DATAMOVIMENTO);
    SET NEW.DATAMOVIMENTO = IF(NEW.DATAMOVIMENTO>DATE(NOW()), NULL, NEW.DATAMOVIMENTO);
    INSERT INTO HISTORICO (TABELA, ACAO, CONTEUDO) VALUES ('ESTOQUE', 'INSERT', @J);
END $$
DELIMITER ;

-- TRIGGER PARA HISTORICO
DROP   TRIGGER IF     EXISTS ESTOQUE_BEFORE_UPDATE;
DELIMITER $$
CREATE TRIGGER IF NOT EXISTS ESTOQUE_BEFORE_UPDATE
BEFORE UPDATE
ON ESTOQUE FOR EACH ROW 
BEGIN
    SET @J = JSON_ARRAY(
        JSON_ARRAY(
             JSON_OBJECT('ID'            , OLD.ID            )
            ,JSON_OBJECT('IDPRODUTO'     , OLD.IDPRODUTO     )
            ,JSON_OBJECT('IDCLIENTE'     , OLD.IDCLIENTE     )
            ,JSON_OBJECT('IDFORNECEDOR'  , OLD.IDFORNECEDOR  )
            ,JSON_OBJECT('QUANTIDADE'    , OLD.QUANTIDADE    )
            ,JSON_OBJECT('DATAMOVIMENTO' , OLD.DATAMOVIMENTO )
        )
        ,JSON_ARRAY(
             JSON_OBJECT('ID'            , NEW.ID            )
            ,JSON_OBJECT('IDPRODUTO'     , NEW.IDPRODUTO     )
            ,JSON_OBJECT('IDCLIENTE'     , NEW.IDCLIENTE     )
            ,JSON_OBJECT('IDFORNECEDOR'  , NEW.IDFORNECEDOR  )
            ,JSON_OBJECT('QUANTIDADE'    , NEW.QUANTIDADE    )
            ,JSON_OBJECT('DATAMOVIMENTO' , NEW.DATAMOVIMENTO )
        )
    );      
    INSERT INTO HISTORICO (TABELA, ACAO, CONTEUDO) VALUES ('ESTOQUE', 'UPDATE', @J);
END $$
DELIMITER ;


-- TRIGGER PARA HISTORICO
DROP   TRIGGER IF     EXISTS ESTOQUE_BEFORE_DELETE;
DELIMITER $$
CREATE TRIGGER IF NOT EXISTS ESTOQUE_BEFORE_DELETE
BEFORE DELETE
ON ESTOQUE FOR EACH ROW 
BEGIN
    SET @J = JSON_ARRAY(
         JSON_OBJECT('ID'            , OLD.ID            )
        ,JSON_OBJECT('IDPRODUTO'     , OLD.IDPRODUTO     )
        ,JSON_OBJECT('IDCLIENTE'     , OLD.IDCLIENTE     )
        ,JSON_OBJECT('IDFORNECEDOR'  , OLD.IDFORNECEDOR  )
        ,JSON_OBJECT('QUANTIDADE'    , OLD.QUANTIDADE    )
        ,JSON_OBJECT('DATAMOVIMENTO' , OLD.DATAMOVIMENTO )
    );      
    INSERT INTO HISTORICO (TABELA, ACAO, CONTEUDO) VALUES ('ESTOQUE', 'DELETE', @J);
END $$
DELIMITER ;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- E N S A I O S


INSERT INTO ESTOQUE ( ID  , IDPRODUTO , IDCLIENTE , IDFORNECEDOR , QUANTIDADE , DATAMOVIMENTO )
            VALUES  ( '3' ,       '1' ,       '1' ,         NULL ,        '2' , '2026-05-08'  );
INSERT INTO ESTOQUE ( ID  , IDPRODUTO , IDCLIENTE , IDFORNECEDOR , QUANTIDADE , DATAMOVIMENTO )
            VALUES  ( '4' ,       '1' ,       '2' ,         NULL ,        '1' , '2026-05-16'  );
INSERT INTO ESTOQUE ( ID  , IDPRODUTO , IDCLIENTE , IDFORNECEDOR , QUANTIDADE , DATAMOVIMENTO )
            VALUES  ( '5' ,       '4' ,       '1' ,         NULL ,        '5' , '2027-08-02'  );
INSERT INTO ESTOQUE ( ID  , IDPRODUTO , IDCLIENTE , IDFORNECEDOR , QUANTIDADE )
            VALUES  ( '6' ,       '4' ,       '2' ,         NULL ,     '1000' );
             
UPDATE ESTOQUE SET QUANTIDADE='1' WHERE 1=1;

INSERT INTO ESTOQUE ( ID  , IDPRODUTO , IDCLIENTE , IDFORNECEDOR , QUANTIDADE )
            VALUES  ( '9' ,       '4' ,       '2' ,         NULL ,     '1000' );
            
DELETE FROM ESTOQUE WHERE ID='3';

-- DELETE FROM PRODUTOS WHERE ID='4';

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- R E L A T Ó R I O S

-- RELATÓRIO SINTÉTICO (RESUMIDO) DE VENDAS POR MÊS
SELECT 
     YEAR(E.DATAMOVIMENTO)      ANO
    ,MONTH(E.DATAMOVIMENTO)     MES
    ,SUM(E.QUANTIDADE)          QUANTIDADE
    ,P.UNIDADEMEDIDA            UN
    ,SUM(E.QUANTIDADE*E.VALOR)  VALOR
    ,CONCAT(P.ID,'-',P.NOME)    PRODUTO
FROM         ESTOQUE  E 
        JOIN PRODUTOS P ON (E.IDPRODUTO=P.ID)
        JOIN CLIENTES C ON (E.IDCLIENTE=C.ID)
WHERE 
    E.IDCLIENTE IS NOT NULL
GROUP BY 
     MONTH(E.DATAMOVIMENTO)
    ,YEAR(E.DATAMOVIMENTO)
    ,P.ID;


-- RELATÓRIO ANALÍTICO DE VENDAS POR MÊS
SELECT 
     E.DATAMOVIMENTO            DATAMOVIMENTO
    ,E.QUANTIDADE               QUANTIDADE
    ,P.UNIDADEMEDIDA            UN
    ,E.VALOR                    VALORUNITARIO
    ,E.QUANTIDADE*E.VALOR       VALOR
    ,CONCAT(P.ID,'-',P.NOME)    PRODUTO
FROM         ESTOQUE  E 
        JOIN PRODUTOS P ON (E.IDPRODUTO=P.ID)
        JOIN CLIENTES C ON (E.IDCLIENTE=C.ID)
WHERE 
    E.IDCLIENTE IS NOT NULL;


SELECT * FROM HISTORICO;




SET @NOME='GUSTAVO';

SELECT @NOME;

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
SELECT * FROM votos;


-- 21/10/2026
-- PROCEDURES

DROP PROCEDURE IF EXISTS SPRESULTADO;
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS SPRESULTADO (IN PCANDIDATONUMERO INT, OUT QUANTIDADEVOTOS INT)
BEGIN 
	SELECT COUNT(*) INTO QUANTIDADEVOTOS FROM VOTOS WHERE NUMERO=PCANDIDATONUMERO;
END
$$
DELIMITER ;

CALL SPRESULTADO('666', @QTD);

SELECT @QTD;



