Feature: Cadastro

  Scenario: Criar cadastro com dados válidos
    Given que o usuário acessou tela de cadastro
    When o usuário insere o nome "Mailton Nascimento" no campo Nome Completo
    And o usuário insere o cpf "11111111111" no campo CPF
    And o usuário insere o ddd "92" no campo DDD
    And o usuário insere o celular "992478097" no campo Número Celular
    And o usuário insere a senha "Senha123" no campo Senha
    And o usuário insere a senha "Senha123" no campo Confirmar Senha
    And o usuário clica no botão "Cadastrar-se"
    Then o usuário é direcionado para a tela de confirmação de número

  Scenario:  Criar cadastro sem o campo Nome Completo preenchido
    Given que o usuário acessou tela de cadastro
    When o usuário não preenche o campo Nome Completo
    And o usuário insere o cpf "11111111111" no campo CPF
    And o usuário insere o ddd "92" no campo DDD
    And o usuário insere o celular "992478097" no campo Número Celular
    And o usuário insere a senha "Senha123" no campo Senha
    And o usuário insere a senha "Senha123" no campo Confirmar Senha
    And o usuário clica no botão "Cadastrar-se"
    Then o usuário  não é direcionado para a tela de confirmação de número
    And é exibido mensagem "Campo obrigatório" no campo Nome Completo