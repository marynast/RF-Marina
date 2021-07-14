*** Settings ***
Resource  ../../Desktop_Imports.robot

*** Variables ***
${StatusCode}      200
${CityNameJsonPath}     $.name
${LongitudeJsonPath}    $.coord.lon
${LatitudeJsonPath}     $.coord.lat
${TemperatureJsonPath}  $.main.temp

*** Keywords ***
Get Current Weather By City Name Via API
    [Documentation]  Keyword to get the current weather by city name via API and verify that the coordinates are as expected
    [Arguments]   ${city_name}  ${api_key}  ${longitude}  ${latitude}
    &{params}=  Create Dictionary    q=${city_name}
    ...                              appid=${api_key}
    ${response}=  Requests.Send Weather GET    params=${params}
    ${lon_value}=   Get Object Value      json=${response.json()}
    ...                                   json_path=${LongitudeJsonPath}
    Set Test Variable    ${lon_value}
    ${lat_value}=   Get Object Value      json=${response.json()}
    ...                                   json_path=${LatitudeJsonPath}
    Set Test Variable    ${lat_value}

Get Current Weather By Coordinates Via API
    [Documentation]  Keyword to get the current weather by coordinates via API and verify that the city name is as expected
    [Arguments]  ${latitude}  ${longitude}  ${api_key}
    &{params}=  Create Dictionary    lat=${latitude}
    ...                              lon=${longitude}
    ...                              appid=${api_key}
    ${response}=  Requests.Send Weather GET    params=${params}
    ${object_value}=  Get Object Value    json=${response.json()}
    ...                                   json_path=${CityNameJsonPath}
    Set Test Variable    ${object_value}


Get Current Weather By City ID Via API
    [Documentation]  Keyword to send GET request to get the current weather by city Id and return the city name from response
    [Arguments]  ${city_id}  ${api_key}
    &{params}=  Create Dictionary    id=${city_id}
    ...                              appid=${api_key}
    ${response}=  Requests.Send Weather GET    params=${params}
    ${object_value}=  Get Object Value    json=${response.json()}
    ...                                   json_path=${CityNameJsonPath}
    Set Test Variable    ${object_value}

Get Current Weather By City Name And Unit Of Measurement
    [Documentation]  Keyword to get the current weather by city name and unit of temperature
    [Arguments]  ${city_name}  ${temperature_unit}  ${api_key}
    &{params}=     Create Dictionary    q=${city_name}    units=${temperature_unit}    appid=${api_key}
    ${response}=  Requests.Send Weather GET   params=${params}
    ${object_value}=  Get Object Value   json=${response.json()}
    ...                                       json_path=${TemperatureJsonPath}
    Set Test Variable    ${object_value}

Verify The Unit Of Measurement
    [Documentation]  Keyword to verify the temperature is returned in the expected unit
    [Arguments]  ${temperature_unit}
    IF    '${temperature_unit}' == '${Metric}'
         ${temperature_value[0]}  Should Be True    10.00 < ${object_value} < 49.00
    ELSE IF  '${temperature_unit}' == '${Imperial}'
         ${temperature_value[0]}  Should Be True    50.00 < ${object_value} < 122.00
    ELSE
         ${temperature_value[0]}  Should Be True    283.00 < ${object_value} < 323.00
    END

Verify Response Value Is As Expected
    [Documentation]  Keyword to verify that the given value in response is as expected
    [Arguments]   ${request_value}
    Should Be Equal As Strings    ${object_value}  ${request_value}

Get Object Value
    [Documentation]  Keyword to get object from json by json path name
    [Arguments]  ${json}  ${json_path}
    ${object_value}=  Get Value From Json  ${json}  ${json_path}
    [Return]  ${object_value[0]}

Verify The City Name In Response
    [Documentation]  Keyword to verify that the city in response is as expected
    [Arguments]     ${request_value}
    Verify Response Value Is As Expected    ${request_value}

Verify The Coordinates In Response
    [Documentation]  Keyword to verify that the longitude and latitude in response refer to the city from request
    [Arguments]  ${longitude}    ${latitude}
    Should Be Equal As Strings    ${lon_value}    ${longitude}
    Should Be Equal As Strings   ${lat_value}   ${latitude}
