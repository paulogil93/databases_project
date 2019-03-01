CREATE SCHEMA GYM;

GO

CREATE TABLE GYM.Pacote (
	ID							INT					NOT NULL,																			-- Identificador do pacote
	Descricao					TEXT				NOT NULL,																			-- Descricao do tipo de pacote com o numero de horas		Nome_Pacote					VARCHAR(15),
	Nome_pacote					VARCHAR(15),
	PRIMARY KEY (ID)
);

-- Entidade Geral
CREATE TABLE GYM.Pessoa (
	Nome						VARCHAR(40)			NOT NULL,
	Nascimento					DATE,
	Nif							INT					NOT NULL CHECK (Nif >= 000000000 AND Nif <= 999999999),
	Morada						VARCHAR(40),			
	Nib							INT					CHECK (Nib >= 000000000000000000000 AND Nib <= 999999999999999999999),				-- Nib pode ser vazio caso o cliente pague a mensalidade no ginasio
	PRIMARY KEY (Nif)
);

-- Entidade derivada da Pessoa por heranca
CREATE TABLE GYM.Cliente (
	Nif							INT					NOT NULL CHECK (Nif >= 000000000 AND Nif <= 999999999),								-- Chave herdada de Pessoa
	Numero						INT				    NOT NULL CHECK (Numero > 0),														-- Numero de Cliente Socio
	Inscricao					DATE,
	Pacote						INT					NOT NULL,
	Numero_horas				INT					CHECK (Numero_Horas >= 0),
	PRIMARY KEY (Nif),
	FOREIGN KEY (Nif) REFERENCES GYM.Pessoa (Nif) ON DELETE CASCADE,
	FOREIGN KEY (Pacote) REFERENCES GYM.Pacote (ID) ON DELETE CASCADE ON UPDATE CASCADE												-- O pacote pode ser alterado
);

/* Duvida 
	Na tabela do cliente, faz sentido ter um instrutor que pode estar a null??
	Teria demasiados null's, perguntar se nao fica melhor criar um tabela para a relacao "Treina"
	Resposta: Criar uma tabela Personal_Training que relacione a table cliente e instrutor 
*/

-- Entidade derivada da Pessoa por heranca
CREATE TABLE GYM.Funcionario (
	Nif							INT					NOT NULL CHECK (Nif >= 000000000 AND Nif <= 999999999),								-- Chave herdada de Pessoa
	Numero						INT				    NOT NULL CHECK (Numero > 0),														-- Numero de Funcionario
	Ordenado					INT					CHECK (Ordenado > 580),																-- Ordenado minimo em 2018
	PRIMARY KEY (Nif),
	FOREIGN KEY (Nif) REFERENCES GYM.Pessoa (Nif) ON DELETE CASCADE
);

-- Entidade derivada do Funcionario por heranca
CREATE TABLE GYM.Instrutor (
	Nif							INT					NOT NULL CHECK (Nif >= 000000000 AND Nif <= 999999999),
	Qualificacao				VARCHAR(50),																							-- Descricao das qualificacoes do instrutor
	PRIMARY KEY (Nif),
	FOREIGN KEY (Nif) REFERENCES GYM.Funcionario (Nif) ON DELETE CASCADE																								
);


--USE p1g1;

--GO

CREATE TABLE GYM.Treino_Pessoal (
	Nif_Cliente					INT					NOT NULL CHECK (Nif_Cliente >= 000000000 AND Nif_Cliente <= 999999999),
	Nif_Instrutor				INT					NOT NULL CHECK (Nif_Instrutor >= 000000000 AND Nif_Instrutor <= 999999999),
	PRIMARY KEY (Nif_Cliente, Nif_Instrutor),
	FOREIGN KEY (Nif_Cliente) REFERENCES GYM.Cliente (Nif),
	FOREIGN KEY (Nif_Instrutor) REFERENCES GYM.Instrutor (Nif)																			-- Não é necessário Constraints pois já se faz o ON DELETE CASCADE no Instrutor e no Cliente				
);

-- Entidade derivada do Funcionario por heranca
CREATE TABLE GYM.Nutricionista (
	Nif							INT					NOT NULL CHECK (Nif >= 000000000 AND Nif <= 999999999),
	PRIMARY KEY (Nif),
	FOREIGN KEY (Nif) REFERENCES GYM.Funcionario (Nif) ON DELETE CASCADE
);

-- Entidade com relacao com o cliente
CREATE TABLE GYM.Aula (
	Nome						VARCHAR(20)			NOT NULL,
	Descricao					VARCHAR(50),																								-- Descricao de que tipo de aula é	
	PRIMARY KEY (Nome)
);

--------Verificado daqui para tras------------------

--------Instancia aula-> hora, data e nome como chaves primarias
--------Cliente_participa -> Nif do cliente,  data hora e nome como chaves primárias

CREATE TABLE GYM.Instancia_Aula (
	Nome						VARCHAR(20)			NOT NULL,
	Vagas						INT					NOT NULL CHECK (Vagas > 0),
	Hora						TIME				NOT NULL,
	Duracao						INT					NOT NULL CHECK (Duracao > 0),															-- Duração da aula em minutos
	Data						DATE				NOT NULL,
	PRIMARY KEY (Nome, Hora, Data),																											-- Os 3 juntos identificam
	FOREIGN KEY (Nome) REFERENCES GYM.Aula (Nome) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Relacao N para M entre o cliente e a Instancia da aula
CREATE TABLE GYM.Cliente_Participa (
	Nif							INT					NOT NULL CHECK (Nif >= 000000000 AND Nif <= 999999999),
	Nome						VARCHAR(20)			NOT NULL,
	Data						DATE				NOT NULL,
	Hora						TIME				NOT NULL,
	PRIMARY KEY (Nif, Nome, Hora, Data),
	FOREIGN KEY (Nif) REFERENCES GYM.Cliente (Nif) ON DELETE CASCADE,
	FOREIGN KEY (Nome, Hora, Data) REFERENCES GYM.Instancia_Aula (Nome, Hora, Data) ON DELETE CASCADE ON UPDATE CASCADE					-- Verificar se está correto
);

/* DUVIDA 
	Na relacao participa, em vez da chave primária Nif do cliente nao podemos meter com chave o numero do cliente para ser mais facil
*/

-- Relacao N para M entre o Instrutor e a Instancia da aula
CREATE TABLE GYM.Da_Aula (
	Nif							INT					NOT NULL CHECK (Nif >= 000000000 AND Nif <= 999999999),
	Nome						VARCHAR(20)			NOT NULL,
	Data						DATE				NOT NULL,
	Hora						TIME				NOT NULL,
	PRIMARY KEY (Nif, Nome, Hora, Data),
	FOREIGN KEY (Nif) REFERENCES GYM.Instrutor (Nif) ON DELETE CASCADE,
	FOREIGN KEY (Nome, Hora, Data) REFERENCES GYM.Instancia_Aula (Nome, Hora, Data) ON DELETE CASCADE ON UPDATE CASCADE
);


--------Verificado daqui para tras----------------

CREATE TABLE GYM.Plano (
	Numero						INT					NOT NULL CHECK (Numero > 0),
	Nif_Instrutor				INT					CHECK (Nif_Instrutor >= 000000000 AND Nif_Instrutor <= 999999999),
	Nif_Cliente					INT					CHECK (Nif_Cliente >= 000000000 AND Nif_Cliente <= 999999999),
	PRIMARY KEY (Numero),
	FOREIGN KEY (Nif_Instrutor) REFERENCES GYM.Instrutor (Nif),														-- Verificar a condição ( o instrutor e o cliente podem ser eliminados mas o plano mantem-se)
	FOREIGN KEY (Nif_Cliente) REFERENCES GYM.Cliente (Nif),
);

CREATE TABLE GYM.Treino (
	ID							INT					NOT NULL CHECK (ID > 0),
	PRIMARY KEY (ID)
);

-- Relação N para M entre Plano e Treino
CREATE TABLE GYM.Composicao_Plano (
	Numero_Plano				INT					NOT NULL CHECK (Numero_Plano > 0),
	ID_Treino					INT					NOT NULL CHECK (ID_Treino > 0),
	PRIMARY KEY (Numero_Plano, ID_Treino),
	FOREIGN KEY (Numero_Plano) REFERENCES GYM.Plano (Numero) ON DELETE CASCADE,
	FOREIGN KEY (ID_Treino) REFERENCES GYM.Treino (ID) ON DELETE CASCADE
);

CREATE TABLE GYM.Exercicio (
	Codigo						INT					NOT NULL CHECK (Codigo > 0),
	Descricao					TEXT,
	PRIMARY KEY (Codigo)
);

-- Relação N para M entre Treino e Exercicio
CREATE TABLE GYM.Composicao_Treino (
	ID_Treino					INT					NOT NULL CHECK (ID_Treino > 0),
	Codigo_Exercicio			INT					NOT NULL CHECK (Codigo_Exercicio > 0),
	Duracao						INT,																										-- Tempo (ex:cardio)						
	Descanso					INT,																										-- Tempo de descanso										
	Series						INT					NOT NULL CHECK (Series > 0),
	PRIMARY KEY (ID_Treino, Codigo_Exercicio),
	FOREIGN KEY (ID_Treino) REFERENCES GYM.Treino (ID) ON DELETE CASCADE,
	FOREIGN KEY (Codigo_Exercicio) REFERENCES GYM.Exercicio (Codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

------- Começo da aula ----------
CREATE TABLE GYM.Dieta (
	Numero						INT					NOT NULL CHECK (Numero > 0),
	PRIMARY KEY (Numero)
);

CREATE TABLE GYM.Alimento (
	ID						    INT					NOT NULL CHECK (ID > 0),
	Nome						VARCHAR(30)			NOT NULL,
	PRIMARY KEY (ID)
);

-- Relação N para M entre a Dieta e o Alimento
CREATE TABLE GYM.Composicao_Dieta (
	Numero_Dieta				INT					NOT NULL CHECK (Numero_Dieta > 0),
	ID_Alimento					INT					NOT NULL CHECK (ID_Alimento > 0),
	Percentagem					INT					NOT NULL CHECK (Percentagem > 0),
	PRIMARY KEY (Numero_Dieta, ID_Alimento),
	FOREIGN KEY (Numero_Dieta) REFERENCES GYM.Dieta (Numero) ON DELETE CASCADE,
	FOREIGN KEY (ID_Alimento) REFERENCES GYM.Alimento (ID) ON DELETE CASCADE
);

CREATE TABLE GYM.Instancia_Dieta (
	Descricao					TEXT				NOT NULL, 
	Nif_Nutricionista			INT					NOT NULL CHECK (Nif_Nutricionista >= 000000000 AND Nif_Nutricionista <= 999999999),
	Numero						INT					NOT NULL CHECK (Numero > 0),
	PRIMARY KEY (Numero, Nif_Nutricionista),
	FOREIGN KEY (Numero) REFERENCES GYM.Dieta (Numero) ON DELETE CASCADE
);

-- Relação entre o Cliente e a Instancia_Dieta
CREATE TABLE GYM.Tem_Dieta (
	Nif_Cliente					INT					NOT NULL CHECK (Nif_Cliente >= 000000000 AND Nif_Cliente <= 999999999),
	Nif_Nutricionista			INT					NOT NULL CHECK (Nif_Nutricionista >= 000000000 AND Nif_Nutricionista <= 999999999),
	Numero_Dieta				INT					NOT NULL CHECK (Numero_Dieta > 0),
	PRIMARY KEY (Nif_Cliente, Nif_Nutricionista, Numero_Dieta),
	FOREIGN KEY (Numero_Dieta, Nif_Nutricionista) REFERENCES GYM.Instancia_Dieta (Numero, Nif_Nutricionista) ON DELETE CASCADE,
	FOREIGN KEY (Nif_Cliente) REFERENCES GYM.CLiente (Nif) ON DELETE CASCADE
);

CREATE TABLE GYM.Login
(
    ID							INT IDENTITY(1,1)	NOT NULL,
    username					VARCHAR(15)			NOT NULL,
    userpass					VARCHAR(32)			NOT NULL,
    person_id					INT,
    type						VARCHAR(15),
    PRIMARY KEY(ID),
    FOREIGN KEY(person_id) REFERENCES GYM.Pessoa(Nif)
);








