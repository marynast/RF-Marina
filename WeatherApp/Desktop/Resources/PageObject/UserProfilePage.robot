*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${MyProfile_URL}                                    ${HomePage_URL}home
${MyProfile_SaveButton_Locator}                     //input[@data-disable-with='Create Profile form']
${MyProfile_UsernameInput_Locator}                  //input[@id='profile_form_username']
${MyProfile_ChangesSavedAlert_Locator}              //div[@class='panel-body']
${MyProfile_ProfileUpdatedSuccessAlert_Locator}     //div[@class='panel-body']
${MyProfile_ProfileUpdatedSuccessAlert_Text}        Profile was updated successfully

*** Keywords ***
Input User Name At User Profile Page
    [Documentation]  User is at Profile settings page and inputs User name
    [Arguments]  ${username}
    Wait Until Element Is Enabled  ${MyProfile_UsernameInput_Locator}
    Input Text    ${MyProfile_UsernameInput_Locator}   ${username}

Click "Save" button At User Profile Page
    [Documentation]  User is at Profile Settings page and clicks "Save" button
    Wait Until Element Is Enabled    ${MyProfile_SaveButton_Locator}
    Click Element    ${MyProfile_SaveButton_Locator}

Verify Alert Text After Profile Update
    [Documentation]  Verify Alert about success appears
    [Arguments]  ${profile_updated_alert_text}

    Wait Until Element Is Visible    ${MyProfile_ChangesSavedAlert_Locator}
    Element Text Should Be    ${MyProfile_ProfileUpdatedSuccessAlert_Locator}  ${profile_updated_alert_text}

