
-- Pacotes
INSERT INTO GYM.Pacote VALUES ('20', 'Pacote de 20 horas semanais com um custo de 20 euros por mês');
INSERT INTO GYM.Pacote VALUES ('25', 'Pacote de 25 horas semanais com um custo de 25 euros por mês');
INSERT INTO GYM.Pacote VALUES ('30', 'Pacote de 30 horas semanais com um custo de 30 euros por mês');
INSERT INTO GYM.Pacote VALUES ('35', 'Pacote de 35 horas semanais com um custo de 35 euros por mês');
INSERT INTO GYM.Pacote VALUES ('40', 'Pacote livre trânsito com um custo de 40 euros por mês');

-- Pessoas
INSERT INTO GYM.Pessoa VALUES ('Tiago Almeida', '1996-08-09', '254601669', 'Rua dos Carreiros', /*'125632145871253654781'*/NULL);		-- Cliente 
INSERT INTO GYM.Pessoa VALUES ('Bruno Oliveira', '1992-05-09', '236601779', 'Rua do Porto', /*'365485645873653654781'*/NULL);			-- Funcionario/Instrutor
INSERT INTO GYM.Pessoa VALUES ('Rui Gomes', '1993-02-10', '569608979', 'Rua do Pinhal', /*'365425647895653652541'*/NULL);				-- Funcionario/Instrutor
INSERT INTO GYM.Pessoa VALUES ('José Pedro', '1996-07-27', '156242589', 'Rua da Almeira', /*'369852643654153678945'*/NULL);				-- Cliente
INSERT INTO GYM.Pessoa VALUES ('Sergio Veloso', '1992-01-11', '148508858', 'Rua das Oliveiras', /*'125478936547893325647'*/NULL);		-- Funcionario/Nutricionista

-- Clientes
INSERT INTO GYM.Cliente VALUES ('254601669', '1', '2018-05-2', '35');
INSERT INTO GYM.Cliente VALUES ('156242589', '2', '2018-05-2', '30');


-- Funcionarios
INSERT INTO GYM.Funcionario VALUES ('236601779', '1', '900');
INSERT INTO GYM.Funcionario VALUES ('569608979', '2', '1000');
INSERT INTO GYM.Funcionario VALUES ('148508858', '3', '1300');

-- Instrutor
INSERT INTO GYM.Instrutor VALUES ('236601779', 'Curso superior de Educação Fisica');
INSERT INTO GYM.Instrutor VALUES ('569608979', 'Curso superior de Educação Fisica');

-- Treino Pessoal
INSERT INTO GYM.Treino_Pessoal VALUES ('254601669', '236601779');

-- Nutricionista
INSERT INTO GYM.Nutricionista VALUES ('148508858');

-- Aula
INSERT INTO GYM.Aula VALUES ('Funcional', 'Desenvolvimento de todo o corpo');
INSERT INTO GYM.Aula VALUES ('Cycling', 'Uso de uma bicleta');
INSERT INTO GYM.Aula VALUES ('DCross', 'Técnicas de Crossfit');
INSERT INTO GYM.Aula VALUES ('BBFit', 'Trabalho do gluteo');

-- Instancia Aula
INSERT INTO GYM.Instancia_Aula VALUES ('Funcional', '30', '19:00:00', '45', '2018-05-25');

-- Cliente_Participa
INSERT INTO GYM.Cliente_Participa VALUES ('254601669', 'Funcional', '2018-05-25', '19:00:00');


-- Da_Aula
INSERT INTO GYM.Da_Aula VALUES ('236601779', 'Funcional', '2018-05-25', '19:00:00');

-- Plano
INSERT INTO GYM.Plano VALUES ('1', '236601779', '156242589');

-- Treino 
INSERT INTO GYM.Treino VALUES ('1');

-- Composição do plano
INSERT INTO GYM.Composicao_Plano VALUES ('1', '1');

-- Exercicio
INSERT INTO GYM.Exercicio VALUES ('1', 'Supino Inclinado');
INSERT INTO GYM.Exercicio VALUES ('2', 'Remada');
INSERT INTO GYM.Exercicio VALUES ('3', 'Puxada');
INSERT INTO GYM.Exercicio VALUES ('4', 'Passadeira');

-- Composição do treino 
INSERT INTO GYM.Composicao_Treino VALUES ('1', '1', NULL, '1', '4');
INSERT INTO GYM.Composicao_Treino VALUES ('1', '2', NULL, '1', '4');
INSERT INTO GYM.Composicao_Treino VALUES ('1', '3', NULL, '1', '4');
INSERT INTO GYM.Composicao_Treino VALUES ('1', '4', '10', NULL, '1');

-- Dieta
INSERT INTO GYM.Dieta VALUES ('1');

-- Alimento
INSERT INTO GYM.Alimento VALUES ('1', 'Batata Doce');
INSERT INTO GYM.Alimento VALUES ('2', 'Pescada');
INSERT INTO GYM.Alimento VALUES ('3', 'Peito de Frango');
INSERT INTO GYM.Alimento VALUES ('4', 'Couve');
INSERT INTO GYM.Alimento VALUES ('5', 'Broculo');

-- Composição da Dieta
INSERT INTO GYM.Composicao_Dieta VALUES ('1', '1', '30');
INSERT INTO GYM.Composicao_Dieta VALUES ('1', '2', '50');
INSERT INTO GYM.Composicao_Dieta VALUES ('1', '4', '10');
INSERT INTO GYM.Composicao_Dieta VALUES ('1', '5', '10');

-- Instancia Dieta
INSERT INTO GYM.Instancia_Dieta VALUES ('Dieta para uma perda de massa gorda e mantimento do volume muscular', '148508858', '1');

-- Tem Dieta
INSERT INTO GYM.Tem_Dieta VALUES ('254601669', '148508858', '1');

-- Alterações pós implementação 
INSERT INTO [GYM].Pessoa VALUES('Pedro Dias', '1970-05-18', 101202303, 'Penalva, Viseu', NULL);
INSERT INTO [GYM].Cliente VALUES(101202303, 78459, '2018-04-24', 25);
 
INSERT INTO [GYM].Pessoa VALUES('Afonso Tomás', '1993-10-01', 145987362, 'Lousã, Lisboa', NULL);
INSERT INTO [GYM].Funcionario VALUES(145987362, 5874, 1200);
INSERT INTO [GYM].Instrutor VALUES(145987362, 'Desporto');
 
INSERT INTO [GYM].Pessoa VALUES('Américo Amorim', '1968-12-10', 102365789, 'Aveiro', NULL);
INSERT INTO [GYM].Funcionario VALUES(102365789, 4587, 1000);
INSERT INTO [GYM].Nutricionista VALUES(102365789);
 
INSERT INTO [GYM].Login VALUES('admin','21232f297a57a5a743894a0e4a801fc3',NULL,'admin');
INSERT INTO [GYM].Login VALUES('trainer','2c065aae9fcb37b49043a5a2012b3dbf',145987362,'trainer');
INSERT INTO [GYM].Login VALUES('nutritionist','df18f02e51aab112110baac522ce4776',102365789,'nutricionist');
INSERT INTO [GYM].Login VALUES('pedrodias','26afa3497042950ad17ec5fb29ad8565',101202303,'client');