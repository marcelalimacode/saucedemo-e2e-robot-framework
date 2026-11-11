*** Settings ***
Documentation    Page object for the login screen: locators and actions.
Library          SeleniumLibrary

*** Variables ***
${LOGIN_USERNAME}    id=user-name
${LOGIN_PASSWORD}    id=password
${LOGIN_BUTTON}      id=login-button
${LOGIN_ERROR}       css=[data-test="error"]

*** Keywords ***
Wait Until Login Page Is Visible
    Wait Until Element Is Visible    ${LOGIN_BUTTON}

Login With
    [Arguments]    ${username}    ${password}
    Input Text        ${LOGIN_USERNAME}    ${username}
    Input Password    ${LOGIN_PASSWORD}    ${password}
    Click Button      ${LOGIN_BUTTON}

Login Error Should Be
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${LOGIN_ERROR}
    Element Text Should Be           ${LOGIN_ERROR}    ${expected_message}
