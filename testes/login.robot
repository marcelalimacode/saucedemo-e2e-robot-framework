*** Settings ***
Documentation     Cenários de login e logout (CT01 a CT05).
Resource          ../recursos/base.robot
Test Setup        Abrir o Sauce Demo
Test Teardown     Fechar o Sauce Demo

*** Test Cases ***
CT01 - Login com usuário válido
    [Tags]    smoke    login    positivo
    Fazer login com    ${USUARIO_PADRAO}    ${SENHA}
    A tela de produtos deve estar aberta

CT02 - Login com senha incorreta
    [Tags]    regressao    login    negativo
    Fazer login com    ${USUARIO_PADRAO}    ${SENHA_ERRADA}
    A mensagem de erro do login deve ser    ${MSG_CREDENCIAIS_INVALIDAS}

CT03 - Login com usuário bloqueado
    [Tags]    regressao    login    negativo
    Fazer login com    ${USUARIO_BLOQUEADO}    ${SENHA}
    A mensagem de erro do login deve ser    ${MSG_USUARIO_BLOQUEADO}

CT04 - Login com campos vazios
    [Tags]    regressao    login    negativo
    Fazer login com    ${EMPTY}    ${EMPTY}
    A mensagem de erro do login deve ser    ${MSG_USUARIO_OBRIGATORIO}

CT05 - Sair do sistema volta para a tela de login
    [Tags]    smoke    login    positivo
    Fazer login com    ${USUARIO_PADRAO}    ${SENHA}
    A tela de produtos deve estar aberta
    Sair do sistema
    Aguardar a tela de login
