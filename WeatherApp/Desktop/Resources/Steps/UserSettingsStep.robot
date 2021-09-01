*** Settings ***
Resource  Resource.robot

*** Variables ***

*** Keywords ***
User Goes to Profile Settings
    [Documentation]  User selects an option from the user dropdown list
    [Arguments]  ${user_dropdown_option}
    NavigationMenu.Click Option In User Dropdown List    ${user_dropdown_option}

User Types New User Name At User Profile Page And Clicks "Save" Button
    [Arguments]  ${username}
    UserProfilePage.Input User Name At User Profile Page    ${username}
    UserProfilePage.Click "Save" button At User Profile Page

Alert Text Is Displayed After Profile Update
    [Documentation]  Check that expected alert text is displayed
    [Arguments]  ${profile_updated_alert_text}
    UserProfilePage.Verify Alert Text After Profile Update    ${profile_updated_alert_text}

User Name Is Displayed In The Navigation Menu
    [Documentation]  Check that expected username is displayed in the top navigation bar
    [Arguments]  ${username}
    NavigationMenu.Verify User Name Is Displayed In The Navigation Menu    ${username}
