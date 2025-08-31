# *** Settings ***
# Library    Browser
# Library    FakerLibrary

# *** Variables ***
# ${URL_CADASTRO}    https://${ENV}/cadastro
# ${NOME}            ${faker.name()}
# ${EMAIL}           ${faker.email()}
# ${SENHA}           Teste@123

# *** Keywords ***
# Dado que estou na página de cadastro de lojista
#     New Page    ${URL_CADASTRO}
#     Sleep       2s

# Quando preencho os dados de cadastro
#     Fill Text   xpath=//input[@formcontrolname="nome"]        ${NOME}
#     Fill Text   xpath=//input[@formcontrolname="email"]       ${EMAIL}
#     Fill Text   xpath=//input[@formcontrolname="password"]    ${SENHA}

# E clico em cadastrar
#     Click       text=Cadastrar
#     Sleep       2s

# Então vejo a mensagem de sucesso
#     Wait For Elements State    text=Cadastro realizado com sucesso    visible
#     Highlight Element          text=Cadastro realizado com sucesso
#     Take Screenshot

*** Variables ***
${CAMPO_EMPRESA}       id=empresa
${CAMPO_EMAIL}         id=email
${CAMPO_SENHA}         id=senha
${BOTAO_CADASTRAR}     xpath=//button[text()='Cadastrar']