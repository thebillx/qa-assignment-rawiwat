# QA Automation Assignment – Rawiwat Akkharajiranan

This repository contains 3 complete testing sections covering **Manual Testing**, **Mobile Automation**, and **API Automation**.  
Each section follows professional QA practices and clear documentation standards.

---

## Project Structure

software-qa-automation-assignment-rawiwat/
├── section1_testing_fundamentals/ # Manual Testing (Test Cases & Bug Report)
│ ├── Test_case_Section1.xlsx
│ ├── BugReportSection1.pdf
│ └── README.md
│
├── section2_mobile_automation/ # Mobile Automation (Robot Framework + Appium)
│ ├── tests/
│ ├── resources/
│ ├── TheApp.apk
│ ├── README.md
│ └── output/
│
├── section3_api_automation/ # Backend API Automation (Pytest + Requests)
│ ├── tests/
│ ├── utils/
│ ├── schema/
│ ├── requirements.txt
│ └── README.md
│
└── README.md ← (this file)

yaml
Copy code

---

## Overview Summary

| Section | Description | Tools / Framework | Deliverables |
|----------|--------------|-------------------|---------------|
| **Section 1** | Manual Testing (Login Functionality) | Excel / Numbers | Test cases, Bug report, Test plan outline |
| **Section 2** | Mobile Automation Testing for *“The App by Appium”* | Robot Framework, Appium | Automated login test suite |
| **Section 3** | API Automation for BookCart API | Pytest, Requests, JSON Schema | GET/POST test suite with schema validation |

---

## Section 1 – Testing Fundamentals

**Objective:** Validate login functionality and ensure correct handling for valid and invalid credentials.  
**Deliverables:**
- `Test_case_Section1.xlsx` — includes 5–8 positive/negative test cases  
- `BugReportSection1.pdf` — defect report: *“No error message displayed when user logs in with invalid credentials”*  
- `README.md` — includes test plan outline and summary  

---

## Section 2 – Mobile App Automation

**Objective:** Automate login flow validation on *The App by Appium*.  
Covers both **valid** and **invalid** credential cases with assertion checks for success/error messages.

**Tools:** `Robot Framework`, `AppiumLibrary`  
**Device:** Android Emulator (API Level 33+)

**Run Command:**
```bash
python -m robot tests/Testcase.robot
Expected Output:

Copy code
2 tests, 2 passed, 0 failed
Reference App: The App by Appium – GitHub Repo
```

## Section 3 – Backend (API) Automation
**Objective:** Validate BookCart API endpoints using Pytest + Requests.
Includes:

GET /Book

POST /Book (with invalid payload & unauthorized check)

Tools: Python 3.10, Pytest, Requests, jsonschema
Reference: BookCart API Swagger

Run Command:

bash
Copy code
pytest -v
Expected Result:

cpp
Copy code
1 passed, 3 skipped
(BookCart API currently restricted / requires auth)

# Setup Instructions
1️ Clone the Repository
bash
Copy code
git clone https://github.com/thebillx/qa-assignment-rawiwat.git
cd qa-assignment-rawiwat
2️ Create Virtual Environment
bash
Copy code
python3 -m venv venv
source venv/bin/activate   # macOS/Linux
3️ Install Dependencies (for API Automation)
bash
Copy code
pip install -r section3_api_automation/requirements.txt
