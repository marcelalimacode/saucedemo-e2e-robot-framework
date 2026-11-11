*** Settings ***
Documentation    Shared setup used by every test suite: libraries, browser and page objects.
Library          SeleniumLibrary    timeout=10s    implicit_wait=0s
Resource         data/test_data.robot
Resource         pages/login_page.robot
Resource         pages/products_page.robot
Resource         pages/cart_page.robot
Resource         pages/checkout_page.robot

*** Variables ***
# Run with -v BROWSER:chrome to watch the browser locally
${BROWSER}    headlesschrome

*** Keywords ***
Open Sauce Demo
    [Documentation]    Opens a clean browser on the login page.
    ${options}=    Set Variable
    ...    add_argument("--incognito");add_argument("--window-size=1366,900");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_experimental_option("prefs", {"credentials_enable_service": False, "profile.password_manager_enabled": False, "profile.password_manager_leak_detection": False})
    Open Browser    ${URL}    ${BROWSER}    options=${options}
    Wait Until Login Page Is Visible

Close Sauce Demo
    Capture Page Screenshot If Test Failed
    Close All Browsers

Capture Page Screenshot If Test Failed
    Run Keyword If Test Failed    Capture Page Screenshot

Open Sauce Demo Logged In As Standard User
    Open Sauce Demo
    Login With    ${STANDARD_USER}    ${PASSWORD}
    Products Page Should Be Open
