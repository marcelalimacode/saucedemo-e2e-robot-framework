*** Settings ***
Documentation     Checkout scenarios (CT09 and CT10).
Resource          ../resources/base.robot
Test Setup        Open Sauce Demo Logged In As Standard User
Test Teardown     Close Sauce Demo

*** Test Cases ***
CT09 - Complete a purchase
    [Tags]    smoke    checkout    positive
    Add Product To Cart    ${PRODUCT_ID}
    Go To Cart
    Go To Checkout
    Fill Customer Information    ${FIRST_NAME}    ${LAST_NAME}    ${POSTAL_CODE}
    Continue Checkout
    Finish Checkout
    Order Should Be Complete

CT10 - Continue checkout without customer information
    [Tags]    regression    checkout    negative
    Add Product To Cart    ${PRODUCT_ID}
    Go To Cart
    Go To Checkout
    Continue Checkout
    Checkout Error Should Be    ${MSG_FIRST_NAME_REQUIRED}
