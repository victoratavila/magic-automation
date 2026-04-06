*** Settings ***
Resource    ./base.robot
Library    ../utils/generate_name.py
Library    ../utils/generate_email.py
Library    ../utils/generate_password.py

*** Keywords ***
Open Browser
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${LOGIN_URL}

Access Registration Page
    Go to    ${REGISTRATION_URL}
  
Fill register form information
    ${nome}=    Generate Name
    ${email}=    Generate Email
    ${password}=    Generate Password
    Type Text    //input[@id='registerUsername']    ${nome}
    Type Text    //input[@id='registerEmail']    ${email}
    Type Text    //input[@id='registerPassword']    ${password}
    Type Text    //input[@id='registerConfirm']    ${password}
    RETURN    ${email}    ${password}

Click register button
    Click    //button[@id='btnRegisterSubmit']

Success message is displayed after registration
    Wait For Elements State    //div[@id='registerMsg']    visible
    Sleep    5s

User is redirected to login page after registration
    ${url}=    Get Url
    Should End With    ${url}    login
    
    