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
id_voluntario INT,
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
