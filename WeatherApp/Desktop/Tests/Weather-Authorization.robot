*** Settings ***
Documentation  A test suite to verify the login with valid and invalid credentials.
Resource  ../Resources/General.robot
Resource  ../Resources/PageObject/MainPage.robot
Resource  ../Resources/PageObject/SignInPage.robot
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
    ${Invalid}               ${Valid_Password}      ${InvalidCredentials_AlertText}
    ${Valid_Username}        ${Invalid}             ${InvalidCredentials_AlertText}
    ${Invalid}               ${Invalid}             ${InvalidCredentials_AlertText}
    ${EMPTY}                 ${Valid_Password}      ${InvalidCredentials_AlertText}
    ${Valid_Username}        ${EMPTY}               ${InvalidCredentials_AlertText}
    ${EMPTY}                 ${EMPTY}               ${InvalidCredentials_AlertText}
    ${Valid_Username}        ${Valid_Password}      ${ValidCredentials_AlertText}

User logins to the app after a failed login
    [Documentation]  This test case verifies successful login with valid credentials after a failed login with invalid
    ...              credentials
    [Setup]  Run Keywords
                            General.Begin Web Test
                            General.Go to Sign In Page
    SignInPage.Input Username and Password and Click "Submit" Button    ${Invalid}    ${Invalid}
    SignInPage.Verify The Login State    ${InvalidCredentials_AlertText}
    SignInPage.Input Username and Password and Click "Submit" Button   ${Valid_Username}    ${Valid_Password}
    SignInPage.Verify The Login State    ${ValidCredentials_AlertText}


*** Keywords ***
Login With Valid And Invalid Credentials
    [Documentation]  Verifies login with valid and invalid credentials
    [Arguments]  ${Username}   ${Password}   ${AlertText}
    MainPage.Click "Sign In" Button
    SignInPage.Input Username and Password and Click "Submit" Button    ${Username}    ${Password}
    SignInPage.Verify The Login State  ${AlertText}

