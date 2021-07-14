*** Settings ***
Resource  ../Desktop_Imports.robot

*** Variables ***
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
    [Documentation]  API test to get the current weather by city name, coordinates or City Id and verify the response
    ...              corresponds the data in the request
    Log    Step 1: Send Get Current Weather By City Name Via API
    ApiStep.Send Get Current Weather By City Name Via API  ${CityName}  ${APIKey}  ${Lon}  ${Lat}
    ApiStep.Longitude And Latitude Returned For The Given City  ${Lon}  ${Lat}
    Log    Step 2: Send Get Current Weather By Coordinates Via API
    ApiStep.Send Get Current Weather By Coordinates Via API  ${Lat}  ${Lon}  ${APIKey}
    ApiStep.The Results Are Returned For The Given City  ${CityName}
    Log    Step 3: Send Get Current Weather By City ID Via API
    ApiStep.Send Get Current Weather By City ID Via API  ${CityId}  ${APIKey}
    ApiStep.The Results Are Returned For The Given City  ${CityName}


Get current weather by city name and verify the unit of temperature
    [Documentation]  API test to get the current weather by city name and unit of measurement, and verify that
    ...              the temperature is returned in expected unit of measurement
    [Template]   Get current weather by city name and verify the unit of temperature
    ${CityName}     ${Standard}     ${APIKey}
    ${CityName}     ${Metric}       ${APIKey}
    ${CityName}     ${Imperial}     ${APIKey}
    ${CityName}     ${EMPTY}        ${APIKey}
    ${CityName}     invalid         ${APIKey}

*** Keywords ***
Get current weather by city name and verify the unit of temperature
    [Documentation]  Keyword to get the current weather by city name and unit of temperature and verify that
    ...              the temperature is returned in the expected unit
    [Arguments]  ${city_name}  ${temperature_unit}  ${api_key}
    Log    Step 1: Send Get Current Weather By City Name And Unit Of Measurement
    ApiStep.Send Get Current Weather By City Name And Unit Of Measurement  ${city_name}  ${temperature_unit}  ${api_key}
    ApiStep.Temperature Is Returned In Expected Unit Of Temperature  ${temperature_unit}