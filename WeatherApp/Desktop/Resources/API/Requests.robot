*** Settings ***
Resource  ../../Desktop_Imports.robot

*** Variables ***
${Base_API_URL}         http://api.openweathermap.org/data/2.5

*** Keywords ***
Send Weather GET
    [Documentation]  Send GET request with specified parameters to get the current weather
    [Arguments]  ${params}
    ${response}=  GET    ${Base_API_URL}/weather  ${params}
    Status Should Be    ${StatusCode}
    [Return]  ${response}
