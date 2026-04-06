*** Settings ***
Resource   ../resources/register.robot
Resource    ../resources/login_keywords.robot
Test Teardown   Close Browser

*** Test Cases ***
Register User and login
    register.Open Browser
    Access Registration Page
    ${email}    ${password}=    Fill register form information
    Click register button
    Success message is displayed after registration
    User is redirected to login page after registration
    Fill Login Form    ${email}    ${password}
    Click Login
    User Should Be Redirected To Decks
    URL Should Contain Decks