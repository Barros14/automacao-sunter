*** Settings ***
Documentation     Teste de login do Construtor no Cotar & Construir
Library           Browser

Resource          ../../resources/pages/login_construtor.resource
Resource          ../../resources/base/base.resource


*** Variables ***
${USUARIO_CONSTRUTOR}    construtor.lauro@yopmail.com
${SENHA_PADRAO}          P@ssw0rd
${ENV}                   https://dev.cotareconstruir.app/auth

*** Test Cases ***
Login de Construtor com Dados Validos
    Dado que estou na home page do Cotar & Contruir
    Quando preencho as informações para login de Construtor       construtor.lauro@yopmail.com    P@ssw0rd
    E clico em entrar para construtor
    Então aparece o painel de Construtor da Cotar & Construir
    



























# *** Settings ***
# Resource    ../../resources/base/base.resource
# Resource    ../../tests/keywords/dashboard_keywords.robot
# Resource    ../../tests/variables/construtor_variables.robot

# *** Test Cases ***
# Login do Construtor com Dados Válidos
#     Dado que estou na home page do site Cotar & Construir
#     Quando preencho as informações para login de Construtor       construtor.lauro@yopmail.com    P@ssw0rd
#     E clico em entrar
#     Então aparece o painel da Cotar & Construir