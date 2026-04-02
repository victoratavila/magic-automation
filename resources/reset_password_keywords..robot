*** Settings ***
Library    String
Library    Collections
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
    Sleep    10

Check if reset email was received
    [Arguments]    ${VALID_EMAIL}
    ${email}=    Set Variable    ${VALID_EMAIL}
    ${parts}=    Split String    ${email}    @
    ${username}=    Set Variable    ${parts}[0]

    Go To    https://tuamaeaquelaursa.com/${username}
    ${elements}=    Get Elements    css=.the-message-time

    ${times}=    Create List
    FOR    ${el}    IN    @{elements}
        ${text}=    Get Text    ${el}
        Append To List    ${times}    ${text}
    END

    ${parsed}=    Evaluate    [__import__('datetime').datetime.strptime(t, '%H:%M:%S') for t in $times]

    ${latest}=    Evaluate    max($parsed)

    ${index}=    Evaluate    $parsed.index($latest)

    Click    css=.the-message >> nth=${index}

Open reset password form received in the email
    Wait For Elements State    text=Redefinir senha    visible
    Click    text=Redefinir senha

Check URL Ends With Login
    ${url}=    Get Url
    Should End With    ${url}    login

Wait For Redirect To Login
    Wait Until Keyword Succeeds    10s    1s    Check URL Ends With Login

Fill new password
    Wait For Elements State    //input[@id='resetPassword']    visible
    Type Text    //input[@id='resetPassword']    ${NEW_PASSWORD}
    Type Text    //input[@id='resetConfirm']    ${NEW_PASSWORD}

Click to submit new password
    Click    //button[@id='btnResetSubmit']
    Wait Until Keyword Succeeds    10s    1s    Check URL Ends With Login