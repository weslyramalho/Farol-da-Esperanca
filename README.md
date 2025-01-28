# Farol da Esperança

## Banco de Dados
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

  


  
