*** Settings ***
Documentation  A test suite to verify user settings
Resource  ../Desktop_Imports.robot
Suite Setup  Begin Web Test
Suite Teardown  End Web Test


*** Variables ***
${username}  MarinaNew

*** Test Cases ***
User Changes Name In User Profile
    [Documentation]  Test verifies that logged in user goes to User Profile, changes User Name and new name is displayed
    ...              in navigation menu
    [Setup]  Run Keywords
                            Log  Precondition: User is logged in and is at User Profile Settings page
                            LoginStep.Login With Valid Crdentials  ${Valid_Username}    ${Valid_Password}
                            ...                                    ${ValidCredentials_AlertText}    login=${True}
                            UserSettingsStep.User Goes to Profile Settings  My profile
    Log    Step 1: User inputs new username and clicks "Save" button
    UserSettingsStep.User Types New User Name At User Profile Page And Clicks "Save" Button  ${username}
    UserSettingsStep.Alert Text Is Displayed After Profile Update  ${MyProfile_ProfileUpdatedSuccessAlert_Text}
    Log    Step 2: Ures goes to the main page and new username is displayed in the user menu
    MainPage.Go to Main Page
    UserSettingsStep.User Name Is Displayed In The Navigation Menu  ${username}

*** Keywords ***