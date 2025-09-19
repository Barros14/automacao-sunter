*** Settings ***
Documentation    Arquivo principal do projeto de automação

Library           Browser  
Library           FakerLibrary
Library           String
Library           Collections
Library           DateTime
Library           RequestsLibrary
Library           JSONLibrary
Library           Process
Library           OperatingSystem
Library           DateTime



Resource    ../pages/login.resource
# Resource    ../pages/cadastro_lojista.resource
Resource    ../pages/cadastro_construtor.resource
Resource    ../pages/recuperar_senha.resource


*** Variables ***
${DEV_URL}        https://dev.cotareconstruir.app/
${EMAIL}     faker.email()
${CPF_FAKE}       faker.cpf()
${NOME_FAKE}      faker.name()
${SENHA_PADRAO}   P@ssw0rd

#### Define o ambiente ###
${ENV}          ${DEV_URL}

### Variáveis de abrir navegador ###
${BROWSER}                chromium 
${HEADLESS}               ${False}

*** Keywords ***


# Gerar CPF Unico
#     ${resultado}=    Run Process    python    gerar_documento.py    cpf    stdout=PIPE
#     ${CPF_FAKE}=    Set Variable    ${resultado.stdout.strip()}
#     RETURN    ${CPF_FAKE}


Abrir o navegador
    New Browser          browser=${BROWSER}
    ...                  headless=${HEADLESS}
    ...                  slowMo=00:00:01.00
    New Page
    
    Go To       ${ENV}
    

Fechar o navegador
    Take Screenshot
    Close Browser

Realizar Login de Construtor
    [Arguments]    ${username}    ${password}  
    
    # Wait For Elements State        text=ou acesse com o seu cadastro    Visible
    Fill Text    xpath=//input[@formcontrolname="email"]    ${username}
    Fill Text    xpath=//input[@formcontrolname="password"]    ${password}
    # Click        text=Entrar

Realizar Login de Lojista
    [Arguments]    ${username}    ${password}  
    
    # Wait For Elements State        text=ou acesse com o seu cadastro    Visible
    Fill Text    xpath=//input[@formcontrolname="email"]    ${username}
    Fill Text    xpath=//input[@formcontrolname="password"]    ${password}
    # Click        text=Entrar

