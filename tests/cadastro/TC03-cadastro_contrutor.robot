*** Settings ***
Documentation    Teste de cadastro de construtor

Resource          ../../resources/base/base.resource
Library           ../../Keywords/keywords_docs.py

Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador



*** Test Cases ***
Cadastro de Construtor com dados válidos
    [Tags]     CD01
    [Documentation]    Testa o cadastro de um novo construtor
    ${CPF_FAKE}   ${NOME_FAKE}   ${DATA_NASC}  ${EMAIL}  ${CELULAR}  ${TELEFONE}  Gerar Dados Dinâmicos

    Dado que estou na home page de cadastro
    Quando clico em cadastre agora
    E seleciono a opção de cadastro de construtor
    E preencho as informações para cadastro de construtor    274.765.090-13   ${NOME_FAKE}   21/07/1980    71 99132-6395    71 3461-1234     
    E clico em avançar para Dados Cadastrais
    E preencho o endereço para Cadastro de Construtor   41350-300     10
    E clico em avançar para Endereço
    E defino a conta para cadastro de construtor    ${EMAIL}   ${SENHA_PADRAO}   ${CONFIRMAR_SENHA} 
    E clico em avançar para definição de conta
    Então aparece a mensagem de cadastro feito



# ***********Cadastro de Construtor com dados Inválidos**********


Cadastro de Construtor com senhas diferentes
    [Tags]     CD02
    [Documentation]    Testa o cadastro de um novo construtor com senhas diferentes
    ${CPF_FAKE}   ${NOME_FAKE}   ${DATA_NASC}  ${EMAIL}  ${CELULAR}  ${TELEFONE}  Gerar Dados Dinâmicos

    Dado que estou na home page de cadastro
    Quando clico em cadastre agora
    E seleciono a opção de cadastro de construtor
    E preencho as informações para cadastro de construtor    274.765.090-13   ${NOME_FAKE}   21/07/1980    71 99132-6395    71 3461-1234     
    E clico em avançar para Dados Cadastrais
    E preencho o endereço para Cadastro de Construtor   41350-300     10
    E clico em avançar para Endereço
    E defino a conta para cadastro de construtor com senhas diferentes   ${EMAIL}   ${SENHA_PADRAO}   SENHA DIFERENTES 
    E clico em avançar para definição de conta
    Então aparece a mensagem de Senhas não conferem


Cadastro com Construtor já cadastrado
    [Tags]     CD03
    [Documentation]    Testa o cadastro com o construtor já cadastrado
    ${CPF_FAKE}   ${NOME_FAKE}   ${DATA_NASC}  ${EMAIL}  ${CELULAR}  ${TELEFONE}  Gerar Dados Dinâmicos

    Dado que estou na home page de cadastro
    Quando clico em cadastre agora
    E seleciono a opção de cadastro de construtor
    E preencho as informações para cadastro de construtor    274.765.090-13   ${NOME_FAKE}   21/07/1980    71 99132-6395    71 3461-1234     
    E clico em avançar para Dados Cadastrais
    E preencho o endereço para Cadastro de Construtor   41350-300     10
    E clico em avançar para Endereço
    E defino a conta para cadastro de construtor já cadastrado     construtor.lauro@yopmail.com  ${SENHA_PADRAO}   ${CONFIRMAR_SENHA}   
    E clico em avançar para definição de conta
    # Então aparece a mensagem de Email já cadastrado    
