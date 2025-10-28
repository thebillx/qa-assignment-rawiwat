*** Settings ***
Documentation     Mobile automated test "The App by Appium"
Resource          ../resources/keywords.robot
Suite Setup       Open The App
Suite Teardown    Close The App

*** Variables ***
${USERNAME_VALID}         alice
${PASSWORD_VALID}         mypassword
${USERNAME_INVALID}       monkey
${PASSWORD_INVALID}       bangok

*** Test Cases ***
Valid Login Flow
    [Documentation]    Verify that user can login successfully in case valid credentials.
    Navigate To Login Screen
    Login With Credentials    ${USERNAME_VALID}    ${PASSWORD_VALID}
    Verify Success Message
    Logout

Invalid Login Flow
    [Documentation]    Verify error message appears in case invalid credentials when user login faioled.
    Login With Credentials    ${USERNAME_INVALID}    ${PASSWORD_INVALID}
    Verify Error Message
