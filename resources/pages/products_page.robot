*** Settings ***
Documentation    Page object for the products (inventory) screen.
Library          SeleniumLibrary
Library          Collections

*** Variables ***
${PRODUCTS_TITLE}     css=.title
${CART_BADGE}         css=.shopping_cart_badge
${CART_LINK}          css=.shopping_cart_link
${SORT_SELECT}        css=.product_sort_container
${ITEM_PRICES}        css=.inventory_item_price
${MENU_BUTTON}        id=react-burger-menu-btn
${LOGOUT_LINK}        id=logout_sidebar_link

*** Keywords ***
Products Page Should Be Open
    Wait Until Element Is Visible    ${PRODUCTS_TITLE}
    Element Text Should Be           ${PRODUCTS_TITLE}    Products
    Location Should Contain          inventory.html

Add Product To Cart
    [Arguments]    ${product_id}
    Click Button    id=add-to-cart-${product_id}

Cart Badge Should Show
    [Arguments]    ${quantity}
    Wait Until Element Is Visible    ${CART_BADGE}
    Element Text Should Be           ${CART_BADGE}    ${quantity}

Cart Badge Should Not Be Visible
    Wait Until Page Does Not Contain Element    ${CART_BADGE}

Sort Products By
    [Arguments]    ${option_value}
    Select From List By Value    ${SORT_SELECT}    ${option_value}

Get Product Prices
    [Documentation]    Returns the list of prices shown on the page as numbers.
    @{elements}=    Get WebElements    ${ITEM_PRICES}
    @{prices}=    Create List
    FOR    ${element}    IN    @{elements}
        ${text}=     Get Text    ${element}
        ${value}=    Evaluate    float("${text}".replace("$", ""))
        Append To List    ${prices}    ${value}
    END
    RETURN    ${prices}

Prices Should Be In Ascending Order
    @{prices}=    Get Product Prices
    ${sorted}=    Evaluate    sorted(${prices})
    Lists Should Be Equal    ${prices}    ${sorted}

Go To Cart
    Click Element    ${CART_LINK}

Logout
    Click Button    ${MENU_BUTTON}
    Wait Until Element Is Visible    ${LOGOUT_LINK}
    Click Element    ${LOGOUT_LINK}
