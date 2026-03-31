*** Settings ***
Resource    ../resources/reset_password_keywords..robot
Test Setup      Open Browser
Test Teardown   Close Browser

*** Test Cases ***
Reset user's password
    Click Reset Password Button
    Type Email In The Password Reset Input
    Click Send Password Reset Email Button
    Success message is displayed
