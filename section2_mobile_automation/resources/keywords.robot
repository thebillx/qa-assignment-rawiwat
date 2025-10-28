*** Settings ***
Library    AppiumLibrary
Resource   locators.robot

*** Keywords ***
Open The App
    &{caps}=    Create Dictionary    platformName=Android    deviceName=emulator-5554    automationName=UiAutomator2    app=${EXECDIR}/TheApp.apk
    Open Application    http://127.0.0.1:4723    &{caps}
    Log To Console    Application started successfully.

Close The App
    Close Application

Navigate To Login Screen
    Wait Until Element Is Visible    ${LOGIN_SCREEN}    timeout=10s
    Click Element    ${LOGIN_SCREEN}
    Log To Console    Go to Login Screen

Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=10s
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Text    ${PASSWORD_FIELD}    ${password}
    Click Element    ${LOGIN_BUTTON}

Verify Success Message
    Wait Until Element Is Visible    ${SUCCESS_MESSAGE}    timeout=10s
    Page Should Contain Text    You are logged in as ${USERNAME_VALID}
    Log To Console    Login success

Verify Error Message
    Wait Until Element Is Visible    ${FAILED_MESSAGE}    timeout=10s
    Page Should Contain Text    Invalid login credentials, please try again
    Click Element    ${FAILED_BUTTON}
    Log To Console    Login fail

Logout
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    timeout=10s
    Click Element    ${LOGOUT_BUTTON}
    Log To Console    Logout
