# *** Settings ***
# Library    ../../Keywords/keywords_docs.py

# *** Test Cases ***
# Cadastro Com CPF Valido
#     ${cpf}=    Gerar Cpf Valido    mask=True
#     Log    CPF gerado: ${cpf}

# Cadastro Com CNPJ Valido
#     ${cnpj}=    Gerar Cnpj Valido    mask=True
#     Log    CNPJ gerado: ${cnpj}