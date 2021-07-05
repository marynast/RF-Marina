*** Settings ***
Documentation  A test suite to verify the login with valid and invalid credentials.
Resource  ../Desktop_Imports.robot
Suite Setup  General.Begin Web Test
Suite Teardown  General.End Web Test

*** Variables ***
${Invalid}                       invalid


*** Test Cases ***
Login with valid and invalid credentials
    [Documentation]  This test case verifies the login when user inputs configurations of invalid and valid credentials
    [Setup]  Go to Main Page
    [Teardown]  Close Browser
    [Template]  Login with valid and invalid credentials
    ${Invalid}               ${Valid_Password}      ${InvalidCredentials_AlertText}    ${False}
    ${Valid_Username}        ${Invalid}             ${InvalidCredentials_AlertText}    ${False}
    ${Invalid}               ${Invalid}             ${InvalidCredentials_AlertText}    ${False}
    ${EMPTY}                 ${Valid_Password}      ${InvalidCredentials_AlertText}    ${False}
    ${Valid_Username}        ${EMPTY}               ${InvalidCredentials_AlertText}    ${False}
    ${EMPTY}                 ${EMPTY}               ${InvalidCredentials_AlertText}    ${False}
    ${Valid_Username}        ${Valid_Password}      ${ValidCredentials_AlertText}      ${True}

User logins to the app after a failed login
    [Documentation]  This test case verifies successful login with valid credentials after a failed login with invalid
    ...              credentials
    [Setup]    Run Keywords     General.Begin Web Test
    ...        AND              LoginStep.Open "Sign In" Page
    Log    Step 1: User inputs invalid username and password and clicks "Submit" button
    LoginStep.Input Username and Password and Click "Submit" Button    ${Invalid}    ${Invalid}
    LoginStep.Alert Text Is Displayed    ${InvalidCredentials_AlertText}
    LoginStep.Verify The Login Status    ${FailedLogin}
    Log    Step 2: User inputs valid username and password and clicks "Submit" button
    LoginStep.Input Username and Password and Click "Submit" Button   ${Valid_Username}    ${Valid_Password}
    LoginStep.Alert Text Is Displayed    ${ValidCredentials_AlertText}
    LoginStep.Verify The Login Status   login=${True}


*** Keywords ***
Login With Valid And Invalid Credentials
    [Documentation]  Verifies login with valid and invalid credentials
    [Arguments]  ${username}   ${password}   ${alert_text}    ${login}
    Log    Step 1: User clicks "Sign In" button in the navigation menu
    LoginStep.Click "Sign In" Button In Top Navigation Menu
    Log    Step 2: User inputs username and password and clicks "Submit" button
    LoginStep.Input Username and Password and Click "Submit" Button    ${username}    ${password}
    LoginStep.Alert Text Is Displayed    ${alert_text}
    LoginStep.Verify The Login Status   ${login}