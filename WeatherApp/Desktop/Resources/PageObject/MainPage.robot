*** Settings ***
Library    SeleniumLibrary
Resource   WeatherApp/Desktop/Desktop_Imports.robot

*** Variables ***
${URL}  https://openweathermap.org/
${MainPage_SignInButton_Locator}  //li[@class='user-li']/a
${MainPage_Loader_Locator}  //div[@class='owm-loader-container']

*** Keywords ***
Go to Main Page
    [Documentation]  User is navigated to the main page
    Go to  ${URL}
    Title Should Be    Сurrent weather and forecast - OpenWeatherMap
    Wait Until Element Is Not Visible    ${MainPage_Loader_Locator}  timeout=30s