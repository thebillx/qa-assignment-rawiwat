*** Variables ***
${LOGIN_SCREEN}           xpath=//android.widget.TextView[@text="Login Screen"]
${USERNAME_FIELD}         xpath=//android.widget.EditText[@content-desc="username"]
${PASSWORD_FIELD}         xpath=//android.widget.EditText[@content-desc="password"]
${LOGIN_BUTTON}           xpath=//android.widget.Button[@content-desc="loginBtn"]
${SUCCESS_MESSAGE}        xpath=//android.widget.TextView[contains(@text,"You are logged in as")]
${FAILED_MESSAGE}         xpath=//android.widget.TextView[@resource-id="android:id/message"]
${LOGOUT_BUTTON}          xpath=//android.widget.Button[@content-desc="Logout"]
${FAILED_BUTTON}          xpath=//android.widget.Button[@resource-id="android:id/button1"]
