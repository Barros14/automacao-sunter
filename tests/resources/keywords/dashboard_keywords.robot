*** Keywords ***
Preencher Login
    [Arguments]    ${email}    ${senha}
    Fill Text    id=email    ${email}
    Fill Text    id=senha    ${senha}

Clicar em Entrar
    Click    id=btnLogin

Validar Painel
    Wait For Elements State    id=painelDashboard    visible