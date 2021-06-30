*** Settings ***
Library    SeleniumLibrary
Resource   ../../../Desktop_Imports.robot

*** Variables ***

*** Keywords ***
Open "Sign In" Page
    [Documentation]  Sign In page is opened
    SignInPage.Go to Sign In Page

Click "Sign In" Button In Top Navigation Menu
    [Documentation]  User clicks "Sign In" button
    SignInPage.Click "Sign In" Button

Input Username and Password and Click "Submit" Button
    [Documentation]  User is at Sign In page and inputs Username, Password and clicks "Submit" button
    [Arguments]    ${Username}    ${Password}
    SignInPage.Input Username    ${Username}
    SignInPage.Input Password    ${Password}
    SignInPage.Click "Submit" Button

Alert Text Is Displayed
    [Documentation]  Check that corresponding alert text is displayed
    [Arguments]    ${AlertText}
    SignInPage.Verify Alert Text    ${AlertText}

Verify The Login Status
    [Documentation]  Check whether the user is logged in or logged out
    [Arguments]    ${LoginStatus}
    SignInPage.Verify The Login Status    ${LoginStatus}

User Is Logged In
    [Documentation]  User is logged in successfully
    [Arguments]    ${Username}    ${Password}    ${AlertText}
    LoginStep.Open "Sign In" Page
    LoginStep.Input Username and Password and Click "Submit" Button    ${Valid_Username}    ${Valid_Password}
    LoginStep.Alert Text Is Displayed    ${ValidCredentials_AlertText}
    LoginStep.Verify The Login Status    ${SuccessfulLogin}

