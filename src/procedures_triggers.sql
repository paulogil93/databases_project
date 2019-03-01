USE p1g1;

--Get user type (admin, client, trainer or nutritionist) [x]
GO
CREATE PROCEDURE [GYM].GetPersonType @userID INT, @output VARCHAR(15) OUTPUT
AS
    IF EXISTS(SELECT * FROM [GYM].Cliente WHERE Nif=@userID)
    BEGIN
        SET @output = 'client';
    END
    IF EXISTS(SELECT * FROM [GYM].Instrutor WHERE Nif=@userID)
    BEGIN
        SET @output = 'instructor';
    END
    IF EXISTS(SELECT * FROM [GYM].Nutricionista WHERE Nif=@userID)
    BEGIN
        SET @output = 'nutritionist';
    END

--Get Login type [x]
GO
CREATE PROCEDURE [GYM].GetLoginType @userName VARCHAR(15)
AS
    SET NOCOUNT ON;
    SELECT type 
    FROM [GYM].Login 
    WHERE username=@userName


--Get person ID [x]
GO
CREATE PROCEDURE [GYM].GetPersonID @userName VARCHAR(15)
AS
    SET NOCOUNT ON;
    SELECT person_id 
    FROM [GYM].Login 
    WHERE username=@userName

--Get Login (password is a MD5 hash, it has 32 chars length) [x]
GO
CREATE PROCEDURE [GYM].GetLogin @username VARCHAR(15), @password VARCHAR(32)
AS
    SET NOCOUNT ON;
    SELECT * 
    FROM [GYM].Login 
    WHERE username=@username and userpass=@password

--Get users list [x]
GO
CREATE PROCEDURE [GYM].GetUserList
AS
    SET NOCOUNT ON;
    SELECT Nome 
    FROM [GYM].Pessoa

--Get food list
GO
CREATE PROCEDURE [GYM].GetFoodList
AS
    SET NOCOUNT ON;
    SELECT Nome 
    FROM [GYM].Alimento;

--Get nutritionist list
GO
CREATE PROCEDURE [GYM].GetNutritionistList
AS
    SELECT Nome
    FROM [GYM].Nutricionista AS N
    JOIN [GYM].Pessoa AS P
    ON N.Nif=P.Nif;


--Get diet info
GO
CREATE PROCEDURE [GYM].GetDietInfo
	@dietID INT
AS
	SELECT I.Descricao, P.Nome AS NutriName, A.Nome AS Food, C.Percentagem
	FROM [GYM].Composicao_Dieta AS C
	JOIN [GYM].Instancia_Dieta AS I
	ON C.Numero_Dieta=I.Numero
	JOIN [GYM].Alimento AS A
	ON C.ID_Alimento=A.ID
	JOIN [GYM].Pessoa AS P
	ON I.Nif_Nutricionista=P.Nif
	WHERE C.Numero_Dieta=@dietID;

--Get clients with diets
GO
CREATE PROCEDURE [GYM].GetClientsWithDiets
AS
    SELECT Nome
    FROM [GYM].Tem_Dieta AS D
    JOIN [GYM].Pessoa AS P
    ON D.Nif_Cliente=P.Nif;

--Get diet from client
GO
CREATE PROCEDURE [GYM].GetDietFromClient
    @clientName   VARCHAR(30)
AS
    DECLARE @clientID INT

    IF EXISTS(SELECT * FROM [GYM].Pessoa WHERE Nome=@clientName)
    BEGIN
        SELECT @clientID=Nif FROM [GYM].Pessoa WHERE Nome=@clientName;
    END

    SELECT Numero_Dieta
    FROM [GYM].Tem_Dieta
    WHERE Nif_Cliente = @clientID;

--Get selected user ID [x]
GO
CREATE PROCEDURE [GYM].GetSelectedUserID @userName varchar(15)
AS
    SET NOCOUNT ON;
    SELECT Nif 
    FROM [GYM].Pessoa 
    WHERE Nome=@userName

--Get selected package info [x]
GO
CREATE PROCEDURE [GYM].GetSelectedPackageInfo @packageID INT
AS
    SET NOCOUNT ON;
    SELECT Nome_pacote
    FROM [GYM].Pacote
    WHERE ID=@packageID

--Get selected package ID [x]
GO
CREATE PROCEDURE [GYM].GetSelectedPackageID @packageName VARCHAR(15)
AS
    SET NOCOUNT ON;
    SELECT ID
    FROM [GYM].Pacote
    WHERE Nome_pacote=@packageName

--Get classes list
GO
CREATE PROCEDURE [GYM].GetClassesList
AS
    SET NOCOUNT ON;
    SELECT Descricao
    FROM [GYM].Aula

--Get instructor list
GO
CREATE PROCEDURE [GYM].GetInstructorList
AS
    SET NOCOUNT ON;
    SELECT nome
    FROM [GYM].Pessoa AS P
    JOIN [GYM].Instrutor AS I
    ON P.nif=I.nif;

--Get client list
GO
CREATE PROCEDURE [GYM].GetClientList
AS
    SET NOCOUNT ON;
    SELECT Nome 
    FROM [GYM].Pessoa AS P
    JOIN [GYM].Cliente AS C
    ON P.Nif=C.Nif;

--Gets selected class ID
GO
CREATE PROCEDURE [GYM].GetSelectedClassID
    @className VARCHAR(50)
AS
    SET NOCOUNT ON;
    SELECT Nome
    FROM [GYM].Aula
    WHERE Descricao = @className;

--Get client info
GO
CREATE PROCEDURE [GYM].GetClientInfo @userID INT
AS
    SET NOCOUNT ON;
    SELECT P.nome, P.data_nascimento, P.morada, C.numero_cliente, C.data_inscricao, C.pacote, C.numero_horas
    FROM ([GYM].Pessoa AS P JOIN [GYM].Cliente AS C ON P.nif=C.nif)
    WHERE P.nif=@userID

--Get instructor info
GO
CREATE PROCEDURE [GYM].GetInstructorInfo @userID INT
AS
    SET NOCOUNT ON;
    SELECT P.nome, P.data_nascimento, P.morada, F.numero_func, F.ordenado, I.qualificacao
    FROM (([GYM].Pessoa AS P JOIN [GYM].Funcionario AS F ON P.nif=F.nif) JOIN [GYM].Instrutor AS I ON P.nif=I.nif)
    WHERE P.nif=@userID

--Get nutritionist info [?]
GO
CREATE PROCEDURE [GYM].GetNutriInfo @userID INT
AS
    SET NOCOUNT ON;
    SELECT P.nome, P.data_nascimento, P.morada, F.numero_func, F.ordenado
    FROM ([GYM].Pessoa AS P JOIN [GYM].Funcionario AS F ON P.nif=F.nif)
    WHERE P.nif=@userID

--Get package info [x]
GO
CREATE PROCEDURE [GYM].GetPackageInfo
AS
    SET NOCOUNT ON;
    SELECT Nome_pacote
    FROM [GYM].Pacote

--Get exercise info
GO
CREATE PROCEDURE [GYM].GetExerciceInfo
AS
    SET NOCOUNT ON;
    SELECT Descricao
    FROM [GYM].Exercicio

--Get participants of a specific class
GO
CREATE PROCEDURE [GYM].GetClassParticipants
    @classID VARCHAR(20)
AS
    SET NOCOUNT ON;
    SELECT P.nome
    FROM [GYM].Cliente_Participa AS C
    JOIN [GYM].Pessoa AS P
    ON C.Nif = P.Nif
    WHERE C.Nome = @classID;

--Get class info
GO
CREATE PROCEDURE [GYM].GetClassInfo
	@classID VARCHAR(20)
AS
	SELECT A.Descricao, P.Nome, IA.Data, IA.Hora, IA.Duracao, IA.Vagas
	FROM [GYM].Instancia_Aula AS IA
	JOIN [GYM].Aula AS A
	ON IA.Nome=A.Nome
	JOIN [GYM].Da_Aula AS D
	ON IA.Nome=D.Nome
	JOIN [GYM].Pessoa AS P
	ON D.Nif=P.Nif
	WHERE IA.Nome=@classID;

--Get training ID
GO
CREATE PROCEDURE [GYM].GetTrainingID
    @userID INT
AS
    IF EXISTS(SELECT * FROM [GYM].Plano WHERE Nif_Cliente=@userID)
    BEGIN
        SELECT CP.ID_Treino
        FROM [GYM].Plano AS P
        JOIN [GYM].Composicao_Plano AS CP
        ON P.Numero=CP.Numero_Plano
        WHERE Nif_Cliente=@userID;
    END

--Check if already belongs to class
GO
CREATE PROCEDURE [GYM].UserBelongsToClass
    @clientID   INT,
    @classID    VARCHAR(15)
AS
    SELECT count(1)
    AS RESULT 
    FROM [GYM].Cliente_Participa
    WHERE Nif=@clientID
    AND Nome=@classID;

--Check if client already has a diet
GO
CREATE PROCEDURE [GYM].ClientAlreadyHasDiet
    @clientID   INT
AS
    SELECT count(1)
    AS RESULT
    FROM [GYM].Tem_Dieta
    WHERE Nif_Cliente=@clientID;

--Check if client or employee number exists
GO
CREATE PROCEDURE [GYM].NumberAlreadyExists
	@number	INT
AS
	IF EXISTS(SELECT * FROM [GYM].Cliente WHERE Numero=@number)
	BEGIN
		SELECT count(1)
		AS RESULT
		FROM [GYM].Cliente
		WHERE Numero=@number;
	END

	IF NOT EXISTS(SELECT * FROM [GYM].Cliente WHERE Numero=@number)
	BEGIN
		SELECT count(1)
		AS RESULT
		FROM [GYM].Funcionario
		WHERE Numero=@number;
	END
----------------------------------------------------------------------
--------------------------------CREATE--------------------------------
----------------------------------------------------------------------

--Create new client [x]
GO
CREATE PROCEDURE [GYM].NewClient @clientID INT, @name VARCHAR(30), @address VARCHAR(30), @birth CHAR(10), @clientNumber INT,
    @joinedDate CHAR(10), @packageID INT, @hoursLeft INT
AS
BEGIN
    INSERT INTO [GYM].Pessoa VALUES (@name, CONVERT(date, @birth, 105), @clientID, @address, NULL);
    INSERT INTO [GYM].Cliente VALUES(@clientID, @clientNumber, CONVERT(date, @joinedDate, 105), @packageID, @hoursLeft);
END

--Create new instructor[x]
GO
CREATE PROCEDURE [GYM].NewInstructor @trainerID INT, @name VARCHAR(30), @address VARCHAR(30), @birth CHAR(10), @employeeNumber INT,
    @salary VARCHAR(15), @qualification VARCHAR(15)
AS
BEGIN
    IF(@salary < 680)
    BEGIN
        SET @salary = 680
    END
    INSERT INTO [GYM].Pessoa VALUES (@name, CONVERT(date, @birth, 105), @trainerID, @address, NULL);
    INSERT INTO [GYM].Funcionario VALUES(@trainerID, @employeeNumber, CAST(@salary AS INT));
    INSERT INTO [GYM].Instrutor VALUES(@trainerID, @qualification);
END

--Create new nutritionist [x]
GO
CREATE PROCEDURE [GYM].NewNutritionist @nutriID INT, @name VARCHAR(30), @address VARCHAR(30), @birth CHAR(10), @employeeNumber INT,
    @salary VARCHAR(15)
AS
BEGIN
    IF(@salary < 680)
    BEGIN
        SET @salary = 680
    END
    INSERT INTO [GYM].Pessoa VALUES (@name, CONVERT(date, @birth, 105), @nutriID, @address, NULL);
    INSERT INTO [GYM].Funcionario VALUES(@nutriID, @employeeNumber, CAST(@salary AS INT));
    INSERT INTO [GYM].Nutricionista VALUES(@nutriID);
END

--Create new plan
GO
CREATE PROCEDURE [GYM].NewPlan
    @planID     INT,
    @trainID    INT,
    @clientID   INT,
    @trainerID  INT,
    @planName   VARCHAR(15)
AS
    IF NOT EXISTS(SELECT * FROM [GYM].Plano WHERE Numero=@planID)
    BEGIN
        INSERT INTO [GYM].Plano
        VALUES(@planID, @trainerID, @clientID, @planName);
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Treino WHERE ID=@trainID)
    BEGIN
        INSERT INTO [GYM].Treino VALUES(@trainID);
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Composicao_Plano WHERE Numero_Plano=@planID AND ID_Treino=@trainID)
    BEGIN
        INSERT INTO [GYM].Composicao_Plano VALUES(@planID, @trainID);
    END

--Create new class
GO
CREATE PROCEDURE [GYM].NewClass
    @classID        VARCHAR(20),
    @className      VARCHAR(30),
    @vacancies      INT,
    @time           VARCHAR(15), 
    @date           VARCHAR(15),
    @duration       INT,
    @instructorID   INT
AS
    IF NOT EXISTS(SELECT * FROM [GYM].Aula WHERE Nome=@classID)
    BEGIN
        INSERT INTO [GYM].Aula
        VALUES(@classID, @className);
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Instancia_Aula WHERE Nome=@classID)
    BEGIN
        INSERT INTO [GYM].Instancia_Aula
        VALUES(@classID, @vacancies, CAST(@time AS TIME), @duration, CONVERT(DATE, @date, 105));
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Da_Aula WHERE Nome=@classID)
    BEGIN
        INSERT INTO [GYM].Da_Aula
        VALUES(@instructorID, @classID, CONVERT(DATE, @date, 105), CAST(@time AS TIME));
    END

--Adds client to class
GO
CREATE PROCEDURE [GYM].AddClientToClass
    @clientID   INT,
    @ClassID    VARCHAR(20)
AS
    DECLARE @date DATE
    DECLARE @time TIME
    
    IF EXISTS(SELECT * FROM [GYM].Instancia_Aula WHERE Nome=@ClassID)
    BEGIN
        SELECT @date = Data, @time = Hora
        FROM [GYM].Instancia_Aula
        WHERE Nome = @ClassID;
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Cliente_Participa WHERE Nif=@clientID AND Nome=@ClassID)
    BEGIN
        INSERT INTO [GYM].Cliente_Participa
        VALUES(@clientID, @ClassID, @date, @time);
    END

--Add new diet
GO
CREATE PROCEDURE [GYM].NewDiet
    @dietID         INT,
    @description    VARCHAR(20),
    @client         VARCHAR(20),
    @nutritionist   VARCHAR(20),
    @food           VARCHAR(20),
    @quantity       INT
AS
    DECLARE @nutri_nif INT
    SELECT @nutri_nif=Nif
    FROM [GYM].Pessoa
    WHERE Nome=@nutritionist

    DECLARE @clientID INT
    SELECT @clientID=Nif
    FROM [GYM].Pessoa
    WHERE Nome=@client

    DECLARE @foodID INT
    SELECT @foodID=ID
    FROM [GYM].Alimento
    WHERE Nome=@food

    IF NOT EXISTS(SELECT * FROM [GYM].Dieta WHERE Numero=@dietID)
    BEGIN
        INSERT INTO [GYM].Dieta 
        VALUES(@dietID);
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Instancia_Dieta WHERE Numero=@dietID)
    BEGIN
        INSERT INTO [GYM].Instancia_Dieta
        VALUES (@description, @nutri_nif, @dietID);
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Composicao_Dieta WHERE Numero_Dieta=@dietID AND ID_Alimento=@foodID)
    BEGIN
        INSERT INTO [GYM].Composicao_Dieta
        VALUES(@dietID, @foodID, @quantity);
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Tem_Dieta WHERE Nif_Cliente=@clientID)
    BEGIN
        INSERT INTO [GYM].Tem_Dieta
        VALUES(@clientID, @nutri_nif, @dietID);
    END

----------------------------------------------------------------------
--------------------------------UPDATE--------------------------------
----------------------------------------------------------------------

--Update user info [x]
GO
CREATE PROCEDURE [GYM].UpdateUserInfo
    @userID         INT,
    @name           VARCHAR(30),
    @address        VARCHAR(30),
    @birth          CHAR(10),
    @clientNumber   INT,
    @joinedDate     CHAR(10),
    @packageID      INT,
    @hoursLeft      INT,
    @employeeNumber INT,
    @salary         VARCHAR(15),
    @qualification  VARCHAR(15)
AS
    SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM [GYM].Pessoa WHERE Nif=@userID)
    BEGIN
        UPDATE [GYM].Pessoa
        SET 
            Nome = @name,
            Morada = @address,
            Nascimento = CONVERT(date, @birth, 105)
        WHERE Nif = @userID;
    END
    IF EXISTS(SELECT * FROM [GYM].Cliente WHERE Nif=@userID)
    BEGIN
        
        UPDATE [GYM].Cliente
        SET
            Numero = @clientNumber,
            Inscricao = CONVERT(date, @joinedDate, 105),
            Pacote = @packageID,
            Numero_Horas = @hoursLeft
        WHERE Nif = @userId;
    END
    IF EXISTS(SELECT * FROM [GYM].Funcionario WHERE Nif=@userID)
    BEGIN
        UPDATE [GYM].Funcionario
        SET
            Numero = @employeeNumber,
            Ordenado = CAST(@salary AS INT)
        WHERE Nif = @userID;
    END
    IF EXISTS(SELECT * FROM [GYM].Instrutor WHERE Nif=@userID)
    BEGIN
        UPDATE [GYM].Instrutor
        SET Qualificacao = @qualification
        WHERE Nif = @userID;
    END

--Delete all trainings
GO
CREATE PROCEDURE [GYM].DeleteAllTrainings
    @trainID INT
AS
    IF EXISTS(SELECT * FROM [GYM].Composicao_Treino WHERE ID_Treino=@trainID)
    BEGIN
        DELETE FROM [GYM].Composicao_Treino
        WHERE ID_Treino=@trainID;
    END

--Delete all info from diet before update
GO
CREATE PROCEDURE [GYM].DeleteAllDiets
    @dietID INT
AS
    IF EXISTS(SELECT * FROM [GYM].Composicao_Dieta WHERE Numero_Dieta=@dietID)
    BEGIN
        DELETE FROM [GYM].Composicao_Dieta
        WHERE Numero_Dieta=@dietID;
    END

--Update plan info
GO
CREATE PROCEDURE [GYM].UpdatePlanInfo
    @clientID       INT,
    @planName       VARCHAR(30),
    @description    VARCHAR(15),
    @duration       INT,
    @series         INT
AS
    DECLARE @planID INT
    DECLARE @trainID INT
    DECLARE @exerciseID INT
    DECLARE @exists INT


    SELECT @planID=Numero
    FROM [GYM].Plano
    WHERE Nif_Cliente=@clientID;

    SELECT @trainID=ID_Treino
    FROM [GYM].Composicao_Plano
    WHERE Numero_Plano=@planID;

    SELECT @exerciseID=Codigo
    FROM [GYM].Exercicio
    WHERE Descricao=@description;

    IF EXISTS(SELECT * FROM [GYM].Plano WHERE Numero=@planID)
    BEGIN
        UPDATE [GYM].Plano
        SET
            Descricao=@planName
        WHERE Numero=@planID;
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Composicao_Treino WHERE ID_Treino=@trainID AND Codigo_Exercicio=@exerciseID)
    BEGIN
        INSERT INTO [GYM].Composicao_Treino
        VALUES (@trainID, @exerciseID, @duration, NULL, @series)
    END

--Update class info
GO
CREATE PROCEDURE [GYM].UpdateClassInfo
    @classID        VARCHAR(20),
    @className      VARCHAR(30),
    @vacancies      INT,
    @time           VARCHAR(20), 
    @date           VARCHAR(20),
    @duration       INT,
    @instructorID   INT
AS
    IF EXISTS(SELECT * FROM [GYM].Aula WHERE Nome=@classID)
    BEGIN
        UPDATE [GYM].Aula
        SET
            Descricao=@className
        WHERE Nome=@classID;
    END
    IF EXISTS(SELECT * FROM [GYM].Instancia_Aula WHERE Nome=@classID)
    BEGIN
        UPDATE [GYM].Instancia_Aula
        SET
            Vagas = @vacancies,
            Hora = CAST(@time AS TIME),
            Duracao = @duration,
            Data = CONVERT(DATE, @date, 105)
        WHERE Nome = @classID;
    END
    IF EXISTS(SELECT * FROM [GYM].Da_Aula WHERE Nome=@classID)
    BEGIN
        UPDATE [GYM].Da_Aula
        SET
            Nif = @instructorID,
            Data = CONVERT(DATE, @date, 105),
            Hora = CAST(@time AS TIME)
        WHERE Nome = @classID;
    END

--Update diet info
GO
CREATE PROCEDURE [GYM].UpdateDietInfo
    @dietID         INT,
    @dietName       VARCHAR(20),
    @nutritionist   VARCHAR(20),
    @food           VARCHAR(20),
    @quantity       VARCHAR(20)
AS
    DECLARE @foodID INT
    SELECT @foodID=ID
    FROM [GYM].Alimento
    WHERE Nome=@food;

    DECLARE @nutriID INT
    SELECT @nutriID=Nif 
    FROM [GYM].Pessoa
    WHERE Nome=@nutritionist;

    IF EXISTS(SELECT * FROM [GYM].Instancia_Dieta WHERE Numero=@dietID)
    BEGIN
        UPDATE [GYM].Instancia_Dieta
        SET
            Descricao=@dietName
        WHERE Numero=@dietID;
    END
    IF NOT EXISTS(SELECT * FROM [GYM].Composicao_Dieta WHERE Numero_Dieta=@dietID AND ID_Alimento=@foodID)
    BEGIN
        INSERT INTO [GYM].Composicao_Dieta
        VALUES(@dietID, @foodID, @quantity);
    END

----------------------------------------------------------------------
--------------------------------DELETE--------------------------------
----------------------------------------------------------------------

--Delete client procedure
GO
CREATE PROCEDURE [GYM].DeleteUser @UserID INT
AS
    SET NOCOUNT ON;
    IF EXISTS(SELECT * FROM [GYM].Treino_Pessoal WHERE Nif_Cliente=@UserID OR Nif_Instrutor=@UserID)
    BEGIN
        DELETE FROM [GYM].Treino_Pessoal
        WHERE Nif_Cliente=@UserID;
        DELETE FROM [GYM].Treino_Pessoal
        WHERE Nif_Instrutor=@UserID;
    END
    IF EXISTS(SELECT * FROM [GYM].Pessoa WHERE Nif=@UserID)
    BEGIN
        DELETE FROM [GYM].Pessoa
        WHERE Nif=@UserID;
    END

--Delete plan
GO
CREATE PROCEDURE [GYM].DeletePlan @clientID INT
AS
    DECLARE @planID INT
    DECLARE @trainID INT

    IF EXISTS(SELECT * FROM [GYM].Plano WHERE Nif_Cliente=@clientID)
    BEGIN
        SELECT @planID=Numero FROM [GYM].Plano WHERE Nif_Cliente=@clientID;

        IF EXISTS(SELECT * FROM [GYM].Composicao_Plano WHERE Numero_Plano=@planID)
        BEGIN
            SELECT @trainID=ID_Treino FROM [GYM].Composicao_Plano WHERE Numero_Plano=@planID;
        END

        DELETE FROM [GYM].Plano WHERE Nif_Cliente=@clientID;
    END
    IF EXISTS(SELECT * FROM [GYM].Treino WHERE ID=@trainID)
    BEGIN
       DELETE FROM [GYM].Treino WHERE ID=@trainID;
    END

--Delete class [x]
GO
CREATE PROCEDURE [GYM].DeleteClass
    @ClassID    VARCHAR(20)
AS
    IF EXISTS(SELECT * FROM [GYM].Aula WHERE Nome=@ClassID)
    BEGIN
        DELETE FROM [GYM].Aula
        WHERE Nome = @ClassID;
    END

--Delete user from class
GO
CREATE PROCEDURE [GYM].DeleteUserFromClass
    @clientID   INT,
    @classID    VARCHAR(15)
AS
    IF EXISTS(SELECT * FROM [GYM].Cliente_Participa WHERE Nome=@classID)
    BEGIN
        DELETE FROM [GYM].Cliente_Participa
        WHERE Nif = @clientID
        AND Nome = @classID;
    END

--Delete diet
GO
CREATE PROCEDURE [GYM].DeleteDiet
    @dietID INT
AS
    IF EXISTS(SELECT * FROM [GYM].Dieta WHERE Numero=@dietID)
    BEGIN
        DELETE FROM [GYM].Dieta 
        WHERE Numero=@dietID;
    END

----------------------------------------------------------------------
-------------------------------FUNCTIONS------------------------------
----------------------------------------------------------------------

--Gets client info [x]
GO
CREATE FUNCTION [GYM].GetClientInfo (@clientID INT)
RETURNS TABLE
AS
    RETURN
    (
        SELECT P.Nome, P.Nascimento, P.Morada, C.Numero, C.Inscricao, C.Pacote, C.Numero_Horas
        FROM [GYM].Pessoa AS P
        JOIN [GYM].Cliente AS C
        ON P.Nif=C.Nif
        WHERE P.Nif=@clientID
    );

--Gets instructor info [x]
GO
CREATE FUNCTION [GYM].GetInstructorInfo (@trainerID INT)
RETURNS TABLE
AS
    RETURN
    (
        SELECT P.Nome, P.Nascimento, P.Morada, F.Numero, F.Ordenado, I.Qualificacao
        FROM [GYM].Pessoa AS P
        JOIN [GYM].Funcionario AS F
        ON P.Nif=F.Nif
        JOIN [GYM].Instrutor AS I
        ON P.Nif=I.Nif
        WHERE P.Nif=@trainerID
    );

--Gets nutritionist info [x]
GO
CREATE FUNCTION [GYM].GetNutriInfo (@nutriID INT)
RETURNS TABLE
AS
    RETURN
    (
        SELECT P.Nome, P.Nascimento, P.Morada, F.Numero, F.Ordenado
        FROM [GYM].Pessoa AS P
        JOIN [GYM].Funcionario AS F
        ON P.Nif=F.Nif
        WHERE P.Nif=@nutriID
    );
