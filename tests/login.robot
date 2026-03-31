*** Settings ***
Resource    ../variables/variables.robot
Resource    ../resources/base.robot
Resource    ../resources/login_keywords.robot
Test Setup      Open Browser
Test Teardown   Close Browser

*** Test Cases ***
User Can Login
    Fill Login Form    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Click Login
    User Should Be Redirected To Decks
    URL Should Contain Decks

Invalid Login credentials fail
    Fill Login Form    ${INVALID_EMAIL}    ${INVALID_PASSWORD}
    Click Login
    