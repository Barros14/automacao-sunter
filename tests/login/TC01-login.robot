*** Settings ***
Documentation     Teste de login do lojista no Cotar & Construir

Resource          ../../resources/pages/login.resource
Resource          ../../resources/base/base.resource

Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Variables ***
${USUARIO_CONSTRUTOR}    construtor.lauro@yopmail.com
${USUARIO_LOJISTA}       lojista.lauro@yopmail.com
${SENHA_PADRAO}          P@ssw0rd
${SENHA_INCORRETA}       SenhaIncorreta12
${USUARIO_INCORRETO}     usuario_incorreto@yopmail.com
${ENV}                   https://dev.cotareconstruir.app/auth

*** Test Cases ***
Login de Lojista com Dados Validos
    [Tags]    LGN01

    Realizar Login de Lojista         ${USUARIO_LOJISTA}    ${SENHA_PADRAO} 
    E clico em entrar
    Então aparece o painel da Cotar & Construir

Login de Construtor com Dados Validos
    [Tags]    LGN02

    Realizar Login de Construtor         ${USUARIO_CONSTRUTOR}    ${SENHA_PADRAO} 
    E clico em entrar
    Então aparece o painel de Ofertas Cotar & Construir    
Login com Senha em Branco
    [Tags]    LGN03

    Dado que estou na home page do site Cotar & Contruir
    Quando preencho as informações para login de lojista e deixo a senha em branco     ${USUARIO_LOJISTA}    ${EMPTY}
    E clico em entrar
    Então aparece a mensagem de erro para senha em branco

Login com Senha Incorreta
    [Tags]    LGN04
    Dado que estou na home page do site Cotar & Contruir
    Quando preencho as informações para login com a senha incorreta       ${USUARIO_LOJISTA}    ${SENHA_INCORRETA}
    E clico em entrar
    Então aparece a mensagem de erro para senha incorreta

Login com Usuário Incorreto
    [Tags]    LGN05
    Dado que estou na home page do site Cotar & Contruir
    Quando preencho as informações para login com o usuário incorreto       ${USUARIO_INCORRETO}    ${SENHA_PADRAO}
    E clico em entrar
    Então aparece a mensagem de erro para usuário incorreto


Login com Usuário em Branco
    [Tags]    LGN06
    Dado que estou na home page do site Cotar & Contruir
    Quando preencho as informações para login e deixo o usuário em branco       ${EMPTY}    ${SENHA_PADRAO}
    E clico em entrar
    Então aparece a mensagem de erro para usuário em branco



















# *** Settings ***
# Resource    ../../resources/base/base.resource
# Resource    ../../tests/keywords/dashboard_keywords.robot
# Resource    ../../tests/variables/lojista_variables.robot

# *** Test Cases ***
# Login do Lojista com Dados Válido
#     Dado que estou na home page do site Cotar & Construir
#     Quando preencho as informações para login de lojista       lojista.lauro@yopmail.com    P@ssw0rd
#     E clico em entrar
#     Então aparece o painel da Cotar & Construir
