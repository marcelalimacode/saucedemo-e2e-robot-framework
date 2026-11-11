*** Settings ***
Documentation    Telas do checkout: dados do cliente, resumo e confirmação do pedido.
Library          SeleniumLibrary

*** Variables ***
${CAMPO_NOME}          id=first-name
${CAMPO_SOBRENOME}     id=last-name
${CAMPO_CEP}           id=postal-code
${BOTAO_CONTINUAR}     id=continue
${BOTAO_FINALIZAR}     id=finish
${ERRO_CHECKOUT}       css=[data-test="error"]
${TITULO_CONCLUIDO}    css=.complete-header

*** Keywords ***
Preencher os dados do cliente
    [Arguments]    ${nome}    ${sobrenome}    ${cep}
    Input Text    ${CAMPO_NOME}         ${nome}
    Input Text    ${CAMPO_SOBRENOME}    ${sobrenome}
    Input Text    ${CAMPO_CEP}          ${cep}

Continuar o checkout
    Click Button    ${BOTAO_CONTINUAR}

Finalizar a compra
    Wait Until Element Is Visible    ${BOTAO_FINALIZAR}
    Click Button    ${BOTAO_FINALIZAR}

O pedido deve estar concluído
    Wait Until Element Is Visible    ${TITULO_CONCLUIDO}
    Element Text Should Be           ${TITULO_CONCLUIDO}    ${MSG_PEDIDO_CONCLUIDO}

A mensagem de erro do checkout deve ser
    [Arguments]    ${mensagem_esperada}
    Wait Until Element Is Visible    ${ERRO_CHECKOUT}
    Element Text Should Be           ${ERRO_CHECKOUT}    ${mensagem_esperada}
