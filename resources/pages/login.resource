*** Settings ***

Documentation     Login Actions do Cotar & Construir      
Library           Browser
Library           FakerLibrary
Library           DateTime

*** Variables ***
${ENV}    

*** Keywords ***

Dado que estou na home page do site Cotar & Contruir
    New Browser    chromium    headless=False
    New Page       url=${ENV}/login
    Sleep          3s


Quando preencho as informações para login de lojista
    [Arguments]        ${USUARIO}       ${SENHA}
    Fill Text        xpath=//input[@formcontrolname="email"]        ${USUARIO}       
    Fill Text        xpath=//input[@formcontrolname="password"]      ${SENHA}  

Quando preencho as informações para login de lojista e deixo a senha em branco
    [Arguments]        ${USUARIO}    ${EMPTY}
    Fill Text        xpath=//input[@formcontrolname="email"]        ${USUARIO}       
    Fill Text        xpath=//input[@formcontrolname="password"]      ${EMPTY}

Quando preencho as informações para login com a senha incorreta
    [Arguments]        ${USUARIO}    ${SENHA}
    Fill Text        xpath=//input[@formcontrolname="email"]        ${USUARIO}       
    Fill Text        xpath=//input[@formcontrolname="password"]      ${SENHA}

Quando preencho as informações para login com o usuário incorreto
    [Arguments]        ${USUARIO}    ${SENHA}
    Fill Text        xpath=//input[@formcontrolname="email"]        ${USUARIO}       
    Fill Text        xpath=//input[@formcontrolname="password"]      ${SENHA}

Quando preencho as informações para login e deixo o usuário em branco
    [Arguments]        ${EMPTY}    ${SENHA}
    Fill Text        xpath=//input[@formcontrolname="email"]        ${EMPTY}       
    Fill Text        xpath=//input[@formcontrolname="password"]      ${SENHA}

E clico em entrar
    Sleep    3s   
    Click    text=Entrar     

Então aparece o painel da Cotar & Construir
    Wait For Elements State        text=Casa da Construção    Visible
    Highlight Elements             text=Casa da Construção
    Take Screenshot
    Sleep    3s    

Então aparece o painel de Ofertas Cotar & Construir
    Wait For Elements State        text=Ofertas Cotar & Construir    Visible
    Highlight Elements             text=Ofertas Cotar & Construir
    Take Screenshot
    Sleep    3s  
Então aparece a mensagem de erro para senha em branco
    Wait For Elements State        text=Senha obrigatória    Visible
    Highlight Elements             text=Senha obrigatória
    Take Screenshot
    Sleep    3s

Então aparece a mensagem de erro para senha incorreta
    Wait For Elements State        text=Houve um erro crítico - Detalhe: Credenciais inválidas    Visible
    Highlight Elements             text=Houve um erro crítico - Detalhe: Credenciais inválidas
    Take Screenshot
    Sleep    3s

Então aparece a mensagem de erro para usuário incorreto
    Wait For Elements State        text=Houve um erro crítico - Detalhe: Credenciais inválidas    Visible
    Highlight Elements             text=Houve um erro crítico - Detalhe: Credenciais inválidas
    Take Screenshot
    Sleep    3s

Então aparece a mensagem de erro para usuário em branco
    Wait For Elements State        text=E-mail obrigatório    Visible
    Highlight Elements             text=E-mail obrigatório
    Take Screenshot
    Sleep    3s
