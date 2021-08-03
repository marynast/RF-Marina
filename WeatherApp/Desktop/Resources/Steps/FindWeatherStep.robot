*** Settings ***
Resource  Resource.robot

*** Variables ***

*** Keywords ***
Send Get Current Weather By City Name Via API And Get Temperature In Celsius
    [Documentation]  Send GET request to get the current temperature for the city and convert the temperature from
    ...              Kelvin to Celsius
    [Arguments]  ${city_name}  ${api_key}
    API-Keywords.Get Current Weather By City Name Via API  ${city_name}  ${api_key}
    API-Keywords.Get Temperature Value From Response In Celsius

Send Get Current Weather By City Name And Unit Of Measurement And Get Temperature In Fahrenheit
    [Documentation]  Send GET request to get the current temperature in Fahrenheit for the city
    [Arguments]  ${city_name}  ${temperature_unit}  ${api_key}
    API-Keywords.Get Current Weather By City Name And Unit Of Measurement  ${city_name}  ${temperature_unit}  ${api_key}
    API-Keywords.Get Temperature Value From Response In Fahrenheit

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
    [Arguments]  ${city_name}  ${measurement_unit_code}
    ${temperature_value_celsius}=  Get Temperature Value From Response In Celsius
    ${current_temperature_web}=  Get Current Temperature In Web  ${city_name}  ${measurement_unit_code}
    Should Be Equal As Integers   ${temperature_value_celsius}    ${current_temperature_web}

Verify Temparature Returned Via API Equals Temperature In Web (Fahrenheit)
    [Documentation]  Get temperature in Fahrenhei from response and verify that it equals the temperature in Fahrenheit
    ...              in web
    [Arguments]  ${city_name}  ${measurement_unit_code}
    ${temperature_value_fahrenheit}=  Get Temperature Value From Response In Fahrenheit
    ${current_temperature_web}=  Get Current Temperature In Web  ${city_name}  ${measurement_unit_code}
    Should Be Equal As Integers   ${temperature_value_fahrenheit}  ${current_temperature_web}