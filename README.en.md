# Sauce Demo E2E Tests · Robot Framework

[![Robot Framework tests](https://github.com/marcelalimacode/saucedemo-e2e-robot-framework/actions/workflows/tests.yml/badge.svg)](https://github.com/marcelalimacode/saucedemo-e2e-robot-framework/actions/workflows/tests.yml)
![Robot Framework](https://img.shields.io/badge/Robot%20Framework-7-000000?logo=robotframework&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.12-3776AB?logo=python&logoColor=white)
![Selenium](https://img.shields.io/badge/SeleniumLibrary-6-43B02A?logo=selenium&logoColor=white)

[Português](README.md) · **English**

## About

End-to-end UI tests for the main flows of an online store: login, cart, product sorting and checkout.
The suite covers both the happy path and the cases where the application must block the user, and it runs automatically on every push with GitHub Actions.

## Application under test

[Sauce Demo](https://www.saucedemo.com), a demo e-commerce site built by Sauce Labs for test automation practice.

| User | Purpose |
| --- | --- |
| `standard_user` | Regular customer, used in the positive flows |
| `locked_out_user` | Blocked customer, used to check the lockout message |

The password for both is `secret_sauce`. These public test users are listed on the site's own login page.

## Tech stack

- **Python 3.12**
- **Robot Framework 7** with **SeleniumLibrary**
- **Google Chrome** (headless in CI)
- **GitHub Actions** for continuous integration

## Test scenarios

| ID | Feature | Scenario | Type | Priority |
| --- | --- | --- | --- | --- |
| CT01 | Login | Login with valid user | Positive | High |
| CT02 | Login | Login with wrong password | Negative | High |
| CT03 | Login | Login with locked out user | Negative | High |
| CT04 | Login | Login with empty fields | Negative | Medium |
| CT05 | Login | Logout returns to the login page | Positive | Medium |
| CT06 | Cart | Add a product to the cart | Positive | High |
| CT07 | Cart | Remove a product from the cart | Positive | Medium |
| CT08 | Products | Sort products by price from low to high | Positive | Low |
| CT09 | Checkout | Complete a purchase | Positive | High |
| CT10 | Checkout | Continue checkout without customer information | Negative | Medium |

## Project structure

```
saucedemo-e2e-robot-framework/
├── testes/                         # Test suites, one per feature
│   ├── login.robot                 # CT01–CT05
│   ├── carrinho.robot              # CT06–CT07
│   ├── produtos.robot              # CT08
│   └── checkout.robot              # CT09–CT10
├── recursos/
│   ├── base.robot                  # Browser setup and teardown shared by all suites
│   ├── dados/
│   │   └── dados_teste.robot       # Users, customer data and expected messages
│   └── paginas/                    # Page Objects: elements and actions per screen
│       ├── pagina_login.robot
│       ├── pagina_produtos.robot
│       ├── pagina_carrinho.robot
│       └── pagina_checkout.robot
├── .github/workflows/tests.yml     # CI pipeline
└── requirements.txt
```

## Design decisions

- **Page Object Model.** Each screen has its own resource file with its locators and actions, so a change in the UI is fixed in one place and the tests stay readable.
- **Business-readable tests.** Test cases describe what the user does (`Fazer login com`, `Adicionar o produto ao carrinho`, `Finalizar a compra`), not how Selenium clicks.
- **Data in one place.** Users, customer data and expected messages live in `dados_teste.robot`, so tests never hard-code values.
- **Independent tests.** Every test opens a fresh browser and logs in on its own, so tests can run in any order.
- **Tags.** `smoke` marks the critical path and `regressao` marks the full set, together with feature tags (`login`, `carrinho`, `produtos`, `checkout`).
- **Evidence on failure.** A screenshot is captured automatically whenever a test fails.

## How to run

The project code (test names, keywords, variables and files) is written in Portuguese. Robot Framework and SeleniumLibrary keywords stay in English, as part of the tool.


Requirements: Python 3.10+ and Google Chrome.

```bash
# 1. Clone the repository
git clone https://github.com/marcelalimacode/saucedemo-e2e-robot-framework.git
cd saucedemo-e2e-robot-framework

# 2. Install the dependencies
pip install -r requirements.txt

# 3. Run all tests (headless)
robot --outputdir results testes
```

More ways to run:

```bash
# Watch the browser while the tests run
robot --outputdir results --variable NAVEGADOR:chrome testes

# Watch it slowly, with 1 second between each action
robot --outputdir results --variable NAVEGADOR:chrome --variable VELOCIDADE:1s testes

# Smoke tests only
robot --outputdir results --include smoke testes

# A single feature
robot --outputdir results testes/checkout.robot

# A single scenario
robot --outputdir results --variable NAVEGADOR:chrome --test "CT01*" testes
```

After the run, open `results/report.html` in your browser.

## CI

The workflow in `.github/workflows/tests.yml` runs on every push and pull request to `main`, and can also be started by hand from the **Actions** tab.
It installs the dependencies, runs the whole suite in headless Chrome and saves the Robot report as a downloadable artifact named `robot-report`.

## Report

Every run on GitHub Actions saves the full Robot Framework report (`report.html` and `log.html`). Open the latest run in the **Actions** tab and download the `robot-report` artifact.

## Author

**Marcela Lima** · QA Analyst

[LinkedIn](https://www.linkedin.com/in/marcela-lima-qa) · [GitHub](https://github.com/marcelalimacode)
