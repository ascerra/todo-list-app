*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    http://localhost:5000

*** Test Cases ***
Should Add Todo And Mark It Done
    [Setup]    Reset Todo List
    ${body}=    Create Dictionary    task=Finish homework
    ${response}=    POST    ${BASE_URL}/todos    json=${body}
    Status Should Be    201
    ${id}=    Get ID From Response    ${response}
    ${response}=    PATCH    ${BASE_URL}/todos/${id}
    Status Should Be    200
    Response Should Be Marked Done    ${response}

*** Keywords ***
Reset Todo List
    POST    ${BASE_URL}/reset

Get ID From Response
    [Arguments]    ${response}
    ${id}=    Set Variable    ${response.json()['id']}
    RETURN    ${id}

Response Should Be Marked Done
    [Arguments]    ${response}
    ${done}=    Get From Dictionary    ${response.json()}    done
    Should Be True    ${done}