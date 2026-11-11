*** Settings ***
Documentation    Page object for the checkout screens (information, overview, complete).
Library          SeleniumLibrary

*** Variables ***
${CHECKOUT_FIRST_NAME}    id=first-name
${CHECKOUT_LAST_NAME}     id=last-name
${CHECKOUT_POSTAL_CODE}   id=postal-code
${CONTINUE_BUTTON}        id=continue
${FINISH_BUTTON}          id=finish
${CHECKOUT_ERROR}         css=[data-test="error"]
${COMPLETE_HEADER}        css=.complete-header

*** Keywords ***
Fill Customer Information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    ${CHECKOUT_FIRST_NAME}     ${first_name}
    Input Text    ${CHECKOUT_LAST_NAME}      ${last_name}
    Input Text    ${CHECKOUT_POSTAL_CODE}    ${postal_code}

Continue Checkout
    Click Button    ${CONTINUE_BUTTON}

Finish Checkout
    Wait Until Element Is Visible    ${FINISH_BUTTON}
    Click Button    ${FINISH_BUTTON}

Order Should Be Complete
    Wait Until Element Is Visible    ${COMPLETE_HEADER}
    Element Text Should Be           ${COMPLETE_HEADER}    ${MSG_ORDER_COMPLETE}

Checkout Error Should Be
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${CHECKOUT_ERROR}
    Element Text Should Be           ${CHECKOUT_ERROR}    ${expected_message}
