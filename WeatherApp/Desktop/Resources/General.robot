*** Settings ***
Library  SeleniumLibrary
Resource  /Users/marina/Python/development/robot-scripts/RF-Marina/WeatherApp/Desktop/Resources/PageObject/SignInPage.robot

*** Variables ***
${URL}  https://openweathermap.org/
${SignInPage_URL}  https://home.openweathermap.org/users/sign_in
${MainPage_Loader_Locator}  //div[@class='owm-loader-container']
${Valid_Username}                mstasev+test@gmail.com
${Valid_Password}                Qwerty123
${InvalidCredentials_AlertText}  Invalid Email or password.
${ValidCredentials_AlertText}    Signed in successfully.

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

Go to Sign In Page
    Go to  ${SignInPage_URL}
    Title Should Be    Members
    Wait Until Element Is Visible    ${SignIn_SubmitButton_Locator}

