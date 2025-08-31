*** Settings ***
Documentation     Teste de login do lojista no Cotar & Construir
Library           Browser

Resource          ../../resources/pages/login_lojista.resource
Resource          ../../resources/base/base.resource

Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Variables ***

${USUARIO_LOJISTA}    lojista.lauro@yopmail.com
${SENHA_PADRAO}       P@ssw0rd
${ENV}                https://dev.cotareconstruir.app/auth

*** Test Cases ***
Login de Lojista com Dados Validos
    [Tags]    LGN01

    Realizar Login de Lojista         ${USUARIO_LOJISTA}    ${SENHA_PADRAO} 
    E clico em entrar
    Então aparece o painel da Cotar & Construir
    
Login com Senha em Branco
    [Tags]    LGN02

    Dado que estou na home page do site Cotar & Contruir
    Quando preencho as informações para login de lojista         ${USUARIO_LOJISTA}    ${EMPTY}
    E clico em entrar
    Então aparece a mensagem de erro para senha em branco

Login com Senha Incorreta
    [Tags]    LGN03
    Dado que estou na home page do site Cotar & Contruir
    Quando preencho as informações para login de lojista       ${USUARIO_LOJISTA}    SenhaIncorreta12
    E clico em entrar
    Então aparece a mensagem de erro para senha incorreta

Login com Usuário Incorreto
    [Tags]    LGN04
    Dado que estou na home page do site Cotar & Contruir
    Quando preencho as informações para login de lojista       usuario_incorreto@ yopmail.com     ${SENHA_PADRAO}
    E clico em entrar
    Então aparece a mensagem de erro para usuário incorreto


Login com Usuário em Branco
    [Tags]    LGN05
    Dado que estou na home page do site Cotar & Contruir
    Quando preencho as informações para login de lojista       ${EMPTY}    ${SENHA_PADRAO}
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
