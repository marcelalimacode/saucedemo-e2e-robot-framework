*** Settings ***
Documentation     Cenários do carrinho (CT06 e CT07).
Resource          ../recursos/base.robot
Test Setup        Abrir o Sauce Demo logado como usuário padrão
Test Teardown     Fechar o Sauce Demo

*** Test Cases ***
CT06 - Adicionar um produto ao carrinho
    [Tags]    smoke    carrinho    positivo
    Adicionar o produto ao carrinho    ${PRODUTO}
    O carrinho deve mostrar    1
    Ir para o carrinho
    O carrinho deve ter    1

CT07 - Remover um produto do carrinho
    [Tags]    regressao    carrinho    positivo
    Adicionar o produto ao carrinho    ${PRODUTO}
    O carrinho deve mostrar    1
    Ir para o carrinho
    Remover o produto do carrinho    ${PRODUTO}
    O carrinho deve estar vazio
    O contador do carrinho não deve aparecer
