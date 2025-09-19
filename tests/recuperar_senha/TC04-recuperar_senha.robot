*** Settings ***
Documentation     Teste de Recuperação de Senha no Cotar & Construir
Library           Browser

Resource          ../../resources/pages/login_construtor.resource
Resource          ../../resources/base/base.resource


*** Variables ***
${USUARIO_CONSTRUTOR}    construtor.lauro@yopmail.com
${SENHA_PADRAO}          P@ssw0rd
${ENV}                   https://dev.cotareconstruir.app/auth

*** Test Cases ***
Recuperação de senha
    [Tags]    REC04
    
    Dado que estou na home do Cotar & Contruir
    Quando clico em Esqueceu a senha
    E preencho o campo com email cadastrado
    E clico em Recuperar senha
    Então aparece a mensagem de Recuperação de Senha
