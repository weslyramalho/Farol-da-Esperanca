![logo](https://github.com/weslyramalho/Farol-da-Esperanca/blob/main/images/logo-inicial.svg)

# Farol da Esperança

## Banco de Dados

### Modelo conceitual
![conceitual](https://github.com/weslyramalho/Farol-da-Esperanca/blob/main/Banco%20de%20dados/modelo_conceitual.jpg)


### Modelo logico

![logico](https://github.com/weslyramalho/Farol-da-Esperanca/blob/main/Banco%20de%20dados/modelo%20logico.jpg)

### Modelo fisico
```
CREATE DATABASE dbrefugiados;
Use dbrefugiados;

CREATE TABLE Cidade (
id_cidade INT PRIMARY KEY AUTO_INCREMENT,
estado VARCHAR(100) NOT NULL,
nome VARCHAR(100) NOT NULL
);

CREATE TABLE Pessoa (
id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
sexo VARCHAR(100),
Data_nascimento DATETIME,
cpf VARCHAR(14) UNIQUE,
id_contato INT,
id_endereco INT
);

CREATE TABLE Voluntario (
id_voluntario INT PRIMARY KEY AUTO_INCREMENT,
id_pessoa INT,
FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa)
);

CREATE TABLE Contato (
id_contato INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(100) UNIQUE,
telefone VARCHAR(20)
);

CREATE TABLE Endereco (
logradouro VARCHAR(200) NOT NULL,
bairro VARCHAR(100) NOT NULL,
cep VARCHAR(14) NOT NULL,
id_endereco INT PRIMARY KEY AUTO_INCREMENT,
id_cidade INT,
FOREIGN KEY(id_cidade) REFERENCES Cidade (id_cidade)
);

CREATE TABLE Educacao (
id_educacao INT PRIMARY KEY AUTO_INCREMENT,
id_professor INT,
crnm VARCHAR(20)
);

CREATE TABLE Empresa (
cnpj VARCHAR(20) PRIMARY KEY,
razao_social VARCHAR(100),
id_endereco INT,
id_contato INT,
FOREIGN KEY(id_endereco) REFERENCES Endereco (id_endereco),
FOREIGN KEY(id_contato) REFERENCES Contato (id_contato)
)
;
CREATE TABLE Professor (
id_professor INT PRIMARY KEY AUTO_INCREMENT,
disciplina VARCHAR(100),
id_voluntario INT,
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Emprego (
id_emprego INT PRIMARY KEY AUTO_INCREMENT,
quantidade NUMERIC(10),
descricao VARCHAR(200),
crnm VARCHAR(20),
cnpj VARCHAR(20),
FOREIGN KEY(cnpj) REFERENCES Empresa (cnpj)
);

CREATE TABLE Psicologo (
cfp VARCHAR(20) PRIMARY KEY,
id_voluntario INT,
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE  Enfermeiro (
cip VARCHAR(20) PRIMARY KEY,
id_voluntario INT,
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Terapeuta (
rntp VARCHAR(20) PRIMARY KEY,
id_voluntario INT,
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Nutricionista (
crn VARCHAR(20) PRIMARY KEY,
id_voluntario INT,
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Fisioterapeuta (
crefito VARCHAR(20) PRIMARY KEY,
id_voluntario INT,
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Medico (
especialidade VARCHAR(100),
crm VARCHAR(20) PRIMARY KEY,
id_voluntario INT,
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Saude (
id_saude INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR(100),
crnm VARCHAR(20),
cfp VARCHAR(20),
cip VARCHAR(20),
rntp VARCHAR(20),
crn VARCHAR(20),
crefito VARCHAR(20),
crm VARCHAR(20),
cro VARCHAR(20),
FOREIGN KEY(cfp) REFERENCES Psicologo (cfp),
FOREIGN KEY(cip) REFERENCES  Enfermeiro (cip),
FOREIGN KEY(rntp) REFERENCES Terapeuta (rntp),
FOREIGN KEY(crn) REFERENCES Nutricionista (crn),
FOREIGN KEY(crefito) REFERENCES Fisioterapeuta (crefito),
FOREIGN KEY(crm) REFERENCES Medico (crm)
);

CREATE TABLE  Odontologo (
cro VARCHAR(20) PRIMARY KEY,
id_voluntariO INT,
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Refugiado (
nacionalidade VARCHAR(100),
descricao VARCHAR(200),
crnm VARCHAR(20) PRIMARY KEY,
id_pessoa INT,
FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa)
);

ALTER TABLE Pessoa ADD FOREIGN KEY(id_contato) REFERENCES Contato (id_contato);
ALTER TABLE Pessoa ADD FOREIGN KEY(id_endereco) REFERENCES Endereco (id_endereco);
ALTER TABLE Educacao ADD FOREIGN KEY(id_professor) REFERENCES Professor (id_professor);
ALTER TABLE Educacao ADD FOREIGN KEY(crnm) REFERENCES Refugiado (crnm);
ALTER TABLE Emprego ADD FOREIGN KEY(crnm) REFERENCES Refugiado (crnm);
ALTER TABLE Saude ADD FOREIGN KEY(crnm) REFERENCES Refugiado (crnm);
ALTER TABLE Saude ADD FOREIGN KEY(cro) REFERENCES  Odontologo (cro);

```
### Entidades
* Cidade
   * id_cidade -> Recebe um id aleatório.
   * estado -> Estado a qual a cidade pertece.
   * nome - > nome da cidade.
* Endereço
  * logradouro -> Nome da rua, avenida, que identifica o endereço no bairro.
  * bairro -> nome do bairro.
  * CEP -> Código de Endereçamento Postal.
  * id_endereco -> Recebe um id aleatório.
  * id_cidade -> recebe o id da tabela cidade.
* Pessoa
    * id_pessoa -> Recebe um id aleatótio.
    * nome -> nome da pessoa.
    * sexo -> sexo.
    * Data_nascimento -> Data de nascimento.
    * CPF -> Cadastro de Pessoa Física.
    * id_contato -> recebe o id da tabela contato.
    * id_endereco -> recebe o id da tabela endereco.
* Contato
    * id_contato - > Recebe um id aleatório.
    * email -> recebe o enderço de email.
    * telefone -> número de telefone. 
* Empresa
    * CNPJ -> Cadastro Nacional da Pessoa Jurídica.
    * razao_social -> Nome da razão social da empresa.
    * id_endereco -> Recebe o id da tabela endereço.
    * id_contato ->  Recebe o id da tabela contato.
* Emprego
    * id_emprego -> Recebe um id aleatório.
    * quantidade -> Recebe o numero de vagas de cada empresa.
    * descricao - > Recebe uma descrição da vaga.
    * crnm -> Carteira de registro nacional migratório.
    * cnpj -> cnpj da empresa que esta relacionada a vaga de emprego.
* Voluntário
    * id_voluntario -> Recebe um id aleatório.
    * id_pessoa -> Recebe o id da tabela pessoa.
* Professor
    * id_professor -> Recebe um id aleatório.
    * disciplina -> Disciplina que o professor leciona.
* Educação
    * id_educacao -> Recebe um id aleatório.
    * id_professor -> Recebe o id da tabela professor.
    * crnm -> Carteira de registro nacional migratório.
* Refugiado
    * nacionalidade -> nacionalidade do refúgiado.
    *  crnm -> Carteira de registro nacional migratório.
    *  descricao -> descrição do refúgiado.
    *  id_pessoa -> Recebe o id da tabela pessoa.
* Psicólogo
    * cfp -> Registro de Especialista em Psicologia.
    * id_voluntario -> id da tabela voluntário.
* Enfermeiro
    * id_voluntario -> id da tabela voluntário.
    * cip -> Carteira de Identidade Profissional.
* Nutricionista
    * id_voluntario -> id da tabela voluntário.
    * crn -> Conselho Regional de Nutricionistas.
* Terapeuta
    * id_voluntario -> id da tabela voluntário.
    * rntp -> Registro Nacional de Terapeutas e Psicanalistas.
* Fisioterapeuta
    * id_voluntario -> id da tabela voluntário.
    * crefito -> Conselho Regional de Fisioterapia e Terapia Ocupacional.
* Médico
    * id_voluntario -> id da tabela voluntário.
    * especialidade -> especialidade do médico.
    * crm -> Conselho Regional de Medicina.
* Odontólogo
    * id_voluntario -> id da tabela voluntário.
    * cro ->  Conselho Regional de Odontologia.
* saúde
    * id_saude -> Recebe um id aleatório.
    * descricao -> descrição do atendimento.
    * crnm -> Carteira de registro nacional migratório da tabela refúgiado.
    *  cfp -> Registro de Especialista em Psicologia da tabela psicologo.
    *  cip -> Carteira de Identidade Profissional da tablea enfermeiro.
    *  rntp -> Registro Nacional de Terapeutas e Psicanalistas da tabela terapeuta.
    *  crn -> Conselho Regional de Nutricionistas da tabela nutricionista.
    *  crefito -> Conselho Regional de Fisioterapia e Terapia Ocupacional da tabela fisioterapeuta.
    *  crm -> Conselho Regional de Medicina da tabela medico.
    *  cro ->  Conselho Regional de Odontologia da tabela odontologo.

## Exemplos de dados para teste no Banco de dados

#### Dados tabela cidade
```
INSERT INTO cidade (estado, nome) VALUES
('SP', 'São Paulo'),
('RJ', 'Rio de Janeiro'),
('MG', 'Belo Horizonte'),
('BA', 'Salvador'),
('DF', 'Brasília'),
('CE', 'Fortaleza'),
('PE', 'Recife'),
('RS', 'Porto Alegre'),
('PR', 'Curitiba'),
('GO', 'Goiânia'),
('AM', 'Manaus'),
('PA', 'Belém'),
('SP', 'Guarulhos'),
('SP', 'Campinas'),
('RJ', 'Duque de Caxias'),
('BA', 'Feira de Santana'),
('PE', 'Jaboatão dos Guararapes'),
('RS', 'Canoas'),
('MG', 'Contagem'),
('PR', 'São José dos Pinhais');

```

#### Dados tabela endereco

```
INSERT INTO endereco (logradouro, bairro, cep, id_cidade) VALUES
('Rua das Flores', 'Jardim Primavera', '13000-000', 1),
('Avenida Paulista', 'Bela Vista', '01311-920', 20),
('Rua Augusta', 'Consolação', '01305-902', 15),
('Rua da Bahia', 'Centro', '40000-000', 10),
('Avenida Atlântica', 'Copacabana', '22021-001', 6),
('Rua do Matoso', 'Rio Comprido', '20270-132', 5),
('Rua Chile', 'Centro', '20031-120', 2),
('Rua 24 de Maio', 'República', '01228-000', 4),
('Avenida Ipiranga', 'Centro', '01042-000', 3),
('Rua Barão de Mauá', 'Vila Madalena', '05433-030', 7),
('Rua Oscar Freire', 'Jardins', '01426-001', 8),
('Rua Haddock Lobo', 'Cerqueira César', '01414-001', 10),
('Rua Bela Cintra', 'Consolação', '01415-001', 11),
('Avenida Brigadeiro Faria Lima', 'Itaim Bibi', '04534-900', 14),
('Rua Tabapuã', 'Itaim Bibi', '04533-000', 15),
('Rua dos Pinheiros', 'Pinheiros', '05422-000', 16 ),
('Rua Teodoro Sampaio', 'Pinheiros', '05405-150', 17),
('Avenida Rebouças', 'Pinheiros', '05402-000', 18),
('Rua da Consolação', 'Consolação', '01302-907', 19),
('Rua Alagoas', 'Higienópolis', '01244-902', 20);

```
#### Dados tabela contato

```
INSERT INTO contato (email, telefone) VALUES
('ana.silva@email.com', '11999998888'),
('joao.pereira@email.com', '21988887777'),
('maria.souza@email.com', '31977776666'),
('pedro.rodrigues@email.com', '41966665555'),
('juliana.almeida@email.com', '51955554444'),
('bruno.oliveira@email.com', '61944443333'),
('fernanda.costa@email.com', '71933332222'),
('ricardo.barros@email.com', '81922221111'),
('patricia.martins@email.com', '91911110000'),
('marcelo.santos@email.com', '12987654321'),
('isabela.andrade@email.com', '23976543210'),
('rafael.lima@email.com', '34965432109'),
('beatriz.ferreira@email.com', '45954321098'),
('gustavo.carvalho@email.com', '56943210987'),
('carolina.melo@email.com', '67932109876'),
('eduardo.viana@email.com', '78921098765'),
('gabriela.porto@email.com', '89910987654'),
('thiago.nunes@email.com', '90909876543'),
('renata.leite@email.com', '13980765432'),
('vinicius.dias@email.com', '24970654321');
```

#### Dados tabela pessoa

```
INSERT INTO pessoa (nome, sexo, Data_nascimento, cpf, id_contato, id_endereco) VALUES
('Ana Maria Silva', 'F', '1985-03-15', '123.456.789-00', 1, 1),
('João Pedro Oliveira', 'M', '1992-07-22', '987.654.321-11', 2, 2),
('Maria Clara Souza', 'F', '1988-11-08', '456.789.123-22', 3, 3),
('Pedro Henrique Santos', 'M', '1995-04-19', '789.123.456-33', 4, 4),
('Juliana Almeida Costa', 'F', '1990-09-25', '101.112.131-44', 5, 5),
('Bruno Ferreira Lima', 'M', '1987-01-12', '213.141.151-55', 6, 6),
('Fernanda Carvalho', 'F', '1993-06-05', '316.171.181-66', 7, 7),
('Ricardo Barros Melo', 'M', '1989-12-18', '419.202.212-77', 8, 8),
('Patrícia Viana Nunes', 'F', '1991-08-02', '522.232.242-88', 9, 9),
('Marcelo Porto Dias', 'M', '1994-02-27', '625.262.272-99', 10, 10),
('Isabela Andrade', 'F', '1986-05-14', '728.292.302-01', 11, 11),
('Rafael Lima', 'M', '1996-10-30', '831.323.333-02', 12, 12),
('Beatriz Ferreira', 'F', '1992-03-07', '934.353.363-03', 13, 13),
('Gustavo Carvalho', 'M', '1988-07-11', '037.383.393-04', 14, 14),
('Carolina Melo', 'F', '1995-11-23', '140.414.424-05', 15, 15),
('Eduardo Viana', 'M', '1990-04-09', '243.444.454-06', 16, 16),
('Gabriela Porto', 'F', '1987-08-16', '346.474.484-07', 17, 17),
('Thiago Nunes', 'M', '1993-12-03', '449.505.515-08', 18, 18),
('Renata Leite', 'F', '1991-06-20', '552.535.545-09', 19, 19),
('Vinícius Dias', 'M', '1994-06-24', '000.000.222-00', 20, 20)
```

#### Dados tabela empresa

```
INSERT INTO empresa (cnpj, razao_social, id_endereco, id_contato) VALUES
('12.345.678/0001-90', 'Empresa de Tecnologia Alfa', 1, 1),
('98.765.432/0001-80', 'Distribuidora Beta Ltda.', 2, 2),
('55.444.333/0001-70', 'Indústria Gama S.A.', 3, 3),
('22.333.444/0001-60', 'Comércio Delta Varejista', 4, 4),
('88.999.000/0001-50', 'Serviços Épsilon Ltda.', 5, 5),
('11.222.333/0001-40', 'Consultoria Zeta S.A.', 6, 6),
('44.555.666/0001-30', 'Transportadora Eta Ltda.', 7, 7),
('77.888.999/0001-20', 'Editora Teta S.A.', 8, 8),
('33.444.555/0001-10', 'Construtora Iota Ltda.', 9, 9),
('66.777.888/0001-00', 'Agência Kappa de Marketing', 10, 10);
```
#### Dados voluntario

```
INSERT INTO voluntario (id_pessoa)
VALUES
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);
```
#### Dados professor

```
INSERT INTO professor (disciplina, id_voluntario)
VALUES
('Português',1),
('Historia' ,2);
```
#### Dados refugiados
  
```
INSERT INTO refugiado (nacionalidade, descricao, crnm, id_pessoa)
VALUES
('Síria', 'Fugindo da guerra', '00000000001', 1),
('Afeganistão', 'Buscando segurança', '00000000002', 2),
('Sudão do Sul', 'Crise humanitária', '00000000003', 3),
('Myanmar', 'Perseguição religiosa', '00000000004', 4),
('Venezuela', 'Crise política e econômica', '00000000005', 5),
('República Democrática do Congo', 'Conflitos e violência', '00000000006', 6),
('Somália', 'Seca e fome', '00000000007', 7),
('Iraque', 'Instabilidade política', '00000000008', 8),
('Eritreia', 'Ditadura e serviço militar obrigatório', '00000000009', 9),
('Nigéria', 'Violência e Boko Haram', '00000000011', 10);
```

#### Dados educaçao

```
INSERT INTO educacao (id_professor, crnm)
VALUES
(3, '00000000001'),
(3, '00000000002'),
(4, '00000000003');
```

#### Dados emprego

```
INSERT INTO emprego (quantidade, descricao, crnm, cnpj)
VALUES
(1, 'Pedreiro', '00000000004', '33.444.555/0001-10'),
(1, 'Entregador','00000000005', '98.765.432/0001-80'),
(1, 'Vendedor', '00000000006', '12.345.678/0001-90');

```

#### Dados enfermeiro
 ```
 INSERT INTO enfermeiro (cip, id_voluntario)
VALUES
('100000000001', 3);

 ```

 #### Ddaos fisioterapeuta

 ```
 INSERT INTO fisioterapeuta (crefito, id_voluntario)
VALUES
('200000000002', 4);
 ```

 #### Dados medico

 ```
 INSERT INTO medico (especialidade, crm, id_voluntario)
VALUES
('Clinico geral',, 5);

 ```

 #### Dados nutricionista

 ```
 INSERT INTO nutricionista (crn, id_voluntario)
VALUES
('400000000004', 6);
 ```
 #### Dados odontologo

 ```
 INSERT INTO odontologo (cro, id_voluntario)
VALUES
('500000000005', 7);
```

#### Dados psicologo

```
INSERT INTO psicologo (cfp, id_voluntario)
VALUES
('600000000006', 8);
```

#### Dados terepeuta

```
INSERT INTO terapeuta (rntp, id_voluntario)
VALUES
('700000000007', 9);
```

#### Dados saude

```
INSERT INTO saude (descricao, crnm, cfp, cip, rntp, crn, crefito, crm, cro)
VALUES
('Paciente debilitado', '00000000006','600000000006', '100000000001', '700000000007',  '400000000004', '200000000002', '300000000003', '500000000005'),
('Transtorno alimentar', '00000000007','600000000006', '100000000001', '700000000007',  '400000000004', '200000000002', '300000000003', '500000000005'),
('Desnutrição', '00000000008','600000000006', '100000000001', '700000000007',  '400000000004', '200000000002', '300000000003', '500000000005'),
('Falta de ar', '00000000009','600000000006', '100000000001', '700000000007',  '400000000004', '200000000002', '300000000003', '500000000005'),
('Gripe', '00000000011','600000000006', '100000000001', '700000000007',  '400000000004', '200000000002', '300000000003', '500000000005');

```
