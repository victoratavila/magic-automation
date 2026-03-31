# Magic App Automation

Automated tests for **Magic App** ([https://magic-app.domainfortraining.xyz](https://magic-app.domainfortraining.xyz)) using **Robot Framework** with **Playwright**.

## Project Structure

```text
magic-app-automation/
├─ .venv/
├─ resources/
│  ├─ base.robot
│  ├─ login_keywords.robot
│  └─ reset_password_keywords.robot
├─ tests/
│  ├─ login.robot
│  └─ reset_password.robot
├─ variables/
│  └─ variables.robot
├─ results/
│  ├─ log.html
│  ├─ output.xml
│  ├─ report.html
│  └─ playwright-log.txt
└─ readme.md
```

## Prerequisites

- Python 3.10+
- Node.js
- pip

## Setup

1. **Clone the repository:** ```bash
   git clone <repository-url>
   cd magic-app-automation

````

2. **Create and activate virtual environment:**
```bash
python -m venv .venv
source .venv/bin/activate  # Linux/Mac
.venv\Scripts\activate     # Windows
````

3. **Install dependencies:**

```bash
pip install -r requirements.txt
```

4. **Install Playwright browsers:**

```bash
playwright install
```

## Running Tests

**Run all tests:**

```bash
robot -d results tests/
```

**Run a specific test:**

```bash
robot -d results tests/login.robot
```

**Save reports in results/:**

```bash
robot --outputdir results tests/
```

**Open the HTML report:**

```bash
open results/report.html   # Mac/Linux
start results\report.html  # Windows
```

## Configuration

- Update URLs, credentials, and browser type in `variables/variables.robot`.
- Reusable keywords are in `resources/`.
