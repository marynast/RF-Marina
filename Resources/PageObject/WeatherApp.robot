*** Settings ***


Library    SeleniumLibrary

*** Variables ***
${MainPage_SignInButton_Locator}  //a[text()="Sign in"]
${SignIn_UsernameInput_Locator}   //input[@placeholder="Enter email"]
${SignIn_PasswordInput_Locator}   //input[@placeholder="Password"]
${SignIn_SubmitButton_Locator}    //input[@name="commit"]
${SignIn_AlertText_Locator}       //div[@class='panel-body']

${URL}  https://openweathermap.org



*** Keywords ***
Go to Main Page
    Go to  ${URL}
    Title Should Be    Сurrent weather and forecast - OpenWeatherMap
    Sleep    5s
    
Login with valid and invalid credentials
    [Arguments]  ${Username}   ${Password}   ${AlertText}
    Click Element    ${MainPage_SignInButton_Locator}
    Input Text    ${SignIn_UsernameInput_Locator}  ${Username}
    Input Text    ${SignIn_PasswordInput_Locator}   ${Password}
    Click Button    ${SignIn_SubmitButton_Locator}
    Element Text Should Be    ${SignIn_AlertText_Locator}  ${AlertText}