*** Settings ***
Documentation    Configuração usada por todas as suítes: bibliotecas, navegador e páginas.
Library          SeleniumLibrary    timeout=10s    implicit_wait=0s
Resource         dados/dados_teste.robot
Resource         paginas/pagina_login.robot
Resource         paginas/pagina_produtos.robot
Resource         paginas/pagina_carrinho.robot
Resource         paginas/pagina_checkout.robot

*** Variables ***
# Rode com -v NAVEGADOR:chrome para ver o navegador no seu computador
${NAVEGADOR}     headlesschrome
# Pausa entre cada ação. Rode com -v VELOCIDADE:1s para acompanhar os passos devagar
${VELOCIDADE}    0s

*** Keywords ***
Abrir o Sauce Demo
    [Documentation]    Abre um navegador limpo na tela de login.
    ${opcoes}=    Set Variable
    ...    add_argument("--incognito");add_argument("--window-size=1366,900");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_experimental_option("prefs", {"credentials_enable_service": False, "profile.password_manager_enabled": False, "profile.password_manager_leak_detection": False})
    Open Browser    ${URL}    ${NAVEGADOR}    options=${opcoes}
    Set Selenium Speed    ${VELOCIDADE}
    Aguardar a tela de login

Fechar o Sauce Demo
    [Documentation]    Tira um print se o teste falhou e fecha o navegador.
    Run Keyword If Test Failed    Capture Page Screenshot
    Close All Browsers

Abrir o Sauce Demo logado como usuário padrão
    Abrir o Sauce Demo
    Fazer login com    ${USUARIO_PADRAO}    ${SENHA}
    A tela de produtos deve estar aberta
