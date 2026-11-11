# Testes E2E do Sauce Demo · Robot Framework

[![Robot Framework tests](https://github.com/marcelalimacode/saucedemo-e2e-robot-framework/actions/workflows/tests.yml/badge.svg)](https://github.com/marcelalimacode/saucedemo-e2e-robot-framework/actions/workflows/tests.yml)
![Robot Framework](https://img.shields.io/badge/Robot%20Framework-7-000000?logo=robotframework&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.12-3776AB?logo=python&logoColor=white)
![Selenium](https://img.shields.io/badge/SeleniumLibrary-6-43B02A?logo=selenium&logoColor=white)

**Português** · [English](README.en.md)

## Sobre

Testes automatizados de ponta a ponta (E2E) dos principais fluxos de uma loja online: login, carrinho, ordenação de produtos e checkout.
A suíte cobre tanto o caminho feliz quanto os casos em que o sistema precisa barrar o usuário, e roda automaticamente a cada push no GitHub Actions.

## Sistema testado

[Sauce Demo](https://www.saucedemo.com), uma loja de demonstração criada pela Sauce Labs para praticar automação de testes.

| Usuário | Para que serve |
| --- | --- |
| `standard_user` | Cliente comum, usado nos fluxos positivos |
| `locked_out_user` | Cliente bloqueado, usado para validar a mensagem de bloqueio |

A senha dos dois é `secret_sauce`. Esses usuários de teste são públicos e aparecem na própria tela de login do site.

## Tecnologias

- **Python 3.12**
- **Robot Framework 7** com **SeleniumLibrary**
- **Google Chrome** (sem interface gráfica no CI)
- **GitHub Actions** para integração contínua

## Cenários de teste

| ID | Funcionalidade | Cenário | Tipo | Prioridade |
| --- | --- | --- | --- | --- |
| CT01 | Login | Login com usuário válido | Positivo | Alta |
| CT02 | Login | Login com senha incorreta | Negativo | Alta |
| CT03 | Login | Login com usuário bloqueado | Negativo | Alta |
| CT04 | Login | Login com campos vazios | Negativo | Média |
| CT05 | Login | Logout volta para a tela de login | Positivo | Média |
| CT06 | Carrinho | Adicionar um produto ao carrinho | Positivo | Alta |
| CT07 | Carrinho | Remover um produto do carrinho | Positivo | Média |
| CT08 | Produtos | Ordenar produtos por preço, do menor para o maior | Positivo | Baixa |
| CT09 | Checkout | Finalizar uma compra completa | Positivo | Alta |
| CT10 | Checkout | Continuar o checkout sem preencher os dados | Negativo | Média |

## Estrutura do projeto

```
saucedemo-e2e-robot-framework/
├── tests/                      # Suítes de teste, uma por funcionalidade
│   ├── login.robot             # CT01–CT05
│   ├── cart.robot              # CT06–CT07
│   ├── products.robot          # CT08
│   └── checkout.robot          # CT09–CT10
├── resources/
│   ├── base.robot              # Abrir e fechar o navegador, usado por todas as suítes
│   ├── data/
│   │   └── test_data.robot     # Usuários, dados do cliente e mensagens esperadas
│   └── pages/                  # Page Objects: localizadores e ações de cada tela
│       ├── login_page.robot
│       ├── products_page.robot
│       ├── cart_page.robot
│       └── checkout_page.robot
├── .github/workflows/tests.yml # Pipeline de CI
└── requirements.txt
```

## Decisões de projeto

- **Page Object Model.** Cada tela tem seu próprio arquivo com localizadores e ações. Se a tela mudar, a correção é feita em um lugar só e os testes continuam fáceis de ler.
- **Testes em linguagem de negócio.** Os casos descrevem o que o usuário faz (`Login With`, `Add Product To Cart`, `Finish Checkout`), e não como o Selenium clica.
- **Dados em um só lugar.** Usuários, dados do cliente e mensagens esperadas ficam em `test_data.robot`, sem valores fixos espalhados nos testes.
- **Testes independentes.** Cada teste abre um navegador novo e faz o próprio login, então podem rodar em qualquer ordem.
- **Tags.** `smoke` marca o caminho crítico e `regression` marca o conjunto completo, junto com tags por funcionalidade (`login`, `cart`, `products`, `checkout`).
- **Evidência na falha.** Um print da tela é salvo automaticamente sempre que um teste falha.

## Como rodar

Pré-requisitos: Python 3.10 ou superior e Google Chrome.

```bash
# 1. Clonar o repositório
git clone https://github.com/marcelalimacode/saucedemo-e2e-robot-framework.git
cd saucedemo-e2e-robot-framework

# 2. Instalar as dependências
pip install -r requirements.txt

# 3. Rodar todos os testes (sem abrir a janela do navegador)
robot --outputdir results tests
```

Outras formas de rodar:

```bash
# Ver o navegador enquanto os testes rodam
robot --outputdir results --variable BROWSER:chrome tests

# Só os testes de smoke
robot --outputdir results --include smoke tests

# Só uma funcionalidade
robot --outputdir results tests/checkout.robot
```

Depois da execução, abra `results/report.html` no navegador.

## CI

O workflow em `.github/workflows/tests.yml` roda a cada push e pull request na branch `main`, e também pode ser iniciado manualmente pela aba **Actions**.
Ele instala as dependências, roda a suíte inteira no Chrome sem interface e salva o relatório do Robot como um arquivo para download chamado `robot-report`.

## Relatório

Cada execução no GitHub Actions salva o relatório completo do Robot Framework (`report.html` e `log.html`). Abra a execução mais recente na aba **Actions** e baixe o arquivo `robot-report`.

## Autora

**Marcela Lima** · Analista de QA

[LinkedIn](https://www.linkedin.com/in/marcela-lima-qa) · [GitHub](https://github.com/marcelalimacode)
