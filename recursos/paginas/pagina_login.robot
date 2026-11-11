*** Settings ***
Documentation    Tela de login: onde ficam os elementos e o que dá para fazer nela.
Library          SeleniumLibrary

*** Variables ***
${CAMPO_USUARIO}     id=user-name
${CAMPO_SENHA}       id=password
${BOTAO_LOGIN}       id=login-button
${MENSAGEM_ERRO}     css=[data-test="error"]

*** Keywords ***
Aguardar a tela de login
    Wait Until Element Is Visible    ${BOTAO_LOGIN}

Fazer login com
    [Arguments]    ${usuario}    ${senha}
    Input Text        ${CAMPO_USUARIO}    ${usuario}
    Input Password    ${CAMPO_SENHA}      ${senha}
    Click Button      ${BOTAO_LOGIN}

A mensagem de erro do login deve ser
    [Arguments]    ${mensagem_esperada}
    Wait Until Element Is Visible    ${MENSAGEM_ERRO}
    Element Text Should Be           ${MENSAGEM_ERRO}    ${mensagem_esperada}
