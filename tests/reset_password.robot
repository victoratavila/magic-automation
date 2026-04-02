*** Settings ***
Resource    ../resources/reset_password_keywords..robot
Resource    ../resources/login_keywords.robot
Test Setup      login_keywords.Open Browser
Test Teardown   Close Browser

*** Test Cases ***
Reset user's password
    Click Reset Password Button
    Type Email In The Password Reset Input
    Click Send Password Reset Email Button
    Success message is displayed
    Check if reset email was received    ${VALID_EMAIL}
    Open reset password form received in the email
    Fill new password
    Click to submit new password

Try to login with new password
    Fill Login Form    ${VALID_EMAIL}    ${NEW_PASSWORD}
    Click Login
    User Should Be Redirected To Decks
    URL Should Contain Decks
