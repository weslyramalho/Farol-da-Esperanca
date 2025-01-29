CREATE DATABASE dbrefugiados;
Use dbrefugiados;

CREATE TABLE Cidade (
id_cidade VARCHAR(10) PRIMARY KEY,
estado VARCHAR(50),
nome VARCHAR(50)
);

CREATE TABLE Pessoa (
id_pessoa VARCHAR(10) PRIMARY KEY,
nome VARCHAR(50),
sexo VARCHAR(50),
Data_nascimento DATETIME,
cpf VARCHAR(20),
id_contato VARCHAR(10),
id_endereco VARCHAR(10)
);

CREATE TABLE Voluntario (
id_voluntario VARCHAR(10) PRIMARY KEY,
id_pessoa VARCHAR(10),
FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa)
);

CREATE TABLE Contato (
id_contato VARCHAR(10) PRIMARY KEY,
email VARCHAR(50),
telefone VARCHAR(20)
);

CREATE TABLE Endereco (
logradouro VARCHAR(50),
bairro VARCHAR(50),
cep VARCHAR(20),
id_endereco VARCHAR(10) PRIMARY KEY,
id_cidade VARCHAR(10),
FOREIGN KEY(id_cidade) REFERENCES Cidade (id_cidade)
);

CREATE TABLE Educacao (
id_educacao VARCHAR(10) PRIMARY KEY,
id_professor VARCHAR(10)
);

CREATE TABLE Empresa (
cnpj VARCHAR(10) PRIMARY KEY,
razao_social VARCHAR(50),
id_endereco VARCHAR(10),
id_contato VARCHAR(10),
FOREIGN KEY(id_endereco) REFERENCES Endereco (id_endereco),
FOREIGN KEY(id_contato) REFERENCES Contato (id_contato)
);

CREATE TABLE Professor (
id_professor VARCHAR(10) PRIMARY KEY,
disciplina VARCHAR(50),
id_voluntario VARCHAR(10),
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Emprego (
id_emprego VARCHAR(10) PRIMARY KEY,
quantidade NUMERIC(10),
descricao VARCHAR(60),
cnpj VARCHAR(10),
FOREIGN KEY(cnpj) REFERENCES Empresa (cnpj)
);

CREATE TABLE Psicologo (
cfp VARCHAR(10) PRIMARY KEY,
id_voluntario VARCHAR(10),
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE  Enfermeiro (
cip VARCHAR(10) PRIMARY KEY,
id_voluntario VARCHAR(10),
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Terapeuta (
rntp VARCHAR(10) PRIMARY KEY,
id_voluntario VARCHAR(10),
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Nutricionista (
crn VARCHAR(10) PRIMARY KEY,
id_voluntario VARCHAR(10),
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Fisioterapeuta (
crefito VARCHAR(20) PRIMARY KEY,
id_voluntario VARCHAR(10),
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Medico (
especialidade VARCHAR(50),
crm VARCHAR(10) PRIMARY KEY,
id_voluntario VARCHAR(10),
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Saude (
id_saude VARCHAR(10) PRIMARY KEY,
descricao VARCHAR(60),
cfp VARCHAR(10),
cip VARCHAR(10),
rntp VARCHAR(10),
crn VARCHAR(10),
crefito VARCHAR(20),
crm VARCHAR(10),
cro VARCHAR(10),
FOREIGN KEY(cfp) REFERENCES Psicologo (cfp),
FOREIGN KEY(cip) REFERENCES  Enfermeiro (cip),
FOREIGN KEY(rntp) REFERENCES Terapeuta (rntp),
FOREIGN KEY(crn) REFERENCES Nutricionista (crn),
FOREIGN KEY(crefito) REFERENCES Fisioterapeuta (crefito),
FOREIGN KEY(crm) REFERENCES Medico (crm)
);

CREATE TABLE  Odontologo (
cro VARCHAR(10) PRIMARY KEY,
id_voluntario VARCHAR(10),
FOREIGN KEY(id_voluntario) REFERENCES Voluntario (id_voluntario)
);

CREATE TABLE Refugiado (
nacionalidade VARCHAR(50),
crnm VARCHAR(20),
descricao VARCHAR(10),
id_pessoa VARCHAR(10),
FOREIGN KEY(id_pessoa) REFERENCES Pessoa (id_pessoa)
);

ALTER TABLE Pessoa ADD FOREIGN KEY(id_contato) REFERENCES Contato (id_contato);
ALTER TABLE Pessoa ADD FOREIGN KEY(id_endereco) REFERENCES Endereco (id_endereco);
ALTER TABLE Educacao ADD FOREIGN KEY(id_professor) REFERENCES Professor (id_professor);
ALTER TABLE Saude ADD FOREIGN KEY(cro) REFERENCES  Odontologo (cro);