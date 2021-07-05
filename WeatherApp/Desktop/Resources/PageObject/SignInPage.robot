*** Settings ***
Library    SeleniumLibrary
Resource   WeatherApp/Desktop/Desktop_Imports.robot

*** Variables ***
${SignIn_UsernameInput_Locator}                 //input[@placeholder="Enter email"]
${SignIn_PasswordInput_Locator}                 //input[@placeholder="Password"]
${SignIn_SubmitButton_Locator}                  //input[@name="commit"]
${Alert_Locator}                                //div[@class='col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2']
${SignIn_AlertText_Locator}                     //div[@class='panel-body']
${SignIn_NavigationMenu_SignInButton_Locator}   //li[@class='user-li']/a
${SignInPage_URL}                               ${HomePage_URL}users/sign_in


*** Keywords ***
Go to Sign In Page
    [Documentation]  User opens Sign In page URL
    Go to  ${SignInPage_URL}
    Title Should Be    Members
    Wait Until Element Is Visible    ${SignIn_SubmitButton_Locator}

Click "Sign In" Button
    [Documentation]  User clicks "Sign in" button in navigation menu from Main Page
    Wait Until Element Is Enabled    ${MainPage_SignInButton_Locator}
    Click Element    ${MainPage_SignInButton_Locator}

Input Username
    [Documentation]  User inputs username at Sign In page
    [Arguments]  ${username}
    Wait Until Element Is Visible    ${SignIn_UsernameInput_Locator}
    Input Text    ${SignIn_UsernameInput_Locator}  ${username}

Input Password
    [Documentation]  User inputs password at Sign In page
    [Arguments]  ${password}
    Wait Until Element Is Visible    ${SignIn_PasswordInput_Locator}
    Input Text    ${SignIn_PasswordInput_Locator}   ${password}

Click "Submit" Button
    [Documentation]  User click "Submit" button at Sign In page
    Wait Until Element Is Visible    ${SignIn_SubmitButton_Locator}
    Click Button    ${SignIn_SubmitButton_Locator}

Verify Alert is displayed
    [Documentation]  Keyword verifies that Alert is displayed on the page
    Wait Until Element Is Visible    ${Alert_Locator}


Verify Alert Text
    [Documentation]  Keyword verifies Alert Text after attempt to login
    [Arguments]  ${alert_text}
    Element Text Should Be    ${SignIn_AlertText_Locator}    ${alert_text}

Verify The Login Status
    [Documentation]  Keyword verifies if user is logged in or not by checking the elements on the page
    [Arguments]  ${login}=${True}
    IF    "${login}" == "${True}"
        Element Should Be Visible    ${UserNavigationTab_MyProfileTab_Locator}
    ELSE
        Element Should Be Visible    ${SignIn_NavigationMenu_SignInButton_Locator}
    END