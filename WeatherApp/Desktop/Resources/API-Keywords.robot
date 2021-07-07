*** Settings ***
Resource  ../Desktop_Imports.robot

*** Variables ***


*** Keywords ***
Get Current Weather By City Name Via API
    [Documentation]  Keyword to get the current weather by city name via API and verify that the coordinates are as expected
    [Arguments]   ${city_name}    ${api_key}    ${longitude}    ${latitude}
    &{params}=    Create Dictionary    q=${city_name}   appid=${api_key}
    ${response}=  GET    ${Base_API_URL}    params=${params}
    Status Should Be    200
    ${lon_value}=   Get Value From Json    ${response.json()}    $.coord.lon
    Should Be Equal As Strings    ${lon_value[0]}  ${longitude}
    ${lat_value}=   Get Value From Json    ${response.json()}    $.coord.lat
    Should Be Equal As Strings    ${lat_value[0]}  ${latitude}

Get Current Weather By Coordinates Via API
    [Documentation]  Keyword to get the current weather by coordinates via API and verify that the city name is as expected
    [Arguments]   ${latitude}    ${longitude}   ${api_key}    ${city_name}
    &{params}=    Create Dictionary    lat=${latitude}    lon=${longitude}    appid=${api_key}
    ${response}=    GET    ${Base_API_URL}    params=${params}
    Status Should Be    200
    ${name_value}=    Get Value From Json    ${response.json()}    $.name
    Should Be Equal As Strings    ${name_value[0]}    ${city_name}

Get Current Weather By City ID Via API
    [Documentation]  Keyword to get the current weather by city Id via API and verify that the city name is as expected
    [Arguments]    ${city_id}   ${api_key}    ${city_name}
    &{params}=    Create Dictionary    id=${city_id}    appid=${api_key}
    ${response}=  GET    ${Base_API_URL}    params=${params}
    Status Should Be    200
    ${name_value}=   Get Value From Json    ${response.json()}    $.name
    Should Be Equal As Strings    ${name_value[0]}    ${city_name}

Get current weather by city name and verify the unit of temperature
    [Documentation]  Keyword to get the current weather by city name and unit of temperature and verify that
    ...              the temperature is returned in the expected unit
    [Arguments]    ${city_name}    ${temperature_unit}    ${api_key}
    &{params}=     Create Dictionary    q=${city_name}    units=${temperature_unit}    appid=${api_key}
    ${response}=  GET    ${Base_API_URL}    params=${params}
    Status Should Be    200
    ${temperature_value}=  Get Value From Json  ${response.json()}    $.main.temp
    IF    '${temperature_unit}' == '${Metric}'
         ${temperature_value[0]}  Should Be True    10.00 < ${temperature_value[0]} < 49.00
    ELSE IF  '${temperature_unit}' == '${Imperial}'
         ${temperature_value[0]}  Should Be True    50.00 < ${temperature_value[0]} < 122.00
    ELSE
         ${temperature_value[0]}  Should Be True    283.00 < ${temperature_value[0]} < 323.00
    END

