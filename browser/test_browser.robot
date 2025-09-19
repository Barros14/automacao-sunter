*** Settings ***
Library    Browser

*** Test Cases ***
Abrir site
    New Browser    chromium
    New Page    https://robotframework.org
    Get Title    # Verifica se o título foi carregado
    Close Browser
