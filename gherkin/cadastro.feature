Feature: Cadastro
  Para o usuário efetuar cadastro,
  validando os dados conforme regras de negócio

  Scenario: Redirecionar usuário para a tela de cadastro
    Given que tem acesso ao aplicativo web
    When acessa aplicativo web - https://bugbank.netlify.app/
    And clica no botão "Registrar"
    Then o usuário é direcionado para a tela de cadastro
    And é exibido mensagem "Voltar ao login" e link para retornar à tela de Login
    And é exibido campos E-mail, Nome, Senha e Confirmação senha
    And é exibido mensagem "Criar conta com Saldo ?" e botão on/off
    And é exibido botão "Cadastrar"

  Scenario:  Criar cadastro com sucesso
    Given usuário tem acesso ao aplicativo web e acessou a tela de cadastro
    And e tem dados válidos para inserir no cadastro
    When o usuário insere o e-mail "teste@mail.com" no campo E-mail
    And o usuário insere o nome "João Silva" no campo Nome
    And o usuário insere a senha "1234" no campo Senha
    And o usuário insere a senha "1234" no campo Confirmação Senha
    And o usuário clica no botão "Cadastrar"
    Then abre janela com confirmação de conta criada
    And é exibido mensagem "A conta [número_conta] foi criada com sucesso"
    And é exibido botão "Fechar"

  Scenario:  Criar cadastro com e-mail em formato inválido
    Given usuário tem acesso ao aplicativo web e acessou a tela de cadastro
    When o usuário insere o e-mail "testemail.com" no campo E-mail
    Then é exibido mensagem "Formato inválido"

  Scenario:  Criar cadastro sem e-mail
    Given usuário tem acesso ao aplicativo web e acessou a tela de cadastro
    When o usuário deixa o campo E-mail em branco
    And o usuário insere o nome "João Silva" no campo Nome
    And o usuário insere a senha "1234" no campo Senha
    And o usuário insere a senha "1234" no campo Confirmação Senha
    And o usuário clica no botão "Cadastrar"
    Then e exibido mensagem abaixo do campo e-mail “É campo obrigatório”
    And permanece na tela de Cadastro aguardando inserir e-mail

  Scenario:  Criar cadastro sem nome
    Given usuário tem acesso ao aplicativo web e acessou a tela de cadastro
    When o usuário insere o e-mail "teste@mail.com" no campo E-mail
    And o usuário deixa o campo Nome em branco
    And o usuário insere a senha "1234" no campo Senha
    And o usuário insere a senha "1234" no campo Confirmação Senha
    And o usuário clica no botão "Cadastrar"
    Then abre janela com erro
    And é exibido mensagem “Nome não pode ser vazio.”
    And é exibido botão "Fechar"

  Scenario:  Criar cadastro com números no campo Nome
    Given usuário tem acesso ao aplicativo web e acessou a tela de cadastro
    When o usuário insere o e-mail "teste@mail.com" no campo E-mail
    And o usuário insere o nome "1234" no campo Nome
    And o usuário insere a senha "1234" no campo Senha
    And o usuário insere a senha "1234" no campo Confirmação Senha
    And o usuário clica no botão "Cadastrar"
    Then abre janela com erro
    And é exibido mensagem “Nome não pode ser números.”
    And permanece na tela de Cadastro aguardando inserir nome

  Scenario:  Criar cadastro sem senha
    Given usuário tem acesso ao aplicativo web e acessou a tela de cadastro
    When o usuário insere o e-mail "teste@mail.com" no campo E-mail
    And o usuário insere o nome "João Silva" no campo Nome
    And o usuário deixa o campo Senha em branco
    And o usuário insere a senha "1234" no campo Confirmação Senha
    And o usuário clica no botão "Cadastrar"
    Then e exibido mensagem abaixo do campo senha “É campo obrigatório”
    And permanece na tela de Cadastro aguardando inserir senha

  Scenario:  Criar cadastro sem confirmar senha
    Given usuário tem acesso ao aplicativo web e acessou a tela de cadastro
    When o usuário insere o e-mail "teste@mail.com" no campo E-mail
    And o usuário insere o nome "João Silva" no campo Nome
    And o usuário insere a senha "1234" no campo Senha
    And o usuário deixa o campo Confirmação senha em branco
    And o usuário clica no botão "Cadastrar"
    Then e exibido mensagem abaixo do campo Confirmação senha “É campo obrigatório”
    And permanece na tela de Cadastro aguardando inserir senha

  Scenario:  Criar cadastro com confirmação de senha diferente de senha
    Given usuário tem acesso ao aplicativo web e acessou a tela de cadastro
    When o usuário insere o e-mail "teste@mail.com" no campo E-mail
    And o usuário insere o nome "João Silva" no campo Nome
    And o usuário insere a senha "1234" no campo Senha
    And o usuário insere a senha "9999" no campo Confirmação Senha
    And o usuário clica no botão "Cadastrar"
    Then abre janela de erro
    And é exibido mensagem "As senhas não são iguais."
    And é exibido botão "Fechar"

  Scenario:  Criar conta com saldo
    Given usuário tem acesso ao aplicativo web e acessou a tela de cadastro
    And insere dados conforme Scenario Criar cadastro com sucesso
    And ativa a opção "Criar conta com saldo ?"
    And a conta é criada com sucesso
    When o usuário acessa tela de login
    And o usuário insere o e-mail "teste@mail.com" no campo E-mail
    And o usuário insere a senha "1234" no campo Senha
    And o usuário clica no botão "Acessar"
    Then usuário é direcionado à página home
    And é exibido a mensagem “Olá [Nome-do-Usuário], bem vindo ao Bug Bank :)”
    And é exibido a mensagem "Saldo em conta R$ 1.000,00"
    And usuário tem acesso às funcionalidades (Transferência, Pagamentos, Extratos e Saque)
    And é exibido o botão "Sair"
