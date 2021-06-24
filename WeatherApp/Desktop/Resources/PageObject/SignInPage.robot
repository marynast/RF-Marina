*** Settings ***
Library    SeleniumLibrary
Resource   UserNavigationTab.robot
Resource   HomePage.robot

*** Variables ***
${SignIn_UsernameInput_Locator}                 //input[@placeholder="Enter email"]
${SignIn_PasswordInput_Locator}                 //input[@placeholder="Password"]
${SignIn_SubmitButton_Locator}                  //input[@name="commit"]
${SignIn_AlertText_Locator}                     //div[@class='panel-body']
${SignIn_NavigationMenu_SignInButton_Locator}   //li[@class='user-li']/a
${SignInPage_URL}                               https://home.openweathermap.org/users/sign_in

*** Keywords ***
Input Username and Password and Click "Submit" Button
    [Documentation]  User is at Sign In page and inputs Username, Password and clicks "Submit" button
    [Arguments]  ${Username}  ${Password}
    Wait Until Element Is Visible    ${SignIn_UsernameInput_Locator}
    Input Text    ${SignIn_UsernameInput_Locator}  ${Username}
    Wait Until Element Is Visible    ${SignIn_PasswordInput_Locator}
    Input Text    ${SignIn_PasswordInput_Locator}   ${Password}
    Wait Until Element Is Visible    ${SignIn_SubmitButton_Locator}
    Click Button    ${SignIn_SubmitButton_Locator}

Verify The Login State
    [Documentation]  Keyword verifies if user is logged in or failed to login by checking the elements on the page and
    ...              page URL
    [Arguments]  ${AlertText}
    Element Text Should Be    ${SignIn_AlertText_Locator}  ${AlertText}
    IF    "${AlertText}" == "${InvalidCredentials_AlertText}"
        Wait Until Element Is Visible    ${SignIn_NavigationMenu_SignInButton_Locator}
        Location Should Contain    ${SignInPage_URL}
    ELSE
        Wait Until Element Is Visible    ${UserNavigationTab_MyProfileTab_Locator}
        Location Should Be    ${HomePage_URL}
    END