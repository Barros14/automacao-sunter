# *** Settings ***
# Documentation     Cadastro do FatorInnovation
# Library           Browser
# Library           String
# Library           Collections
# Library           DateTime
# Library           BuiltIn
# Library           BuiltIn



# *** Variables ***
# ${ENV}              
# ${SENHA}                 P@ssw0rd
# ${CONFIRMAR_SENHA}       P@ssw0rd
# ${EMPTY}
# ${PREFIX}                qaautocadastro


# *** Keywords ***
# Dado que estou na home page de cadastro

#     New Page    ${ENV}/registro

# *** Settings ***
# Library           Browser

# *** Keywords ***
# Preencher Cadastro Lojista
#     Fill Text    id=nome    ${NOME_FAKE}
#     Fill Text    id=email   ${EMAIL_FAKE}
#     Fill Text    id=cpf     ${CPF_FAKE}
#     Fill Text    id=senha   ${SENHA_PADRAO}
#     Click        id=btnCadastrar

# Validar Cadastro
#     Wait For Elements State    id=sucesso    visible
