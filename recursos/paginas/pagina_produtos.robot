*** Settings ***
Documentation    Tela de produtos: vitrine, carrinho no topo, ordenação e menu.
Library          SeleniumLibrary
Library          Collections

*** Variables ***
${TITULO_PAGINA}       css=.title
${CONTADOR_CARRINHO}   css=.shopping_cart_badge
${ICONE_CARRINHO}      css=.shopping_cart_link
${SELETOR_ORDEM}       css=.product_sort_container
${PRECOS}              css=.inventory_item_price
${BOTAO_MENU}          id=react-burger-menu-btn
${LINK_SAIR}           id=logout_sidebar_link

*** Keywords ***
A tela de produtos deve estar aberta
    Wait Until Element Is Visible    ${TITULO_PAGINA}
    Element Text Should Be           ${TITULO_PAGINA}    Products
    Location Should Contain          inventory.html

Adicionar o produto ao carrinho
    [Arguments]    ${produto}
    Click Button    id=add-to-cart-${produto}

O carrinho deve mostrar
    [Arguments]    ${quantidade}
    Wait Until Element Is Visible    ${CONTADOR_CARRINHO}
    Element Text Should Be           ${CONTADOR_CARRINHO}    ${quantidade}

O contador do carrinho não deve aparecer
    Wait Until Page Does Not Contain Element    ${CONTADOR_CARRINHO}

Ordenar os produtos por
    [Arguments]    ${opcao}
    Select From List By Value    ${SELETOR_ORDEM}    ${opcao}

Pegar os preços da tela
    [Documentation]    Devolve a lista de preços mostrados na tela, como números.
    @{elementos}=    Get WebElements    ${PRECOS}
    @{precos}=    Create List
    FOR    ${elemento}    IN    @{elementos}
        ${texto}=    Get Text    ${elemento}
        ${valor}=    Evaluate    float("${texto}".replace("$", ""))
        Append To List    ${precos}    ${valor}
    END
    RETURN    ${precos}

Os preços devem estar do menor para o maior
    @{precos}=    Pegar os preços da tela
    ${ordenados}=    Evaluate    sorted(${precos})
    Lists Should Be Equal    ${precos}    ${ordenados}

Ir para o carrinho
    Click Element    ${ICONE_CARRINHO}

Sair do sistema
    Click Button    ${BOTAO_MENU}
    Wait Until Element Is Visible    ${LINK_SAIR}
    Click Element    ${LINK_SAIR}
