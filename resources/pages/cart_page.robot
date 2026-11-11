*** Settings ***
Documentation    Page object for the cart screen.
Library          SeleniumLibrary

*** Variables ***
${CART_ITEMS}         css=.cart_item
${CHECKOUT_BUTTON}    id=checkout

*** Keywords ***
Cart Page Should Be Open
    Location Should Contain    cart.html

Cart Should Contain Items
    [Arguments]    ${quantity}
    Wait Until Element Is Visible    ${CART_ITEMS}
    Page Should Contain Element      ${CART_ITEMS}    limit=${quantity}

Cart Should Be Empty
    Page Should Not Contain Element    ${CART_ITEMS}

Remove Product From Cart
    [Arguments]    ${product_id}
    Click Button    id=remove-${product_id}

Go To Checkout
    Click Button    ${CHECKOUT_BUTTON}
