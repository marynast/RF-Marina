*** Settings ***
Resource  ../Desktop_Imports.robot
Test Setup   General.Create New Session

*** Variables ***
${Base_API_URL}         http://api.openweathermap.org/data/2.5/weather?
${CityName}             Belmopan
${APIKey}               68320938aa1059333e2a94e89bf98b5e
${Lat}                  17.25
${Lon}                  -88.7667
${CityId}               3582672
${Imperial}             imperial
${Metric}               metric
${Standard}             standard


*** Test Cases ***
Get current weather by city name, coordinates and city ID
    [Documentation]  API test gets the current weather by city name, coordinates or City Id
    API-Keywords.Get Current Weather By City Name Via API  ${CityName}    ${APIKey}    ${Lon}    ${Lat}
    API-Keywords.Get Current Weather By Coordinates Via API  ${Lat}    ${Lon}    ${APIKey}    ${CityName}
    API-Keywords.Get Current Weather By City ID Via API  ${CityId}    ${APIKey}    ${CityName}

Get current weather by city name and verify the unit of temperature
    [Template]   API-Keywords.Get current weather by city name and verify the unit of temperature
    ${CityName}     ${Standard}     ${APIKey}
    ${CityName}     ${Metric}       ${APIKey}
    ${CityName}     ${Imperial}     ${APIKey}
    ${CityName}     ${EMPTY}        ${APIKey}
    ${CityName}     invalid         ${APIKey}

*** Keywords **
