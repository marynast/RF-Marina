*** Settings ***
Resource  __init__.robot
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
    [Arguments]    ${username}    ${password}
    SignInPage.Input Username    ${username}
    SignInPage.Input Password    ${password}
    SignInPage.Click "Submit" Button

Alert Text Is Displayed
    [Documentation]  Check that corresponding alert text is displayed
    [Arguments]    ${alert_text}
    SignInPage.Verify Alert is displayed
    SignInPage.Verify Alert Text    ${alert_text}

Verify The Login Status
    [Documentation]  Check whether the user is logged in or logged out
    [Arguments]    ${login}
    SignInPage.Verify The Login Status   ${login}

Login With Valid Crdentials
    [Documentation]  User is logged in successfully
    [Arguments]    ${username}    ${password}    ${alert_text}    ${login}
    LoginStep.Open "Sign In" Page
    LoginStep.Input Username and Password and Click "Submit" Button    ${Valid_Username}    ${Valid_Password}
    LoginStep.Alert Text Is Displayed    ${ValidCredentials_AlertText}
    LoginStep.Verify The Login Status   ${login}

