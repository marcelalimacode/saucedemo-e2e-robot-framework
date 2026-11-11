*** Settings ***
Documentation     Cenários da vitrine de produtos (CT08).
Resource          ../recursos/base.robot
Test Setup        Abrir o Sauce Demo logado como usuário padrão
Test Teardown     Fechar o Sauce Demo

*** Test Cases ***
CT08 - Ordenar produtos por preço do menor para o maior
    [Tags]    regressao    produtos    positivo
    Ordenar os produtos por    lohi
    Os preços devem estar do menor para o maior
