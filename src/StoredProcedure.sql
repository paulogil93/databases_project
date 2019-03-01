

-- Obter os clientes que têm planos para mostrar esses mesmos
CREATE PROCEDURE [GYM].GetClientsPlans AS
SET NOCOUNT ON;
SELECT Nome
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif


-- Passar o id do cliente para mostrar o plano
CREATE PROCEDURE [GYM].GetClientsIDPlan @ClientName VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Plano.Numero
FROM [GYM].Plano JOIN [GYM].Cliente ON Plano.Nif_Cliente = Cliente.Nif JOIN [GYM].Pessoa ON Cliente.Nif = Pessoa.Nif
WHERE Pessoa.Nome = @ClientName 



-- Mostrar o plano do cliente escolhido
CREATE PROCEDURE [GYM].GetClientExercicesPlan AS
SET NOCOUNT ON;
SELECT Descricao, Duracao, Series
FROM [GYM].Exercicio JOIN [GYM].Composicao_Treino ON Exercicio.Codigo = Composicao_Treino.Codigo_Exercicio JOIN [GYM].Treino ON Composicao_Treino.ID_Treino = Treino.ID JOIN Composicao_Plano ON Treino.ID = Composicao_Plano.ID_Treino JOIN Plano ON Plano.Numero = Composicao_Plano.Numero_Plano
	
-- Devolver os instrutores disponiveis
CREATE PROCEDURE [GYM].GetInstructors AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM [GYM].Pessoa AS P JOIN [GYM].Instrutor AS I ON P.Nif=I.Nif


CREATE PROCEDURE [GYM].GetSelectedID @username VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Nif 
FROM GYM.Pessoa 
WHERE Pessoa.Nome = @username

-- Devolver os Clientes associados a um instrutor
CREATE PROCEDURE [GYM].GetClientsFromInstructor @instructor VARCHAR(30) AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa as P JOIN [GYM].Treino_Pessoal as PT on P.Nif=PT.Nif_Cliente) 
WHERE PT.Nif_Instrutor = @instructor


-- Obter todos os clientes disponiveis
CREATE PROCEDURE [GYM].GetAllClients AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa AS P JOIN [GYM].Cliente AS C ON P.Nif=C.Nif) 


CREATE PROCEDURE [GYM].GetAllInstructors AS
SET NOCOUNT ON;
SELECT P.Nome 
FROM ([GYM].Pessoa AS P JOIN [GYM].Instrutor AS I ON P.Nif=I.Nif)



CREATE PROCEDURE [GYM].[AddClientToInstructor] @cliente INT, @instructor INT AS
SET NOCOUNT ON;
INSERT INTO [GYM].Treino_Pessoal VALUES (@cliente, @instructor)


CREATE PROCEDURE [GYM].GetSelectedIDClient @username VARCHAR(30) AS
SET NOCOUNT ON;
SELECT Cliente.Nif 
FROM GYM.Cliente JOIN GYM.Pessoa ON Cliente.Nif = Pessoa.Nif
WHERE Pessoa.Nome = @username

ALTER PROCEDURE [GYM].[RemoveClientToInstructor] @cliente INT, @instructor INT AS
	
	IF EXISTS (SELECT * FROM GYM.Treino_Pessoal WHERE @cliente=Nif_Cliente AND @instructor=Nif_Instrutor)
	BEGIN	
		DELETE FROM GYM.Treino_Pessoal
		WHERE Nif_Cliente=@cliente AND Nif_Instrutor=@instructor
	END

CREATE PROCEDURE [GYM].ClientAlreadyInPT @client INT, @instructor INT AS
    SELECT count(1)
    AS RESULT 
    FROM [GYM].Treino_Pessoal
    WHERE Nif_Cliente=@client AND Nif_Instrutor=@instructor;