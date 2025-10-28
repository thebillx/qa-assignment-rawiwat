*** Settings ***
Documentation     Mobile automation test for "The App by Appium"
Library           AppiumLibrary
Suite Setup       Open The App
Suite Teardown    Close Application

*** Variables ***
${REMOTE_URL}             http://127.0.0.1:4723
${APP}                    ${CURDIR}/TheApp.apk
${PLATFORM_NAME}          Android
${DEVICE_NAME}            emulator-5554
${AUTOMATION_NAME}        UiAutomator2

${USERNAME_VALID}         alice
${PASSWORD_VALID}         mypassword
${USERNAME_INVALID}       monkey
${PASSWORD_INVALID}       bangkok

${LOGIN_SCREEN}           xpath=//android.widget.TextView[@text="Login Screen"]
${USERNAME_FIELD}         xpath=//android.widget.EditText[@content-desc="username"]
${PASSWORD_FIELD}         xpath=//android.widget.EditText[@content-desc="password"]
${LOGIN_BUTTON}           xpath=//android.widget.Button[@content-desc="loginBtn"]
${SUCCESS_MESSAGE}        xpath=//android.widget.TextView[contains(@text,"You are logged in as")]
${FAILED_MESSAGE}         xpath=//android.widget.TextView[@resource-id="android:id/message" and @text="Invalid login credentials, please try again"]
${LOGOUT_BUTTON}          xpath=//android.widget.Button[@content-desc="Logout"]
${FAILED_BUTTON}          xpath=//android.widget.Button[@resource-id="android:id/button1"]

*** Keywords ***
Open The App
    [Documentation]    Start Appium session with The App
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    automationName=${AUTOMATION_NAME}
    ...    app=${APP}
    Log To Console     Application started successfully.

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

*** Test Cases ***
Valid Login Flow
    [Documentation]    Verify user can login successfully in case valid credentials.
    Navigate To Login Screen
    Login With Credentials    ${USERNAME_VALID}    ${PASSWORD_VALID}
    Verify Success Message
    Logout

Invalid Login Flow
    [Documentation]    Verify error message appears in case invalid credentials when user login failed.
    Login With Credentials    ${USERNAME_INVALID}    ${PASSWORD_INVALID}
    Verify Error Message
    Close Application