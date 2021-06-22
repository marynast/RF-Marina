*** Settings ***
Library    SeleniumLibrary
Resource   WeatherApp-UserNavigationTab.robot

*** Variables ***
${SignIn_UsernameInput_Locator}                 //input[@placeholder="Enter email"]
${SignIn_PasswordInput_Locator}                 //input[@placeholder="Password"]
${SignIn_SubmitButton_Locator}                  //input[@name="commit"]
${SignIn_AlertText_Locator}                     //div[@class='panel-body']
${SignIn_NavigationMenu_SignInButton_Locator}   //li[@class='user-li']/a

*** Keywords ***
Input Username
    [Documentation]  User inputs Username at Sign In page
    [Arguments]  ${Username}
    Wait Until Element Is Visible    ${SignIn_UsernameInput_Locator}
    Input Text    ${SignIn_UsernameInput_Locator}  ${Username}

Input Password
    [Documentation]  User inputs Password at Sign In page
    [Arguments]  ${Password}
    Wait Until Element Is Visible    ${SignIn_PasswordInput_Locator}
    Input Text    ${SignIn_PasswordInput_Locator}   ${Password}

Click "Sign In" button
    [Documentation]  User clicks "Submit" button to login after Username and Password are filled in
    Wait Until Element Is Visible    ${SignIn_SubmitButton_Locator}
    Click Button    ${SignIn_SubmitButton_Locator}

Verify The Login State
    [Documentation]  Keyword verifies if user is logged in or failed to login by checking the elements on the page
    [Arguments]  ${AlertText}

    Element Text Should Be    ${SignIn_AlertText_Locator}  ${AlertText}
    IF    "${AlertText}" == "${InvalidCredentials_AlertText}"
        Wait Until Element Is Visible    ${SignIn_NavigationMenu_SignInButton_Locator}
    ELSE
        Wait Until Element Is Visible    ${UserNavigationTab_MyProfileTab_Locator}
    END