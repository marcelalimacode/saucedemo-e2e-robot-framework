*** Settings ***
Documentation     Cart scenarios (CT06 and CT07).
Resource          ../resources/base.robot
Test Setup        Open Sauce Demo Logged In As Standard User
Test Teardown     Close Sauce Demo

*** Test Cases ***
CT06 - Add a product to the cart
    [Tags]    smoke    cart    positive
    Add Product To Cart       ${PRODUCT_ID}
    Cart Badge Should Show    1
    Go To Cart
    Cart Should Contain Items    1

CT07 - Remove a product from the cart
    [Tags]    regression    cart    positive
    Add Product To Cart       ${PRODUCT_ID}
    Cart Badge Should Show    1
    Go To Cart
    Remove Product From Cart    ${PRODUCT_ID}
    Cart Should Be Empty
    Cart Badge Should Not Be Visible
