*** Settings ***

Documentation     Login Actions do Cotar & Construir      
Library           Browser
Library           FakerLibrary
Library           DateTime

*** Variables ***
${ENV}    

*** Keywords ***

Dado que estou na home do Cotar & Contruir
    New Browser    chromium    headless=False
    New Page       url=${ENV}/login
    Sleep          3s

Quando clico em Esqueceu a senha
    Wait For Elements State        text=Esqueceu a senha?    Visible
    Highlight Elements             text=Esqueceu a senha?
    Click    text=Esqueceu a senha?

E preencho o campo com email cadastrado
    Sleep    3s    
    Fill Text    xpath=//input[@formcontrolname="email"]    lojista.lauro@yopmail.com

E clico em Recuperar senha
    Sleep    3s   
    Click    text=Recuperar senha

Então aparece a mensagem de Recuperação de Senha
    Wait For Elements State        text=Solicitacao de recuperação gerada com sucesso    Visible
    Highlight Elements             text=Solicitacao de recuperação gerada com sucesso
    Take Screenshot
    Sleep    3s
    