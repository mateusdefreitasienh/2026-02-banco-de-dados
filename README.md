# Banco de dados

## ON DELETE CASCADE

- Deleta os jogadores, quando o clube é removido

```sql
CREATE TABLE JOGADORES (
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
	,IDCLUBE INT NULL
	,NOME VARCHAR(70) NOT NULL
	,SALARIO DECIMAL(10,2) NULL DEFAULT '0.0'
	,DATANASCIMENTO DATE NOT NULL
	,DATACONTRATACAO DATE
	,FOREIGN KEY (IDCLUBE) REFERENCES clubes(ID) ON DELETE CASCADE
);
```

## ON DELETE CASCADE

- ON UPDATE CASCADE faz com que, ao alterar o ID de um registro na tabela pai, os IDs correspondentes na tabela filha sejam atualizados automaticamente.

```sql
UPDATE clubes
SET ID = 5
WHERE ID = 1;
```
Se um jogador possuía IDCLUBE = 1, o banco atualizará automaticamente para IDCLUBE = 5.