*** Settings ***
Documentation     Cenários do checkout (CT09 e CT10).
Resource          ../recursos/base.robot
Test Setup        Abrir o Sauce Demo logado como usuário padrão
Test Teardown     Fechar o Sauce Demo

*** Test Cases ***
CT09 - Finalizar uma compra completa
    [Tags]    smoke    checkout    positivo
    Adicionar o produto ao carrinho    ${PRODUTO}
    Ir para o carrinho
    Ir para o checkout
    Preencher os dados do cliente    ${NOME}    ${SOBRENOME}    ${CEP}
    Continuar o checkout
    Finalizar a compra
    O pedido deve estar concluído

CT10 - Continuar o checkout sem preencher os dados
    [Tags]    regressao    checkout    negativo
    Adicionar o produto ao carrinho    ${PRODUTO}
    Ir para o carrinho
    Ir para o checkout
    Continuar o checkout
    A mensagem de erro do checkout deve ser    ${MSG_NOME_OBRIGATORIO}
