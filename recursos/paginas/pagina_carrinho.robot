*** Settings ***
Documentation    Tela do carrinho: conferir itens, remover e seguir para o checkout.
Library          SeleniumLibrary

*** Variables ***
${ITENS_CARRINHO}     css=.cart_item
${BOTAO_CHECKOUT}     id=checkout

*** Keywords ***
O carrinho deve ter
    [Arguments]    ${quantidade}
    Wait Until Element Is Visible    ${ITENS_CARRINHO}
    Page Should Contain Element      ${ITENS_CARRINHO}    limit=${quantidade}

O carrinho deve estar vazio
    Page Should Not Contain Element    ${ITENS_CARRINHO}

Remover o produto do carrinho
    [Arguments]    ${produto}
    Click Button    id=remove-${produto}

Ir para o checkout
    Click Button    ${BOTAO_CHECKOUT}
