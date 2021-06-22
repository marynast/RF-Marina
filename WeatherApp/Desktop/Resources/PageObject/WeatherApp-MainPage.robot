*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MainPage_SignInButton_Locator}  //div[@id="desktop-menu"]//a[text()="Sign in"]

*** Keywords ***
Click "Sign In" Button
    [Documentation]  User clicks "Sign in" button in navifation menu from Main Page
    Wait Until Element Is Enabled    ${MainPage_SignInButton_Locator}
    Click Element    ${MainPage_SignInButton_Locator}