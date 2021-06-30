*** Settings ***
Documentation  A test suite to verify user settings
Resource  ../Desktop_Imports.robot
Suite Setup  Begin Web Test
Suite Teardown  End Web Test


*** Variables ***
${NewUsername}  MarinaNew

*** Test Cases ***
User Changes Name In User Profile
    [Documentation]  Test verifies that logged in user goes to User Profile, changes User Name and new name is displayed
    ...              in navigation menu
    [Setup]  Run Keywords
                            LoginStep.User Is Logged In  ${Valid_Username}    ${Valid_Password}    ${ValidCredentials_AlertText}
                            UserSettingsStep.User Goes to Profile Settings  ${NavigationMenu_UserDropdown_MyProfile_Locator}

    UserSettingsStep.User Types New User Name At User Profile Page And Clicks "Save" Button  ${NewUsername}
    UserSettingsStep.Alert Text Is Displayed After Profile Update  ${MyProfile_ProfileUpdatedSuccessAlert_Text}
    MainPage.Go to Main Page
    UserSettingsStep.User Name Is Displayed In The Navigation Menu  ${NewUsername}

*** Keywords ***

