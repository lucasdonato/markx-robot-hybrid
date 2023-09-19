*** Settings ***
Documentation            Elementos e ações da tela de login

Library       AppiumLibrary

*** Variables ***
${API_IP}         192.168.68.101


*** Keywords ***
Do login
    
    ${element}        Set Variable    accessibility_id=apiIp
    
    Click Element    ${element}
    Input Text       ${element}       ${API_IP}

    Click Element    accessibility_id=signInButton