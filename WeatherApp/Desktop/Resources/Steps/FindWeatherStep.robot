*** Settings ***
Resource  Resource.robot

*** Variables ***

*** Keywords ***
Get Temperature By City Name Via API
    [Documentation]  Send GET request to get the current temperature by the city name in the corresponding temperature unit
    [Arguments]  ${city_name}  ${temperature_unit}  ${api_key}
    API-Keywords.Get Current Weather By City Name Via API  ${city_name}  ${temperature_unit}  ${api_key}
    API-Keywords.Get Temperature Value From Response  ${city_name}  ${temperature_unit}  ${api_key}

Find Weather By City Name In Web
    [Documentation]  In Web input the city name in the search field, click "Search" button and select the city name
    [Arguments]  ${city_name}
    MainPage.Click "Metric" Button
    MainPage.Input City Name In Search City Field    ${city_name}
    MainPage.Click "Search" button
    MainPage.Click City Name From Search Dropdown    ${city_name}

Change Unit Of Temperature To Imperial
    [Documentation]  Select "Imperial" unit of temperature in the main page
    MainPage.Click "Imperial" Button

Verify Temparature Returned Via API Equals Temperature In Web (Celsius)
    [Documentation]  Get converted to Celsius temperature from response and verify that it equals the temperature in web
    [Arguments]  ${city_name}  ${temperature_unit}  ${measurement_unit_code}  ${api_key}
    ${temperature_value}=  Get Temperature Value From Response  ${city_name}  ${temperature_unit}  ${api_key}
    ${temperature_value}=  Convert Kelvin To Celsius    ${temperature_value}
    ${temperature_value_rounded}=  Evaluate    round(${temperature_value})
    ${current_temperature_web}=  Get Current Temperature In Web  ${city_name}  ${measurement_unit_code}
    Should Be Equal As Integers   ${temperature_value_rounded}    ${current_temperature_web}

Verify Temparature Returned Via API Equals Temperature In Web (Fahrenheit)
    [Documentation]  Get temperature in Fahrenhei from response and verify that it equals the temperature in Fahrenheit
    ...              in web
    [Arguments]  ${city_name}  ${temperature_unit}  ${measurement_unit_code}  ${api_key}
    ${temperature_value}=  Get Temperature Value From Response  ${city_name}  ${temperature_unit}  ${api_key}
    ${temperature_value}=  Evaluate    round(${temperature_value})
    ${current_temperature_web}=  Get Current Temperature In Web  ${city_name}  ${measurement_unit_code}
    Should Be Equal As Integers   ${temperature_value}  ${current_temperature_web}