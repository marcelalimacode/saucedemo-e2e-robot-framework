*** Settings ***
Documentation    Test data in one place: users, password, customer info and expected messages.
...              Users are public and listed on the Sauce Demo login page.

*** Variables ***
${URL}                      https://www.saucedemo.com
${STANDARD_USER}            standard_user
${LOCKED_USER}              locked_out_user
${PASSWORD}                 secret_sauce
${WRONG_PASSWORD}           wrong_password

${FIRST_NAME}               Marcela
${LAST_NAME}                Lima
${POSTAL_CODE}              01000-000

${MSG_WRONG_CREDENTIALS}    Epic sadface: Username and password do not match any user in this service
${MSG_LOCKED_USER}          Epic sadface: Sorry, this user has been locked out.
${MSG_USERNAME_REQUIRED}    Epic sadface: Username is required
${MSG_FIRST_NAME_REQUIRED}  Error: First Name is required
${MSG_ORDER_COMPLETE}       Thank you for your order!

${PRODUCT_ID}               sauce-labs-backpack
