*** Settings ***
Documentation     Login and logout scenarios (CT01 to CT05).
Resource          ../resources/base.robot
Test Setup        Open Sauce Demo
Test Teardown     Close Sauce Demo

*** Test Cases ***
CT01 - Login with valid user
    [Tags]    smoke    login    positive
    Login With    ${STANDARD_USER}    ${PASSWORD}
    Products Page Should Be Open

CT02 - Login with wrong password
    [Tags]    regression    login    negative
    Login With    ${STANDARD_USER}    ${WRONG_PASSWORD}
    Login Error Should Be    ${MSG_WRONG_CREDENTIALS}

CT03 - Login with locked out user
    [Tags]    regression    login    negative
    Login With    ${LOCKED_USER}    ${PASSWORD}
    Login Error Should Be    ${MSG_LOCKED_USER}

CT04 - Login with empty fields
    [Tags]    regression    login    negative
    Login With    ${EMPTY}    ${EMPTY}
    Login Error Should Be    ${MSG_USERNAME_REQUIRED}

CT05 - Logout returns to the login page
    [Tags]    smoke    login    positive
    Login With    ${STANDARD_USER}    ${PASSWORD}
    Products Page Should Be Open
    Logout
    Wait Until Login Page Is Visible
