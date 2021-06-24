*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MainPage_SignInButton_Locator}  //li[@class='user-li']/a

*** Keywords ***
Click "Sign In" Button
    [Documentation]  User clicks "Sign in" button in navigation menu from Main Page
    Wait Until Element Is Enabled    ${MainPage_SignInButton_Locator}
    Click Element    ${MainPage_SignInButton_Locator}