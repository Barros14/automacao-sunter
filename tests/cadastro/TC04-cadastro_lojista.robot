*** Settings ***
Documentation     Teste de cadastro de lojista
Resource          ../../resources/pages/cadastro_lojista.resource
Resource          ../../resources/base/base.resource

*** Test Cases ***
Cadastro de novo lojista
    Abrir o navegador
    Cadastrar novo lojista
    Wait For Elements State    text=Cadastro realizado com sucesso    Visible
    Fechar o navegador
