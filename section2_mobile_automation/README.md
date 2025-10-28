# Section 2 – Mobile App Automation (Robot Framework + Appium)

## Overview
This project **mobile automation testing** using  
**Robot Framework** and **Appium** on the demo app “**The App by Appium**”.

The goal is to validate login functionality — both **valid** and **invalid** cases —  
with clear test structure, reusable keywords, and locator separation.

---

## Project Structure

```
section2_mobile_automation/
│
├── resources/
│   ├── keywords.robot        # Contains reusable keywords & setup/teardown logic
│   └── locators.robot        # Stores element locators for maintainability
│
├── tests/
│   └── Testcase.robot        # Main test suite for login validation
│
├── TheApp.apk                # Android demo app used for automation testing
├── log.html                  # Generated Robot Framework log
├── report.html               # Test summary report
├── output.xml                # Raw output results
└── README.md                 # This documentation
```

---

## Prerequisites

Before running tests, make sure you have the following installed:

| Component | Version | Install Command |
|------------|----------|----------------|
| **Python** | ≥ 3.10 | `brew install python@3.10` |
| **Appium** | ≥ 2.0 | `npm install -g appium` |
| **Android SDK + Emulator** | Any | via Android Studio |
| **Appium Driver (Android)** | uiautomator2 | `appium driver install uiautomator2` |
| **Robot Framework** | ≥ 7.0 | `pip install robotframework` |
| **AppiumLibrary** | latest | `pip install robotframework-appiumlibrary` |

---

## Virtual Environment Setup

1️ Create & activate a virtual environment  
```bash
cd /Users/bill/billx/software-qa-automation-assignment-rawiwat
python3 -m venv venv
source venv/bin/activate
```

2️ Install dependencies  
```bash
pip install robotframework robotframework-appiumlibrary Appium-Python-Client
```

---

## Run Instructions

### 1 Start Appium Server
```bash
appium --allow-cors
```

> Appium should start successfully at  
> **http://127.0.0.1:4723**

---

### 2️ Launch Android Emulator
```bash
emulator -avd Pixel_7_Pro
```
Confirm that the device is running:
```bash
adb devices
```

---

### 3️ Run the Tests
From the root directory of your project:
```bash
robot tests/Testcase.robot
```

Alternative command:
```bash
python -m robot tests/Testcase.robot
```

---

## Test Case Summary

| Test Case | Description | Expected Result |
|------------|-------------|-----------------|
| **Valid Login Flow** | Login with valid credentials (`alice` / `mypassword`) | Displays “You are logged in as alice” |
| **Invalid Login Flow** | Login with invalid credentials (`monkey` / `bangkok`) | Displays alert “Invalid login credentials, please try again” |

---

## Keyword Highlights

| Keyword | Description |
|----------|--------------|
| **Open The App** | Starts Appium session and launches the app |
| **Navigate To Login Screen** | Clicks on “Login Screen” from the main menu |
| **Login With Credentials** | Inputs username and password |
| **Verify Success Message** | Verifies the success text after login |
| **Verify Error Message** | Confirms the invalid login alert |
| **Logout** | Clicks “Logout” and returns to home screen |
| **Close Application** | Ends Appium session after suite teardown |

---

## Expected Console Output

```

==============================================================================
Testcase :: Mobile automation test for "The App by Appium"                    
==============================================================================
Application started successfully.
Valid Login Flow :: Verify user can login successfully in case val... Go to Login Screen
..Login success
.Logout
Valid Login Flow :: Verify user can login successfully in case val... | PASS |
------------------------------------------------------------------------------
Invalid Login Flow :: Verify error message appears in case invalid... .Login fail
Invalid Login Flow :: Verify error message appears in case invalid... | PASS |
------------------------------------------------------------------------------
Testcase :: Mobile automation test for "The App by Appium"            | PASS |
2 tests, 2 passed, 0 failed
==============================================================================
Output:  /Users/bill/billx/software-qa-automation-assignment-rawiwat/section2_mobile_automation/output.xml
Log:     /Users/bill/billx/software-qa-automation-assignment-rawiwat/section2_mobile_automation/log.html
Report:  /Users/bill/billx/software-qa-automation-assignment-rawiwat/section2_mobile_automation/report.html
```

---