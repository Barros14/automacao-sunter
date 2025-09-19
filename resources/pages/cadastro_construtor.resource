*** Settings ***
Documentation     Cadastro do Construtor
Library           Browser
Library           String
Library           Collections
Library           DateTime
Library           BuiltIn
Library           BuiltIn
Library           FakerLibrary
   


*** Variables ***
${ENV}                   https://dev.cotareconstruir.app/
${SENHA}                 P@ssw0rd
${CONFIRMAR_SENHA}       P@ssw0rd
${EMPTY}
${PREFIX}                Cadastro Contrutor
# ${faker.email(domain='yopmail.com')}    value
${EMAIL}    
${faker}    value
${CPF_FAKE}       ${faker.cpf()}
${NOME_FAKE}      ${faker.name()}
${SENHA_PADRAO}   P@ssw0rd



*** Keywords ***

# Gerar CPF Valido
#    ${CPF_FAKE}=    Gerar Cpf Valido
#     ${CNPJ_FAKE}=   Gerar Cnpj Valido
#     Log             CPF: ${CPF_FAKE}, CNPJ: ${CNPJ_FAKE}


Gerar CPF Unico
    ${unique_part}      Gerar String Aleatória    8
    ${CPF_FAKE}              Set Variable             ${unique_part}-45
    RETURN            ${CPF_FAKE}

Gerar Data De Nascimento Aleatória
    ${unique_part}      Gerar String Aleatória    8
    ${DATA_NASC}        Set Variable              01/01/1950
    RETURN            ${DATA_NASC}

Gerar Celular Unico
    ${timestamp}  Get Current Date  result_format=%H%M%S
    ${CELULAR}    Set Variable      71992${timestamp}
    RETURN      ${CELULAR}

Gerar Telefone Unico
    ${timestamp}  Get Current Date  result_format=%H%M%S
    ${TELEFONE}    Set Variable      qa_${timestamp}@yopmail.com
    RETURN      ${TELEFONE}

Gerar Dados Dinâmicos
    ${CPF_FAKE}     Gerar CPF Unico
    ${NOME_FAKE}    Gerar Nome Unico
    ${DATA_NASC}    Gerar Data De Nascimento Aleatória
    ${TELEFONE}     Gerar Telefone Unico
    ${CELULAR}      Gerar Celular Unico
    ${EMAIL}        Gerar Email Unico

    RETURN   ${CPF_FAKE}  ${NOME_FAKE}  ${DATA_NASC}   ${TELEFONE}   ${CELULAR}  ${EMAIL}    


Gerar Nome Unico
    ${unique_part}      Gerar String Aleatória    8
    ${NOME}             Set Variable              ${PREFIX}${unique_part}
    RETURN            ${NOME}


Gerar String Aleatória
    [Arguments]     ${length}=8
    ${RANDOM_STRING}  Generate Random String  ${length}     abcdefghijklmnopqrstuvwxyz
    RETURN         ${RANDOM_STRING}

Gerar Email Unico
    ${timestamp}  Get Current Date  result_format=%Y%m%d%H%M%S
    ${EMAIL}      Set Variable      qa_${timestamp}@yopmail.com
    RETURN      ${EMAIL}

Gerar Data de Nascimento Unico
    ${timestamp}      Evaluate    random.randint(0, int(time.time()))    modules=random,time
    ${DATA_NASC}      Evaluate    time.strftime('%d/%m/%Y', time.localtime(${timestamp}))    modules=time
    RETURN            ${DATA_NASC}

Dado que estou na home page de cadastro
    New Page    ${ENV}


Quando clico em cadastre agora
    Wait For Elements State    text=Ainda não tem uma conta? Cadastre agora mesmo.    Visible
    Highlight Elements         text=Ainda não tem uma conta? Cadastre agora mesmo.
    Click       text=Ainda não tem uma conta? Cadastre agora mesmo. 
    Sleep       2s

E seleciono a opção de cadastro de construtor
    Wait For Elements State    text=Qual perfil de conta você gostaria de criar?    Visible
    Highlight Elements         text=Qual perfil de conta você gostaria de criar?    
    Click       text=Construtor
    Sleep       2s

E preencho as informações para cadastro de construtor
    [Arguments]      ${CPF_FAKE}   ${NOME_FAKE}   ${DATA_NASC}   ${CELULAR}  ${TELEFONE}

    Fill Text    xpath=//input[@formcontrolname="cpfOrCnpj"]             ${CPF_FAKE}
    Click        text= Avançar   
    Fill Text    xpath=//input[@formcontrolname="fullName"]              ${NOME_FAKE}
    Click        xpath=(//input[@id='birthDate'])[1]
    Fill Text    xpath=(//input[@id='birthDate'])[1]             ${DATA_NASC}
    Click    input#gender
    Wait For Elements State    text=Masculino    visible
    Click        text= Masculino 
    Fill Text    xpath=//input[@formcontrolname="cellphone"]             ${CELULAR}
    Fill Text    xpath=//input[@formcontrolname="telephone"]              ${TELEFONE}
    
E clico em avançar para Dados Cadastrais
    Click        text= Avançar   
    Sleep       5s

E preencho o endereço para Cadastro de Construtor
    [Arguments]    ${CEP}  ${NUMERO}

    Wait For Elements State     xpath=//h5[text()='Endereço']    visible
    Highlight Elements          xpath=//h5[text()='Endereço']
    Click                       xpath=(//input[@id="zipcode"])[1]
    Fill Text                   xpath=(//input[@id="zipcode"])[1]              ${CEP}
    Click                       xpath=(//input[@id="number"])[1]
    Fill Text                   xpath=(//input[@id="number"])[1]           ${NUMERO}   

E clico em avançar para Endereço
    Click        text= Avançar
    Sleep       3s
    
E defino a conta para cadastro de construtor
    [Arguments]    ${EMAIL}   ${SENHA_PADRAO}   ${CONFIRMAR_SENHA} 
   
    Wait For Elements State     text=Seu melhor e-mail             visible
    Highlight Elements          text=Seu melhor e-mail 
    Click        xpath=//input[@formcontrolname="email"]
    Fill Text    xpath=//input[@formcontrolname="email"]         ${EMAIL}
    Click        xpath=(//input[@id="password"])[1]
    Fill Text    xpath=(//input[@id="password"])[1]           ${SENHA_PADRAO}   
    Click        xpath=(//input[@id="confirmPassword"])[1]
    Fill Text    xpath=(//input[@id="confirmPassword"])[1]    ${CONFIRMAR_SENHA}   
    Click        text=Avançar
      
E clico em avançar para definição de conta
    Sleep       3s
    Click       text=Avançar


Então aparece a mensagem de cadastro feito
    Wait For Elements State    text=CADASTRO FEITO!    Visible
    Highlight Elements         text=CADASTRO FEITO!
    Take Screenshot


E defino a conta para cadastro de construtor com senhas diferentes
    [Arguments]    ${EMAIL}   ${SENHA_PADRAO}   ${SENHA_DIFERENTES} 
   
    Wait For Elements State     text=Seu melhor e-mail             visible
    Highlight Elements          text=Seu melhor e-mail 
    Click        xpath=//input[@formcontrolname="email"]
    Fill Text    xpath=//input[@formcontrolname="email"]         ${EMAIL}
    Click        xpath=(//input[@id="password"])[1]
    Fill Text    xpath=(//input[@id="password"])[1]           ${SENHA_PADRAO}   
    Click        xpath=(//input[@id="confirmPassword"])[1]
    Fill Text    xpath=(//input[@id="confirmPassword"])[1]    ${SENHA_DIFERENTES}    
    Click        text=Avançar                

E clico em avançar para definição de conta com senhas diferentes
    Sleep       3s
    Click       text=Avançar   


Então aparece a mensagem de Senhas não conferem
    Wait For Elements State    text=Senhas não conferem    Visible
    Highlight Elements         text=Senhas não conferem
    Take Screenshot


E defino a conta para cadastro de construtor já cadastrado
    [Arguments]    ${EMAIL_JA_CADASTRADO}   ${SENHA_PADRAO}   ${CONFIRMAR_SENHA} 

    Wait For Elements State     text=Seu melhor e-mail             visible
    Highlight Elements          text=Seu melhor e-mail 
    Click        xpath=//input[@formcontrolname="email"]
    Fill Text    xpath=//input[@formcontrolname="email"]         ${EMAIL_JA_CADASTRADO}
    Click        xpath=(//input[@id="password"])[1]
    Fill Text    xpath=(//input[@id="password"])[1]           ${SENHA_PADRAO}   
    Click        xpath=(//input[@id="confirmPassword"])[1]
    Fill Text    xpath=(//input[@id="confirmPassword"])[1]    ${CONFIRMAR_SENHA}   
    Click        text=Avançar

E clico em avançar para definição de conta já cadastrado
    Wait For Elements State    text=Confirmação de Cadastro    Visible
    Highlight Elements         text=Confirmação de Cadastro
    Click       text=Avançar

# Então aparece a mensagem de erro
#     Wait For Elements State    text=Email já cadastrado    Visible
#     Highlight Elements         text=Email já cadastrado
#     Take Screenshot
    










































# Quando preencho as informações para cadastro
#     [Arguments]  ${NOME}  ${email}  ${celular}   
    
#     Fill Text    id=nome                          ${NOME}  
#     Fill Text    id=email                         ${email}
#     Fill Text    id=celular                       ${celular}
#     Fill Text    css=input#usuario                qaautocadastro
#     Fill Text    id=senha                         ${SENHA}
#     Fill Text    id=confirmar_senha               ${CONFIRMAR_SENHA}

# E aceito os termos e a política de privacidade
#     Click       css=input[type="checkbox"][formcontrolname="termosServico"]
#     Sleep       3s

# E clico no botão registrar
#     Click       css=button.btn.btn-primary.w-100.mb-3
#     Sleep       5s

# Então aparece a mensagem Seu cadastro foi efetuado com sucesso.
#     Wait For Elements State    text=Seu cadastro foi efetuado com sucesso,  Visible
#     Highlight Elements         text=Seu cadastro foi efetuado com sucesso,
#     Take Screenshot

# Gerar Dados Dinâmicos
#     ${NOME}       Gerar Nome Unico
#     ${email}      Gerar Email Unico
#     ${celular}    Gerar Telefone Unico
#     RETURN   ${NOME}  ${email}   ${celular}
    
# Gerar Nome Unico
#     ${unique_part}      Gerar String Aleatória    8
#     ${NOME}             Set Variable              ${PREFIX}${unique_part}
#     RETURN            ${NOME}

# # Gerar Usuario Unico
# #     ${unique_part}      Gerar String Aleatória    8
# #     ${usuario}             Set Variable              ${PREFIX}${unique_part}
# #     [RETURN]            ${usuario}


# Gerar String Aleatória
#     [Arguments]     ${length}=8
#     ${RANDOM_STRING}  Generate Random String  ${length}     abcdefghijklmnopqrstuvwxyz
#     RETURN         ${RANDOM_STRING}

# Gerar Email Unico
#     ${timestamp}  Get Current Date  result_format=%Y%m%d%H%M%S
#     ${EMAIL}      Set Variable      qa_${timestamp}@yopmail.com
#     RETURN      ${EMAIL}

# Gerar Telefone Unico
#     ${timestamp}  Get Current Date  result_format=%H%M%S
#     ${CELULAR}    Set Variable      +55 11 999${timestamp}
#     RETURN      ${CELULAR}
# Quando preencho as informações para cadastro incorretos ou vazio
#     [Arguments]   ${NOME}   ${email}   ${celular}    

#     Sleep       5s 
#     Fill Text    id=nome                          ${NOME}  
#     Fill Text    id=email                         ${email}
#     Fill Text    id=celular                       ${celular}
#     Fill Text    css=input#usuario                ${EMPTY}
#     Fill Text    id=senha                         ${SENHA}
#     Fill Text    id=confirmar_senha               ${CONFIRMAR_SENHA}

# Quando preencho as informações para cadastro incorretos
#     [Arguments]   ${NOME}   ${email}   ${celular}    

#     Sleep       5s 
#     Fill Text    id=nome                          ${NOME}  
#     Fill Text    id=email                         ${email}
#     Fill Text    id=celular                       ${celular}
#     Fill Text    css=input#usuario                 qaautocadastro
#     Fill Text    id=senha                         ${SENHA}
#     Fill Text    id=confirmar_senha               ${CONFIRMAR_SENHA}

# Então aparece a mensagem O preenchimento de todos os campos é obrigatório!
#     Wait For Elements State    text=O preenchimento de todos os campos é obrigatório!  Visible
#     Highlight Elements         text=O preenchimento de todos os campos é obrigatório!
#     Take Screenshot

# Então aparece a mensagem Email inválido
#     Wait For Elements State    text=Email inválido      Visible
#     Highlight Elements         text=Email inválido
#     Take Screenshot

# Gerar Dados Dinâmicos Com Email inválido
#     ${NOME}     Gerar Nome Unico
#     ${celular}  Gerar Telefone Unico
#     RETURN   ${NOME}    ${celular}    

# Gerar Dados Dinâmicos Com Email vazio
#     ${NOME}     Gerar Nome Unico
#     ${celular}  Gerar Telefone Unico
#     RETURN   ${NOME}   ${celular} 

# Gerar Dados Dinâmicos com usuario vazio
#     ${NOME}     Gerar Nome Unico
#     ${celular}  Gerar Telefone Unico
#     RETURN   ${NOME}   ${celular} 

# Quando preencho as informações para cadastro com nome inválido ou vazio
#     [Arguments]   ${email}   ${celular}     ${SENHA}    ${CONFIRMAR_SENHA}
    
#     Sleep       5s
#     Fill Text    id=nome                          ${EMPTY}  
#     Fill Text    id=email                         ${email}
#     Fill Text    id=celular                       ${celular}
#     Fill Text    css=input#usuario                qaautocadastro
#     Fill Text    id=senha                         ${SENHA}
#     Fill Text    id=confirmar_senha               ${CONFIRMAR_SENHA}

# Quando preencho as informações para cadastro com usuario inválido ou vazio
#     [Arguments]    ${nome}   ${email}   ${celular}    ${SENHA}    ${CONFIRMAR_SENHA}
    
#     Sleep       5s
#     Fill Text    id=nome                          ${nome}  
#     Fill Text    id=email                         ${email}
#     Fill Text    id=celular                       ${celular}
#     Fill Text    css=input#usuario                qaautocadastro     
#     Fill Text    id=senha                         ${SENHA}
#     Fill Text    id=confirmar_senha               ${CONFIRMAR_SENHA}


# Então aparece a mensagem Nome inválido. Apenas letras e espaços são permitidos
#     Wait For Elements State    text= Nome inválido. Apenas letras e espaços são permitidos     Visible
#     Highlight Elements         text= Nome inválido. Apenas letras e espaços são permitidos 
#     Take Screenshot

# Quando preencho as informações para cadastro com senha vazia
#     [Arguments]  ${NOME}  ${email}   ${celular}     ${EMPTY}    ${EMPTY}
#     Fill Text    id=nome                          ${NOME}  
#     Fill Text    id=email                         ${email}
#     Fill Text    id=celular                       ${celular}
#     Fill Text    css=input#usuario                qaautocadastro
#     Fill Text    id=senha                         ${EMPTY}
#     Fill Text    id=confirmar_senha               ${EMPTY}

# Quando preencho as informações para cadastro com senhas diferentes
#     [Arguments]  ${NOME}  ${email}  ${celular}     ${SENHA_1}    ${SENHA_2}
#     Fill Text    id=nome                          ${NOME}  
#     Fill Text    id=email                         ${email}
#     Fill Text    id=celular                       ${celular}
#     Fill Text    css=input#usuario                qaautocadastro
#     Fill Text    id=senha                         ${SENHA_1}
#     Fill Text    id=confirmar_senha               ${SENHA_2}

# Gerar Dados Dinâmicos Com Nome inválido ou vazio
#     ${email}    Gerar Email Unico
#     ${celular}  Gerar Telefone Unico
#     RETURN    ${email}  ${celular}