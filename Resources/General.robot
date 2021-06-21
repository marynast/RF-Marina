*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://openweathermap.org
${MainPage_Loader_Locator}  //div[@class='owm-loader-container']

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  chrome
    Maximize Browser Window

End Web Test
    Close Browser

Go to Main Page
    Go to  ${URL}
    Title Should Be    Сurrent weather and forecast - OpenWeatherMap
    Wait Until Element Is Not Visible    ${MainPage_Loader_Locator}  timeout=30s
