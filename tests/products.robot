*** Settings ***
Documentation     Product listing scenarios (CT08).
Resource          ../resources/base.robot
Test Setup        Open Sauce Demo Logged In As Standard User
Test Teardown     Close Sauce Demo

*** Test Cases ***
CT08 - Sort products by price from low to high
    [Tags]    regression    products    positive
    Sort Products By    lohi
    Prices Should Be In Ascending Order
