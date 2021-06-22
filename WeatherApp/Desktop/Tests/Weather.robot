*** Settings ***
Documentation  A test suite to verify the login with valid and invalid credentials.
Resource  ../Resources/General.robot
Resource  ../Resources/PageObject/WeatherApp-MainPage.robot
Resource  ../Resources/PageObject/WeatherApp-SignInPage.robot
Suite Setup  General.Begin Web Test
Test Setup  Go to Main Page
Suite Teardown  General.End Web Test
Test Template  Login with valid and invalid credentials

*** Variables ***
${InvalidCredentials_AlertText}  Invalid Email or password.
${ValidCredentials_AlertText}    Signed in successfully.
${Invalid}                       invalid
${Valid_Username}                mstasev+test@gmail.com
${Valid_Password}                Qwerty123


*** Test Cases ***                   USERNAME                 PASSWORD               ALERT
Invalid User Name                    ${Invalid}               ${Valid_Password}      ${InvalidCredentials_AlertText}
Invalid Password                     ${Valid_Username}        ${Invalid}             ${InvalidCredentials_AlertText}
Invalid User Name and Password       ${Invalid}               ${Invalid}             ${InvalidCredentials_AlertText}
Empty User Name                      ${EMPTY}                 ${Valid_Password}      ${InvalidCredentials_AlertText}
Empty Password                       ${Valid_Username}        ${EMPTY}               ${InvalidCredentials_AlertText}
Empty User Name and Password         ${EMPTY}                 ${EMPTY}               ${InvalidCredentials_AlertText}
Valid User Name and Valid Password   ${Valid_Username}        ${Valid_Password}      ${ValidCredentials_AlertText}

*** Keywords ***
Login with valid and invalid credentials
    [Documentation]  Verifies login with valid and invalid credentials
    [Arguments]  ${Username}   ${Password}   ${AlertText}

    WeatherApp-MainPage.Click "Sign In" Button
    WeatherApp-SignInPage.Input Username  ${Username}
    WeatherApp-SignInPage.Input Password  ${Password}
    WeatherApp-SignInPage.Click "Sign In" button
    WeatherApp-SignInPage.Verify The Login State  ${AlertText}