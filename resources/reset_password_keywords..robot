*** Settings ***
Resource    ./base.robot

*** Keywords ***
Open Browser
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${LOGIN_URL}

Click Reset Password Button
    Wait For Elements State    //button[normalize-space()='Esqueci minha senha']    visible
    Click    //button[normalize-space()='Esqueci minha senha']

Type Email In The Password Reset Input
    Wait For Elements State    //input[@id='forgotEmail']    visible
    Type Text    //input[@id='forgotEmail']    ${VALID_EMAIL}

Click Send Password Reset Email Button
    Wait For Elements State    //button[@id='btnForgotSubmit']    visible
    Click    //button[@id='btnForgotSubmit']

Success message is displayed
    Wait For Elements State    //div[@id='forgotMsg']    visible
    ${text}=    Get Text    //div[@id='forgotMsg']
    Should Contain    ${text}    Se esse e-mail estiver cadastrado, você receberá um link em breve.

Resend reset password email is temporarely disabled
    Wait For Elements State    xpath=//button[@id='btnForgotSubmit']    disabled