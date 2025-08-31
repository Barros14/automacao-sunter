*** Settings ***

Documentation     Login Actions do Cotar & Construir      
Library           Browser
Library           FakerLibrary
Library           DateTime

*** Variables ***
${ENV}    

*** Keywords ***

Dado que estou na home page do Cotar & Contruir
    New Browser    chromium    headless=False
    New Page       url=${ENV}/login
    Sleep          3s


Quando preencho as informações para login de construtor
    [Arguments]        ${USUARIO}       ${SENHA}
    Fill Text        xpath=//input[@formcontrolname="email"]        ${USUARIO}       
    Fill Text        xpath=//input[@formcontrolname="password"]      ${SENHA}  

E clico em entrar para construtor
    Sleep    3s   
    Click    text=Entrar     

Então aparece o painel de Construtor da Cotar & Construir
    Wait For Elements State        text=Ofertas Cotar & Construir    Visible
    Highlight Elements             text=Ofertas Cotar & Construir
    Take Screenshot
    Sleep    3s    






# *** Variables ***
# ${CAMPO_EMAIL}         id=email
# ${CAMPO_SENHA}         id=senha
# ${BOTAO_ENTRAR}        xpath=//button[text()='Entrar']
