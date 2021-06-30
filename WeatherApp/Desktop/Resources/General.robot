*** Settings ***
Library  SeleniumLibrary
Resource  ../Desktop_Imports.robot

*** Variables ***
${Valid_Username}                mstasev+test@gmail.com
${Valid_Password}                Qwerty123
${InvalidCredentials_AlertText}  Invalid Email or password.
${ValidCredentials_AlertText}    Signed in successfully.
${FailedLogin}=  Element should be visible


*** Keywords ***
Begin Web Test
    Open Browser  about:blank  chrome
    Maximize Browser Window
    Set Log Level    Trace

End Web Test
    Close Browser
