*** Settings ***
Documentation            Elementos e ações da tela minhas tarefas

Library       AppiumLibrary

*** Variables ***
${new_task_input}        xpath=//*[contains(@value, "nova tarefa")]
${create_button}         xpath=//*[@name="createTask"]


*** Keywords ***
Create a new task
    [Arguments]        ${task_name}

    Wait Until Element Is Visible       ${new_task_input}    5
    Click Element    ${new_task_input}
    
    Input Text       ${new_task_input}      ${task_name}
    Click Element    ${create_button}

Should have task
    [Arguments]        ${task_name}

    Wait Until Element Is Visible
    ...    xpath=//*[@name="taskText"][@label="${task_name}"]
    ...    5

Remove task by name
    [Arguments]    ${task_name}

    Click Element        xpath=//*[@value="${task_name}"]/../..//*[@name="removeTask"]

    ${button}        Set Variable        xpath=//XCUIElementTypeButton[@name="Sim"]
    
    Wait Until Element Is Visible    ${button}    5
    Click Element                    ${button}

Finish task
    [Arguments]        ${task_name}

    Click Element     xpath=//*[@value="${task_name}"]/..

Task should be done
    [Arguments]        ${task_name}

    Wait Until Element Is Visible       xpath=//*[@label="${task_name}"]/..

    # Get Webelement    xpath=//*[@label="${task_name}"]/..

    Get Element Attribute       //*[@name="updateTask"][@label="${task_name}"]        checked
    