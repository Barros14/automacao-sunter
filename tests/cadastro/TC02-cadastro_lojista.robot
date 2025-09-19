# *** Settings ***
# Documentation     Teste de cadastro de lojista
# Resource          ../../resources/pages/cadastro_lojista.resource
# Resource          ../../resources/base/base.resource

# *** Test Cases ***

# Cadastro de Lojista com Dados Válidos
#     [Tags]     CD01
#     [Documentation]    Testa o cadastro de um novo lojista

#     ${NOME}  ${email}  ${celular}   Gerar Dados Dinâmicos
#     Dado que estou na home page de cadastro de Lojista
#     Quando preencho as informações para cadastro de lojista                   ${NOME}    ${email}   ${celular}     
#     E aceito os termos e a política de privacidade
#     E clico no botão registrar
#     Então aparece a mensagem Seu cadastro foi efetuado com sucesso



# Cadastro de novo lojista
#     Abrir o navegador
#     Cadastrar novo lojista
#     Wait For Elements State    text=Cadastro realizado com sucesso    Visible
#     Fechar o navegador
# *** Settings ***
# Documentation     Teste de cadastro de lojista
# Resource          ../../resources/base.resource
# Resource          ../../pages/cadastro_lojista.resource

# *** Test Cases ***
# Cadastro de Lojista com Sucesso
#     New Browser    ${BROWSER}    headless=${HEADLESS}
#     New Page       ${BASE_URL}
#     Preencher Cadastro Lojista
#     Validar Cadastro
#     Close Browser
