*** Settings ***
Resource    ./base.robot

*** Keywords ***
Open Browser
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${LOGIN_URL}

Close Browser Session
    Close Browser

Fill Login Form
    [Arguments]    ${email}    ${password}
    Fill Text    id=loginEmail    ${email}
    Fill Text    id=loginPassword    ${password}

Click Login
    Click    id=btnLoginSubmit

User Should Be Redirected To Decks
    Wait Until Keyword Succeeds    10s    500ms
    ...    URL Should Contain Decks

URL Should Contain Decks
    ${url}=    Get Url
    Should Contain    ${url}    /decks

Invalid credetials error is shown
    Wait For Elements State    //div[@id='loginMsg']    visible