*** Settings ***
Resource  Resource.robot

*** Variables ***

*** Keywords ***
Send Get Current Weather By City Name Via API
    [Documentation]  Keyword to send GET request to get the current weather by city name via API
    [Arguments]   ${city_name}  ${api_key}  ${longitude}  ${latitude}
    API-Keywords.Get Current Weather By City Name Via API  ${city_name}  ${api_key}  ${longitude}  ${latitude}

Send Get Current Weather By Coordinates Via API
    [Documentation]  Keyword to send GET request to get the current weather by coordinates via API
    [Arguments]   ${latitude}  ${longitude}  ${api_key}
    API-Keywords.Get Current Weather By Coordinates Via API  ${latitude}  ${longitude}  ${api_key}

Send Get Current Weather By City ID Via API
    [Documentation]  Keyword to send GET request to get the current weather by city Id
    [Arguments]  ${city_id}  ${api_key}
    API-Keywords.Get Current Weather By City ID Via API  ${city_id}  ${api_key}

Send Get Current Weather By City Name And Unit Of Measurement
    [Documentation]  Keyword to send GET request to get the current weather by the city name and the unit of temperature
    [Arguments]    ${city_name}  ${temperature_unit}  ${api_key}
    API-Keywords.Get Current Weather By City Name And Unit Of Measurement  ${city_name}  ${temperature_unit}  ${api_key}

Longitude And Latitude Returned For The Given City
    [Documentation]  Keyword to verify that the longitude and latitude refer to the given city
    [Arguments]  ${longitude}  ${latitude}
    API-Keywords.Verify The Coordinates In Response  ${longitude}  ${latitude}

The Results Are Returned For The Given City
    [Documentation]  Keyword to verify that the city name in response is as expected
    [Arguments]  ${request_value}
    API-Keywords.Verify The City Name In Response    ${request_value}

Temperature Is Returned In Expected Unit Of Temperature
    [Documentation]  Keyword to verify that the temperature is returned in expected unit of temperature
    [Arguments]  ${temperature_unit}
    API-Keywords.Verify The Unit Of Measurement    ${temperature_unit}