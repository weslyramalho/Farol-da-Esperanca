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

  


  
