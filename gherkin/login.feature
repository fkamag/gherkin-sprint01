Feature: Login
  Para acessar a conta de um usuário registrado,
  o sistema deve permitir que ele faça login utilizando suas credenciais

  Scenario: Login - Usuário com Credenciais Válidas
    Given usuário tem acesso ao aplicativo web
    And está cadastrado com e-mail "teste@mail.com" e senha "1234"
    When acessa aplicativo web - https://bugbank.netlify.app/
    And insere "teste@mail.com" no campo E-mail
    And insere "1234" no campo Senha
    And clica no botão "Acessar"
    Then usuário é direcionado à página home
    And é exibido a mensagem “Olá [Nome-do-Usuário], bem vindo ao Bug Bank :)”
    And é exibido o saldo da conta
    And usuário tem acesso às funcionalidades (Transferência, Pagamentos, Extratos e Saque)

  Scenario: Login - Usuário com E-mail não cadastrado
    Given usuário tem acesso ao aplicativo web
    And não está cadastrado com e-mail "teste2@mail.com" e senha "1234"
    When acessa aplicativo web - https://bugbank.netlify.app/
    And insere "teste2@mail.com" no campo E-mail
    And insere "1234" no campo Senha
    And clica no botão "Acessar"
    Then Abre uma janela com mensagem de dados inválidos
    And é exibido a mensagem “Usuário ou senha inválido.”
    And é exibido a mensagem “Tente novamente ou verifique suas informações!”
    And é exibido um botão "Fechar"

  Scenario: Login - Usuário com Senha Incorreta
    Given usuário tem acesso ao aplicativo web
    And está cadastrado com e-mail "teste@mail.com" e senha "1234"
    When acessa aplicativo web - https://bugbank.netlify.app/
    And insere "teste@mail.com" no campo E-mail
    And insere "9999" no campo Senha
    And clica no botão "Acessar"
    Then Abre uma janela com mensagem de dados inválidos
    And é exibido a mensagem “Usuário ou senha inválido.”
    And é exibido a mensagem “Tente novamente ou verifique suas informações!”
    And é exibido um botão "Fechar"

  Scenario: Login - Usuário com E-mail em formato inválido
    Given usuário tem acesso ao aplicativo web
    And está cadastrado com e-mail "teste@mail.com" e senha "1234"
    When acessa aplicativo web - https://bugbank.netlify.app/
    And insere "testemail.com" no campo E-mail
    Then É exibido mensagem "Formato inválido"

  Scenario: Login - Usuário com E-mail em branco
    Given usuário tem acesso ao aplicativo web
    And está cadastrado com e-mail "teste@mail.com" e senha "1234"
    When acessa aplicativo web - https://bugbank.netlify.app/
    And deixa o campo E-mail em branco
    And insere "1234" no campo Senha
    And clica no botão "Acessar"
    Then é exibido mensagem "É campo obrigatório"
    And permanece na página de login aguardando digitar e-mail no campo E-mail

  Scenario: Login - Usuário com Senha em branco
    Given usuário tem acesso ao aplicativo web
    And está cadastrado com e-mail "teste@mail.com" e senha "1234"
    When acessa aplicativo web - https://bugbank.netlify.app/
    And insere "teste@mail.com" no campo E-mail
    And deixa o campo Senha em branco
    And clica no botão "Acessar"
    Then é exibido mensagem "É campo obrigatório"
    And permanece na página de login aguardando digitar senha no campo Senha