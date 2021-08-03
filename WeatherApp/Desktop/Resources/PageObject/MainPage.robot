*** Settings ***
Library    SeleniumLibrary
Resource   WeatherApp/Desktop/Desktop_Imports.robot

*** Variables ***
${MainPage_SignInButton_Locator}  //li[@class='user-li']/a
${MainPage_Loader_Locator}  //div[@class='owm-loader-container']
${MainPage_SearchCityInput_Locator}  //input[@placeholder='Search city']
${MainPage_SearchCity_Button}  //button[@class='button-round dark']
${MainPage_SearchDropdownMenu_Locator}  //ul[@class='search-dropdown-menu']
${MainPage_DropdownCityOption_Locator}  //span[contains(text(),'${city_name}')]
${MainPage_CurrentTemperature_Locator}  //div[@class='current-temp']
${MainPage_CityName_Locator}  //div[@data-v-3e6e9f12]/h2
${MainPage_SwitcherToImperial_Locator}  //div[@class='switch-container']/div[contains(text(),'Imperial: °F, mph')]
${MainPage_SwitcherToMetric_Locator}  //div[@class='switch-container']/div[contains(text(),'Metric: °C, m/s')]

*** Keywords ***
Go to Main Page
    [Documentation]  User is navigated to the main page
    Go to  ${URL}
    Title Should Be    Сurrent weather and forecast - OpenWeatherMap
    Wait Until Element Is Not Visible    ${MainPage_Loader_Locator}  timeout=30s

Input City Name In Search City Field
    [Documentation]  Input the city name into the search field in the main page
    [Arguments]  ${city_name}
    Wait Until Element Is Enabled    ${MainPage_SearchCityInput_Locator}
    Input Text    ${MainPage_SearchCityInput_Locator}  ${city_name}

Click "Search" button
    [Documentation]  Click "Search" button on the main page
    Wait Until Element Is Enabled    ${MainPage_SearchCity_Button}
    Click Button    ${MainPage_SearchCity_Button}

Click City Name From Search Dropdown
    [Documentation]  Click the city name in dropdown list that is displayed after "Search" button is clicked
    [Arguments]  ${city_name}
    Wait Until Element Is Visible    ${MainPage_SearchDropdownMenu_Locator}
    Element Should Contain    ${MainPage_DropdownCityOption_Locator}    ${city_name}
    Click Element    ${MainPage_DropdownCityOption_Locator}

Get Current Temperature In Web
    [Documentation]  Get the value of the current temperature on the main page
    [Arguments]  ${city_name}  ${measurement_unit_code}
    Wait Until Element Contains    ${MainPage_CityName_Locator}  ${city_name}
    Wait Until Element Is Visible    ${MainPage_CurrentTemperature_Locator}
    ${current_temperature_web}=  Get Text    ${MainPage_CurrentTemperature_Locator}
    Return From Keyword  ${current_temperature_web.strip(${measurement_unit_code})}

Click "Metric" Button
    [Documentation]  Click "Metric" button on the main page to change the unit of temperature to Metric
    Wait Until Element Is Visible    ${MainPage_SwitcherToMetric_Locator}
    Click Element    ${MainPage_SwitcherToMetric_Locator}
    Wait Until Element Is Not Visible    ${MainPage_Loader_Locator}

Click "Imperial" Button
    [Documentation]  Click "Imperial" button on the main page to change the unit of temperature to Imperial
    Wait Until Element Is Visible    ${MainPage_SwitcherToImperial_Locator}
    Click Element    ${MainPage_SwitcherToImperial_Locator}
    Wait Until Element Is Not Visible    ${MainPage_Loader_Locator}

