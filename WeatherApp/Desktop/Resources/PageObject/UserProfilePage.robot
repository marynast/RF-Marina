*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${MyProfile_URL}                        https://home.openweathermap.org/home
${MyProfile_SaveButton_Locator}         //input[@data-disable-with='Create Profile form']
${MyProfile_UsernameInput_Locator}      //input[@id='profile_form_username']
${MyProfile_ChangesSavedAlert_Locator}  //div[@class='panel-body']

*** Keywords ***
Type New User Name At User Profile Page
    [Documentation]  User is at Profile settings page and inputs User name
    [Arguments]  ${NewUsername}
    Wait Until Element Is Enabled  ${MyProfile_UsernameInput_Locator}
    Input Text    ${MyProfile_UsernameInput_Locator}   ${NewUsername}

Click "Save" button At User Profile Page And Verify The Alert Text
    [Documentation]  User is at Profile Settings page and clicks "Save" button and Alert about success appears
    Wait Until Element Is Enabled    ${MyProfile_SaveButton_Locator}
    Click Element    ${MyProfile_SaveButton_Locator}
    Wait Until Element Is Visible    ${MyProfile_ChangesSavedAlert_Locator}


