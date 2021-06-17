*** Settings ***
Documentation  A test suite to verify the login with valid and invalid credentials.
Resource  ../Resources/General.robot
Resource  ../Resources/PageObject/WeatherApp.robot
Suite Setup  General.Begin Web Test
Test Setup  WeatherApp.Go to Main Page
Suite Teardown  General.End Web Test
Test Template  Login with valid and invalid credentials

*** Variables ***


*** Test Cases ***                   USERNAME                 PASSWORD       ALERT
Invalid User Name                    marina2                  Qwerty123      Invalid Email or password.
Invalid Password                     mstasev+test@gmail.com   Qwerty12345    Invalid Email or password.
Invalid User Name and Password       marina3                  Qwerty13       Invalid Email or password.
Empty User Name                      ${EMPTY}                 Qwerty123      Invalid Email or password.
Empty Password                       mstasev+test@gmail.com   ${EMPTY}       Invalid Email or password.
Empty User Name and Password         ${EMPTY}                 ${EMPTY}       Invalid Email or password.
Valid User Name and Valid Password   mstasev+test@gmail.com   Qwerty123      Signed in successfully.