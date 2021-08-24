*** Settings ***
Resource  ../Desktop_Imports.robot

*** Variables ***
${CityName}             Belmopan
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
    API-Keywords.Get Current Weather By City Name Via API  ${CityName}  ${Standard}  ${apiKey}
    API-Keywords.Verify The Longitude And Latitude Are Correct  ${Lon}  ${Lat}
    Log    Step 2: Send Get Current Weather By Coordinates Via API
    API-Keywords.Get Current Weather By Coordinates Via API  ${Lat}  ${Lon}  ${APIKey}
    API-Keywords.Verify The City Name Returned By Coordinates Is Correct  ${CityName}
    Log    Step 3: Send Get Current Weather By City ID Via API
    API-Keywords.Get Current Weather By City ID Via API  ${CityId}  ${APIKey}
    API-Keywords.Verify The City Name Returned By City ID Is Correct  ${CityName}


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
    API-Keywords.Get Current Weather By City Name Via API    ${city_name}  ${temperature_unit}  ${api_key}
    API-Keywords.Verify The Unit Of Measurement  ${temperature_unit}