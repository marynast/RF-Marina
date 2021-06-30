*** Settings ***
Library    SeleniumLibrary
Resource   ../../../Desktop_Imports.robot


*** Variables ***

*** Keywords ***
User Goes to Profile Settings
    [Documentation]  User selects an option from the user dropdown list
    [Arguments]  ${NavigationMenuUserDropdownOptions}
    NavigationMenu.Click Option In User Dropdown List    ${NavigationMenuUserDropdownOptions}

User Types New User Name At User Profile Page And Clicks "Save" Button
    [Arguments]  ${NewUsername}
    UserProfilePage.Input User Name At User Profile Page    ${NewUsername}
    UserProfilePage.Click "Save" button At User Profile Page

Alert Text Is Displayed After Profile Update
    [Documentation]  Check that expected alert text is displayed
    [Arguments]  ${MyProfile_ProfileUpdatedSuccessAlert_Text}
    UserProfilePage.Verify Alert Text After Profile Update    ${MyProfile_ProfileUpdatedSuccessAlert_Text}

User Name Is Displayed In The Navigation Menu
    [Documentation]  Check that expected username is displayed in the top navigation bar
    [Arguments]  ${NewUsername}
    NavigationMenu.Verify User Name Is Displayed In The Navigation Menu    ${NewUsername}