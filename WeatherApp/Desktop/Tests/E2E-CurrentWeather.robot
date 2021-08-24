*** Settings ***
Resource  ../Desktop_Imports.robot
Suite Setup  General.Begin Web Test
Suite Teardown  General.End Web Test

*** Variables ***
${CityName}  Belmopan
${Imperial}  imperial
${Standard}  standard
${Celsius}   '\xc2\xb0C'
${Fahrenheit}  '\xc2\xb0F'

*** Test Cases ***
Get current weather for the city and change the unit of temperature
    [Documentation]  Test to get temperature via api and web for the specific city in different units of measurement and
    ...              verify that the results from api and web equal
    [Setup]  Run Keywords  LoginStep.Login With Valid Crdentials  ${Valid_Username}  ${Valid_Password}
    ...                                                           ${ValidCredentials_AlertText}  login=${True}
    ...      AND           ApiKeysStep.Get Api Key
    ...      AND           MainPage.Go to Main Page
    Log    Step 1: Get current temperature in Kelvin via API for the city Belmopan
    ${apiKey}=  ApiKeysStep.Get Api Key
    FindWeatherStep.Get Temperature By City Name Via API  ${CityName}  ${Standard}  ${apiKey}
    Log    Step 2: In Web input the city name Belmopan in the search field, get the current temperature and verify that it equals the temperature in response from Step 1
    FindWeatherStep.Find Weather By City Name In Web  ${CityName}
    FindWeatherStep.Verify Temparature Returned Via API Equals Temperature In Web (Celsius)  ${CityName}
    ...                                                                                      ${Standard}
    ...                                                                                      ${Celsius}
    ...                                                                                      ${apiKey}
    Log    Step 3: Get current temperature in Fahrenheit via API for the city Belmopan
    FindWeatherStep.Get Temperature By City Name Via API  ${CityName}  ${Imperial}  ${apiKey}
    Log    Step 4: In Web select "Imperial" unit of temperature to get the temperature in Fahrenheit and verify that it equals the temperature in response from Step 3
    FindWeatherStep.Change Unit Of Temperature To Imperial
    FindWeatherStep.Verify Temparature Returned Via API Equals Temperature In Web (Fahrenheit)  ${CityName}
    ...                                                                                         ${Imperial}
    ...                                                                                         ${Fahrenheit}
    ...                                                                                         ${apiKey}
    [Teardown]  Close Browser

*** Keywords ***